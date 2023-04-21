import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';

enum ToastType {
  success,
  error,
  warning,
  info,
}

void showAppSnackBar({
  required String message,
  ToastType toastType = ToastType.success,
  int duration = 3,
  IconData? icon,
  Color? backgroundColor,
}) {
  switch (toastType) {
    case ToastType.success:
      icon = Icons.check;
      backgroundColor = darkGreenColor;
      break;
    case ToastType.error:
      icon = Icons.close;
      backgroundColor = redColor;
      break;
    case ToastType.warning:
      icon = Icons.check;
      backgroundColor = redColor;
      break;
    case ToastType.info:
      icon = Icons.check;
      backgroundColor = darkGreenColor;
      break;
  }

  GetSnackBar snackBar = GetSnackBar(
    duration: Duration(seconds: duration),
    borderRadius: 8,
    messageText: Container(
      height: Get.height * 0.05,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: darkGreyColor,
            size: Get.height * 0.03,
          ).paddingOnly(right: 4),
          SizedBox(
            width: Get.width * 0.60,
            child: Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.0,
              ),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.transparent,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    snackStyle: SnackStyle.GROUNDED,
  );

  Get.showSnackbar(snackBar);
}
