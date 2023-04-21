import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/image_constant.dart';
import 'package:waiterbookadmin/screen/login_screen/login_screen.dart';

class SplashScreenTablet extends StatelessWidget {
  const SplashScreenTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeaderWidget(context),
          _buildMiddleWidget(context),
          _buildBottomWidget(context),
        ],
      ),
    );
  }

  Widget _buildHeaderWidget(BuildContext context) {
    return Container(
      height: Get.height * 0.40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.asset(appLogo),
          Text(
            'appTitle'.tr,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiddleWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: Get.height * 0.40,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'splashTitle'.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  letterSpacing: 0.5,
                ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'splashSubTitle'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    letterSpacing: 0.5,
                  ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomWidget(BuildContext context) {
    return Container(
      height: Get.height * 0.20,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: Get.height * 0.07,
            width: Get.width * 0.35,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const StadiumBorder(),
                primary: Theme.of(context).colorScheme.secondaryContainer,
              ),
              onPressed: () {
                Get.to(const LoginScreen());
              },
              child: Text(
                'login'.tr,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.07,
            width: Get.width * 0.35,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const StadiumBorder(),
                  primary: Theme.of(context).colorScheme.background),
              onPressed: () {},
              child: Text(
                'signUp'.tr,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
