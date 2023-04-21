import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';
import 'package:waiterbookadmin/screen/loading_screen/loading_screen.dart';

class OtpScreenPhone extends StatelessWidget {
  const OtpScreenPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (phoneAuthController.isLoading.value) {
          return const LoadingScreen();
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildHeaderWidget(context),
                _buildBottomWidget(context),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _buildHeaderWidget(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.30,
      width: double.infinity,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20, left: 20),
          child: Text(
            'enterOtp'.tr,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomWidget(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return Container(
      height: Get.height * 0.70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'enterOtpSentTo'.tr,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: lightGreyColor,
                    ),
              ),
            ),
            _buildSizedBox(),
            PinCodeTextField(
              backgroundColor: darkGreyColor,
              onChanged: (otp) {
                // enterotpController.validatebuttonactive(otp.length);
              },
              autoDismissKeyboard: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSubmitted: (otp) {},
              appContext: context,
              pastedTextStyle: const TextStyle(
                color: darkGreyColor,
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              obscureText: false,
              obscuringCharacter: '*',
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (otp) {
                if (otp!.isEmpty && otp.length < 6) {
                  return "Please enter a valid otp";
                }
                return null;
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(7),
                fieldHeight: 42.sp,
                fieldWidth: 42.sp,
                activeColor: greyColor,
                activeFillColor: greyColor,
                inactiveFillColor: greyColor,
                selectedFillColor: greyColor,
                selectedColor: greyColor,
                inactiveColor: greyColor,
                borderWidth: 0.0,
              ),
              cursorColor: darkGreenColor,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              // errorAnimationController: errorController,
              // controller: enterotpController.otpController,
              controller: otpController,
              keyboardType: TextInputType.number,
              beforeTextPaste: (text) {
                return true;
              },
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                height: Get.height * 0.075,
                child: ElevatedButton(
                  onPressed: () {
                    phoneAuthController.signInWithPhoneNumber(
                      otpController.text.toString(),
                      phoneAuthController.phone.value,
                    );
                  },
                  child: Text(
                    'verifyOtp'.tr,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizedBox() {
    return const SizedBox(
      height: 20,
    );
  }
}
