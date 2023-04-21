import 'package:flutter/material.dart';
import 'package:waiterbookadmin/helper/responsive.dart';
import 'package:waiterbookadmin/screen/setting_screen/phone.dart';
import 'package:waiterbookadmin/screen/setting_screen/tablet.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: SettingScreenPhone(),
      tablet: SettingScreenTablet(),
    );
  }
}
