import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';
import 'package:waiterbookadmin/constant/image_constant.dart';

class SplashScreenPhone extends StatelessWidget {
  const SplashScreenPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeaderWidget(context),
          // _buildMiddleWidget(context),
          _buildBottomWidget(context),
        ],
      ),
    );
  }

  Widget _buildHeaderWidget(BuildContext context) {
    return Container(
      height: 250.sp,
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
          SizedBox(
            height: 10.sp,
          ),
          SizedBox(
            height: 130.sp,
            width: 100.sp,
            child: Image.asset(
              appLogo,
              fit: BoxFit.cover,
            ),
          ),
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

  // Widget _buildMiddleWidget(BuildContext context) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 20),
  //     height: 250.sp,
  //     width: double.infinity,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         SizedBox(
  //           height: 55.sp,
  //         ),
  //         Text(
  //           'splashTitle'.tr,
  //           textAlign: TextAlign.center,
  //           style: Theme.of(context).textTheme.headline3!.copyWith(
  //                 fontWeight: FontWeight.w600,
  //                 height: 1.3,
  //                 letterSpacing: 0.5,
  //               ),
  //         ),
  //         SizedBox(
  //           height: 10.sp,
  //         ),
  //         Container(
  //           margin: const EdgeInsets.symmetric(horizontal: 10),
  //           child: Text(
  //             'splashSubTitle'.tr,
  //             textAlign: TextAlign.center,
  //             style: Theme.of(context).textTheme.headline5!.copyWith(
  //                   fontWeight: FontWeight.w400,
  //                   height: 1.2,
  //                   letterSpacing: 0.5,
  //                 ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 20.sp,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildBottomWidget(BuildContext context) {
    // return SizedBox(
    //   height: 40.sp,
    //   width: double.infinity,
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       SizedBox(
    //         width: 120.sp,
    //         child: ElevatedButton(
    //           style: ElevatedButton.styleFrom(
    //             elevation: 0,
    //             shape: const StadiumBorder(),
    //             primary: Theme.of(context).colorScheme.secondaryContainer,
    //           ),
    //           onPressed: () {
    //             Get.to(const LoginScreen());
    //           },
    //           child: Text(
    //             'login'.tr,
    //             style: Theme.of(context).textTheme.headline3,
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         width: 120.sp,
    //         child: ElevatedButton(
    //           style: ElevatedButton.styleFrom(
    //               elevation: 0,
    //               shape: const StadiumBorder(),
    //               primary: Theme.of(context).colorScheme.background),
    //           onPressed: () {},
    //           child: Text(
    //             'signUp'.tr,
    //             style: Theme.of(context).textTheme.headline3,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return const CircularProgressIndicator(
      color: darkGreenColor,
    );
  }
}
