import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';
import 'package:waiterbookadmin/helper/intial_binding.dart';
import 'package:waiterbookadmin/localization/locale_string.dart';
import 'package:waiterbookadmin/screen/splash_screen/splash_screen.dart';
import 'package:waiterbookadmin/theme/controller/theme_controller.dart';
import 'package:waiterbookadmin/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: LocaleString(),
            locale: const Locale('en', 'US'),
            // locale: const Locale('mar', 'IN'),
            // locale: const Locale('hin', 'IN'),
            title: 'Order Link',
            initialBinding: InitialBinding(),
            home: const SpalshScreen(),
            themeMode: themeController.themeStateFromHiveSettingBox,
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.darkTheme,
          );
        });
  }
}
