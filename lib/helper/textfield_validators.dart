import 'package:get/get.dart';

String? validateMobileNumber(String? value) {
  RegExp regex = RegExp(r'^[6789]\d{9}$');
  print(regex.hasMatch(value!).toString());
  if (value.isNotEmpty && (value.length == 10) && regex.hasMatch(value)) {
    return null;
  } else {
    return 'Please enter valid mobile number.';
  }
}

String? validateItemName(String? value) {
  RegExp regex = RegExp(r'[a-zA-Z]+$');
  if (value!.isNotEmpty && (value.length < 25) && regex.hasMatch(value)) {
    return null;
  } else {
    return 'Enter valid item name';
  }
}

String? validateHotelName(String? value) {
  RegExp regex = RegExp(r'[a-zA-Z]+$');
  if (value!.isNotEmpty && (value.length < 25) && regex.hasMatch(value)) {
    return null;
  } else {
    return 'Enter valid hotel name';
  }
}

String? validateOwnerlName(String? value) {
  RegExp regex = RegExp(r'[a-zA-Z]+$');
  if (value!.isNotEmpty && (value.length < 25) && regex.hasMatch(value)) {
    return null;
  } else {
    return 'Enter valid owner name';
  }
}

String? validateEmail(String? email) {
  if (!GetUtils.isEmail(email!)) {
    return "Enter valid email";
  }
  return null;
}
