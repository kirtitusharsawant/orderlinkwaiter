import 'package:flutter/material.dart';
import 'package:waiterbookadmin/helper/responsive.dart';
import 'package:waiterbookadmin/screen/login_screen/phone.dart';
import 'package:waiterbookadmin/screen/login_screen/tablet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: LoginScreenPhone(),
      tablet: LoginScreenTablet(),
    );
  }
}
