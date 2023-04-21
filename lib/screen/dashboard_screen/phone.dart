import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';
import 'package:waiterbookadmin/screen/setting_screen/setting_screen.dart';
import 'package:waiterbookadmin/widgets/pending_order_tile.dart';

class DashboardScreenPhone extends StatefulWidget {
  const DashboardScreenPhone({Key? key}) : super(key: key);

  @override
  State<DashboardScreenPhone> createState() => _DashboardScreenPhoneState();
}

class _DashboardScreenPhoneState extends State<DashboardScreenPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'splashScreenSubtitle'.tr,
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(SettingScreen());
            },
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Icon(Icons.settings_brightness),
            ),
          )
        ],
        //actions: [icons.accout],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildActivityWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 330.sp,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'dashboardScreenSubTitle'.tr,
            style: Theme.of(context).textTheme.headline5,
          ),
          const Divider(
            color: darkGreyColor,
          ),
          SizedBox(
            height: 8.sp,
          ),
          const PendingOrderTile(),
        ],
      ),
    );
  }
}
