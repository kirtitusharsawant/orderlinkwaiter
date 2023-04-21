import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';
import 'package:waiterbookadmin/constant/image_constant.dart';
import 'package:waiterbookadmin/screen/on_boarding_screen/on_boarding_screen.dart';

class OnBoardingTablet extends StatelessWidget {
  const OnBoardingTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeaderWidget(context),
          _buildBottomWidget(context),
        ],
      ),
    );
  }

  Widget _buildHeaderWidget(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.85,
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.10,
            ),
            Text(
              'appTitle'.tr,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Image.asset(appLogo),
            SizedBox(
              height: Get.height * 0.30,
            ),
            Text(
              'admin'.tr,
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomWidget(BuildContext context) {
    return Container(
      height: Get.height * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
            width: double.infinity,
            height: Get.height * 0.075,
            child: ElevatedButton(
              onPressed: () {
                Get.to(OnBoardingScreen);
              },
              child: Text(
                'getStarted'.tr,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            )),
      ),
    );
  }
}
