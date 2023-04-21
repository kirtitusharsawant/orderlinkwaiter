import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';

class ChangeThemeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static ChangeThemeController instance = Get.find();
  Rx<String> currentModeName = ''.obs;

  RxBool isDarkMode = false.obs;

  late Color textColor;
  double fontSize = 20;
  late AnimationController animationController;

  @override
  void onInit() {
    isDarkMode.value = themeController.isDarkTheme;
    currentModeName.value = themeController.isDarkTheme ? 'Dark' : 'Light';

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 430));
    animationController.reset();
    textColor = isDarkMode.value ? Colors.white : Colors.red;
    fontSize = isDarkMode.value ? 30 : 20;

    super.onInit();
  }

  void changeAppTheme() => _changeTheme();

  bool toggleTheme() {
    _changeTheme();
    return isDarkMode.value;
  }

  void _animate() {
    if (isDarkMode.value) {
      fontSize = 30;
      textColor = Colors.white;
      animationController.reverse();
    } else {
      fontSize = 20;
      textColor = Colors.red;
      animationController.forward();
    }
  }

  void _changeTheme() {
    themeController.changeTheme(
      isDarkMode: isDarkMode,
      modeName: currentModeName,
    );
    _animate();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
