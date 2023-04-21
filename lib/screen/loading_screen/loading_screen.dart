import 'package:flutter/material.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';
import 'package:waiterbookadmin/helper/responsive.dart';
import 'package:waiterbookadmin/screen/loading_screen/phone.dart';
import 'package:waiterbookadmin/screen/loading_screen/tablet.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    internetController.onInit();
    return const Responsive(
      mobile: LoadingPhone(),
      tablet: LoadingTablet(),
    );
  }
}
