import 'package:flutter/material.dart';
import 'package:waiterbookadmin/helper/responsive.dart';
import 'package:waiterbookadmin/screen/splash_screen/phone.dart';
import 'package:waiterbookadmin/screen/splash_screen/tablet.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: SplashScreenPhone(),
      tablet: SplashScreenTablet(),
    );
  }
}
