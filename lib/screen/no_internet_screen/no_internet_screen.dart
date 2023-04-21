import 'package:flutter/material.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';
import 'package:waiterbookadmin/helper/responsive.dart';
import 'package:waiterbookadmin/screen/no_internet_screen/phone.dart';
import 'package:waiterbookadmin/screen/no_internet_screen/tablet.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    internetController.onInit();
    return const Responsive(
      mobile: NoInternetPhone(),
      tablet: NoInternetTablet(),
    );
  }
}
