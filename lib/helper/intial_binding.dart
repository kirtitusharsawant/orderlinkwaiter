import 'package:get/get.dart';
import 'package:waiterbookadmin/controller/auth_controller.dart';
import 'package:waiterbookadmin/controller/internet_controller.dart';
import 'package:waiterbookadmin/controller/order_controller.dart';
import 'package:waiterbookadmin/controller/screen_handler_controller.dart';
import 'package:waiterbookadmin/controller/shared_preference_controller.dart';
import 'package:waiterbookadmin/controller/splash_controller.dart';
import 'package:waiterbookadmin/theme/controller/change_theme_controller.dart';
import 'package:waiterbookadmin/theme/controller/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(ThemeController());
    Get.put(ChangeThemeController());
    Get.put(SharedPreferenceController());
    Get.put(InternetController());
    Get.put(ScreenHandlerController());
    Get.put(PhoneAuthController());

    Get.put(OrderController());
  }
}
