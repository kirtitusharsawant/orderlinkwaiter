import 'package:flutter/material.dart';
import 'package:waiterbookadmin/helper/responsive.dart';
import 'package:waiterbookadmin/screen/otp_screen/phone.dart';
import 'package:waiterbookadmin/screen/otp_screen/tablet.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: OtpScreenPhone(),
      tablet: OtpScreenTablet(),
    );
  }
}
