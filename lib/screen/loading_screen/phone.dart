import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';

class LoadingPhone extends StatelessWidget {
  const LoadingPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreyColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.2,
              width: Get.height * 0.2,
              child: Lottie.asset('assets/lottie/loading.json'),
            ),
          ],
        ),
      ),
    );
  }
}
