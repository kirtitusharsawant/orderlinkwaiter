import 'dart:async';

import 'package:get/get.dart';
import 'package:waiterbookadmin/screen/no_internet_screen/no_internet_screen.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();
  @override
  void onInit() {
    super.onInit();
    startTime();
  }

  startTime() async {
    var _duration = const Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    await Get.offAll(const NoInternetScreen());
  }
}
