import 'package:flutter/material.dart';
import 'package:waiterbookadmin/helper/responsive.dart';
import 'package:waiterbookadmin/screen/on_boarding_screen/phone.dart';
import 'package:waiterbookadmin/screen/on_boarding_screen/tablet.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: OnBoardingPhone(),
      tablet: OnBoardingTablet(),
    );
  }
}
