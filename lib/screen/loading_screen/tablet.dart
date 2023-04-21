import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingTablet extends StatelessWidget {
  const LoadingTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: SizedBox(
        height: Get.height * 0.15,
        width: Get.width * 0.25,
        child: Lottie.asset('assets/lottie/loading.json'),
      ),
    );
  }
}
