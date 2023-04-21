import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';

class CustomTextTheme {
  static const _textColorLight = darkGreyColor;
  static const _textColorDark = lightGreyColor;

  static TextTheme get textThemeLight {
    return _textTheme(textColor: _textColorLight);
  }

  static TextTheme get textThemeDark {
    return _textTheme(textColor: _textColorDark);
  }

  static TextTheme _textTheme({required Color textColor}) {
    const FontWeight _light = FontWeight.w300;
    const FontWeight _regular = FontWeight.w400;
    const FontWeight _medium = FontWeight.w500;
    const FontWeight _semiBold = FontWeight.w600;
    const FontWeight _bold = FontWeight.w800;

    return TextTheme(
      headline1: GoogleFonts.poppins(
        fontSize: 20.sp,
        color: textColor,
        fontWeight: _medium,
        letterSpacing: 0.0,
      ),
      headline2: GoogleFonts.poppins(
        color: textColor,
        fontSize: 18.sp,
        fontWeight: _bold,
        letterSpacing: 0.0,
      ),
      headline3: GoogleFonts.poppins(
        color: textColor,
        fontSize: 16.sp,
        fontWeight: _medium,
        letterSpacing: 0.0,
      ),
      headline4: GoogleFonts.poppins(
        color: textColor,
        fontSize: 14.sp,
        fontWeight: _regular,
        letterSpacing: 0.0,
      ),
      headline5: GoogleFonts.poppins(
        color: textColor,
        fontSize: 12.sp,
        fontWeight: _regular,
        letterSpacing: 0.0,
      ),
      headline6: GoogleFonts.poppins(
        color: textColor,
        fontSize: 10.sp,
        fontWeight: _medium,
        letterSpacing: 0.0,
      ),
      // bodyText1: GoogleFonts.poppins(
      //   color: textColor,
      //   fontSize: 16,
      //   fontWeight: _regular,
      //   letterSpacing: 0.5,
      // ),
      // bodyText2: GoogleFonts.poppins(
      //   color: textColor,
      //   fontSize: 14,
      //   fontWeight: _regular,
      //   letterSpacing: 0.25,
      // ),
      button: GoogleFonts.poppins(
        color: textColor,
        fontSize: 18,
        fontWeight: _medium,
        letterSpacing: 0.0,
      ),
      caption: GoogleFonts.poppins(
        color: textColor,
        fontSize: 12,
        fontWeight: _regular,
        letterSpacing: 0.4,
      ),
      overline: GoogleFonts.poppins(
        color: textColor,
        fontSize: 10,
        fontWeight: _regular,
        letterSpacing: 1.5,
      ),
    );
  }
}
