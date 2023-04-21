import 'package:flutter/material.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';

import 'element/text_theme.dart';

ThemeData darkThemeData() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: blackColor,
    textTheme: CustomTextTheme.textThemeDark,
    appBarTheme: const AppBarTheme(centerTitle: true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
      ),
    ),
  );
}
