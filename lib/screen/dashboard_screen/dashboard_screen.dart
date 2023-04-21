import 'package:flutter/material.dart';
import 'package:waiterbookadmin/helper/responsive.dart';
import 'package:waiterbookadmin/screen/dashboard_screen/phone.dart';
import 'package:waiterbookadmin/screen/dashboard_screen/tablet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: DashboardScreenPhone(),
      tablet: DashboardScreenTablet(),
    );
  }
}
