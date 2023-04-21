import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';
import 'package:waiterbookadmin/constant/image_constant.dart';
import 'package:waiterbookadmin/screen/screen_handler_screen/screen_handler.dart';

class NoInternetPhone extends StatelessWidget {
  const NoInternetPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    internetController.onInit();
    return Obx(() {
      if (internetController.internetStatus.toString() == "NOINTERNET") {
        return const NoInternet();
      } else {
        return const ScreenHandler();
      }
    });
  }
}

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70.sp,
              width: 70.sp,
              child: Lottie.asset(noInternet),
            ),
            Text(
              'nointernet'.tr,
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
