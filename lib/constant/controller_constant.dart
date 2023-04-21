import 'package:waiterbookadmin/controller/auth_controller.dart';
import 'package:waiterbookadmin/controller/internet_controller.dart';
import 'package:waiterbookadmin/controller/screen_handler_controller.dart';
import 'package:waiterbookadmin/controller/shared_preference_controller.dart';
import 'package:waiterbookadmin/controller/splash_controller.dart';
import 'package:waiterbookadmin/theme/controller/change_theme_controller.dart';
import 'package:waiterbookadmin/theme/controller/theme_controller.dart';

ThemeController themeController = ThemeController.instance;
ChangeThemeController changeThemeController = ChangeThemeController.instance;
InternetController internetController = InternetController.instance;
SharedPreferenceController sharedPreferenceController =
    SharedPreferenceController.instance;
ScreenHandlerController screenHandlerController =
    ScreenHandlerController.instance;
SplashController splashController = SplashController.instance;
PhoneAuthController phoneAuthController = PhoneAuthController.instance;
