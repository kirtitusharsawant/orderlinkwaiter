import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';
import 'package:waiterbookadmin/constant/text_constant.dart';
import 'package:waiterbookadmin/screen/otp_screen/otp_screen.dart';

class DashboardScreenTablet extends StatelessWidget {
  const DashboardScreenTablet({Key? key}) : super(key: key);

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
      height: Get.height * 0.30,
      width: double.infinity,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20, left: 20),
          child: Text(
            'login'.tr,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomWidget(BuildContext context) {
    return Container(
      height: Get.height * 0.70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'enterPhone'.tr,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: lightGreyColor,
                    ),
              ),
            ),
            _buildSizedBox(),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(plusNineOne),
              ),
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                height: Get.height * 0.075,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const OtpScreen());
                  },
                  child: Text(
                    'submit'.tr,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizedBox() {
    return const SizedBox(
      height: 20,
    );
  }
}
