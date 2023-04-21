import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';
import 'package:waiterbookadmin/constant/firebase_constant.dart';
import 'package:waiterbookadmin/screen/no_internet_screen/no_internet_screen.dart';

class PhoneAuthController extends GetxController {
  static PhoneAuthController instance = Get.find();
  var isLoading = false.obs;
  var phone = "".obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateAndLogin() {
    if (formKey.currentState!.validate()) {
      doesUserExist();
    }
  }

  void loadingTrue() {
    isLoading(true);
  }

  void loadingFalse() {
    isLoading(false);
  }

  String? verificationId;
  String? errorMessage = '';

  Future<void> doesUserExist() async {
    loadingTrue();
    String phoneNumber = "+91${phoneController.text}";
    phone.value = phoneNumber;
    final QuerySnapshot result = await firebaseFirestore
        .collection('users')
        .where(
          'phone',
          isEqualTo: phone.value.toString().trim(),
        )
        .get();

    final List<DocumentSnapshot> documents = await result.docs;
    if (documents.isEmpty) {
      loadingFalse();
      checkIfPhoneExistinLeads();
    } else {
      if (documents.first.get('isActive') == true) {
        verifyPhoneNumber(phone.value);
      } else {
        loadingFalse();
        screenHandlerController.changeToWaiting();
      }
    }
  }

  void checkIfPhoneExistinLeads() async {
    final QuerySnapshot result = await firebaseFirestore
        .collection('leads')
        .where(
          'phone',
          isEqualTo: phone.value.toString().trim(),
        )
        .get();

    final List<DocumentSnapshot> documents = result.docs;
    if (documents.isEmpty) {
      screenHandlerController.changeToRequestAccess();
    } else {
      screenHandlerController.changeToWaiting();
    }
  }

  Future<void> verifyPhoneNumber(String number) async {
    loadingTrue();
    // ignore: prefer_function_declarations_over_variables
    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      verificationId = verId;
      screenHandlerController.changeToOtp();
      loadingFalse();
    };
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: number.trim(),
          codeAutoRetrievalTimeout: (String verId) {
            verificationId = verId;
          },
          codeSent: smsOTPSent,
          timeout: const Duration(seconds: 120),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            log("${phoneAuthCredential}lets make this work");
          },
          verificationFailed: (FirebaseAuthException exceptio) {
            log('${exceptio.message} + something is wrong');
            loadingFalse();
          });
    } catch (e) {
      handleError1(e);
      errorMessage = e.toString();
      loadingFalse();
    }
  }

  handleError1(error) {
    print(error);
    errorMessage = error.toString();
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        print("The verification code is invalid");
        break;
      default:
        errorMessage = error.message;
        break;
    }
  }

  Future<void> signInWithPhoneNumber(String otp, String phoneNumber) async {
    loadingTrue();
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );
      final UserCredential user = await auth.signInWithCredential(credential);
      final User currentUser = auth.currentUser!;
      sharedPreferenceController.setIsLoggedIn(true);
      await getAndSetUser(currentUser.uid);
      loadingFalse();
      screenHandlerController.changeToDashboard();
    } catch (e) {
      loadingFalse();
      print(e.toString());
      Get.snackbar("Login Status", "Error While Logging In. Please Re-Login");
    }
  }

  Future getAndSetUser(String uid) async {
    try {
      DocumentReference documentReference =
          firebaseFirestore.collection('users').doc(uid);
      DocumentSnapshot docSnapshot = await documentReference.get();
      await sharedPreferenceController.setUser(
        docSnapshot.get('id').toString(),
        docSnapshot.get('hotelId').toString(),
        docSnapshot.get('phone').toString(),
      );
      await saveHotelname();
    } catch (e) {
      return false;
    }
  }

  Future saveHotelname() async {
    String? hotelId = await sharedPreferenceController.getHotelId();
    DocumentSnapshot documentSnapshot = await firebaseFirestore
        .collection("restaurants")
        .doc(hotelId?.trim().toString())
        .get();
    await sharedPreferenceController.setHotelName(
      documentSnapshot['name'].toString(),
    );
  }

  Future<void> logOutUser() async {
    await sharedPreferenceController.removeAll();
    await auth.signOut();
    Get.offAll(const NoInternetScreen());
  }
}
