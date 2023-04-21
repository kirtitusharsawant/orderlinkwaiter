import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';
import 'package:waiterbookadmin/screen/dashboard_screen/dashboard_screen.dart';
import 'package:waiterbookadmin/screen/login_screen/login_screen.dart';
import 'package:waiterbookadmin/screen/otp_screen/otp_screen.dart';

class ScreenHandler extends StatelessWidget {
  const ScreenHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenHandlerController.onInit();
    return Obx(() {
      if (screenHandlerController.screenValue.value == "DASHBOARD") {
        return const DashboardScreen();
      } else if (screenHandlerController.screenValue.value == "OTP") {
        return const OtpScreen();
      } else {
        // return const LoginScreen();
        return const DashboardScreen();
      }
    });
  }
}
