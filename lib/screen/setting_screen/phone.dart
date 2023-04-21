import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';

class SettingScreenPhone extends StatelessWidget {
  const SettingScreenPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'settings'.tr.toUpperCase(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMenuCardWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCardWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: Get.height * 0.70,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'settings'.tr,
            style: Theme.of(context).textTheme.headline5,
          ),
          const Divider(
            color: darkGreyColor,
          ),
          Flexible(
              child: ListView(
            children: [
              SettingTile(
                onTap: () {
                  phoneAuthController.logOutUser();
                },
                title: 'logout'.tr,
                tileIcon: Icons.exit_to_app_rounded,
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  final String title;
  final IconData tileIcon;
  final VoidCallback onTap;
  const SettingTile({
    Key? key,
    required this.title,
    required this.tileIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: Get.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: darkGreenColor,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: lightGreyColor),
              ),
              Icon(
                tileIcon,
                color: lightGreyColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
