import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';
import 'package:waiterbookadmin/constant/image_constant.dart';

class CommonUI {
  CommonUI._();
  Widget textField(
    BuildContext context, {
    TextEditingController? textEditingController,
    String? labelText,
    int maxLength = 200,
    TextInputType? textInputType = TextInputType.text,
  }) {
    return TextFormField(
      style: Theme.of(context).textTheme.headline4!.copyWith(
            color: lightGreyColor,
          ),
      controller: textEditingController,
      maxLength: maxLength,
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: Text(labelText!),
        counterText: "",
      ),
    );
  }

  static void dismissKeyboard(BuildContext context) =>
      FocusScope.of(context).requestFocus(FocusNode());

  static Widget noDataWidget(BuildContext context, String noDataText) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.sp),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.sp,
              width: 100.sp,
              child: Image.asset(noData),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                // 'noOrderAvailable'.tr,
                noDataText,
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
