import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';

import 'element/text_theme.dart';

ThemeData lightThemeData() {
  return ThemeData(
    primaryColor: darkGreyColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: darkGreyColor,
      secondary: darkGreenColor,
      secondaryContainer: lightGreenColor,
      background: yellowColor,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightGreyColor,
    textTheme: CustomTextTheme.textThemeLight,
    appBarTheme: AppBarTheme(
      backgroundColor: darkGreyColor,
      elevation: 0,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.0),
        ),
      ),
      titleTextStyle: GoogleFonts.poppins(
        color: lightGreyColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
      iconTheme: const IconThemeData(
        color: lightGreyColor,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkGreyColor,
      elevation: 0.0,
      selectedIconTheme: IconThemeData(
        color: darkGreyColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: lightGreyColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        elevation: MaterialStateProperty.all<double>(0.0),
        backgroundColor: MaterialStateProperty.all<Color>(lightGreenColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelStyle: GoogleFonts.poppins(
        color: lightGreyColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
      hintStyle: GoogleFonts.poppins(
        color: lightGreyColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      filled: true,
      fillColor: Colors.white24,
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(90.0)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(90.0)),
        borderSide: BorderSide.none,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(90.0)),
        borderSide: BorderSide.none,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(90.0)),
        borderSide: BorderSide.none,
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(90.0)),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
