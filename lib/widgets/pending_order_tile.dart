import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';
import 'package:waiterbookadmin/constant/text_constant.dart';
import 'package:waiterbookadmin/model/order_model.dart';
import 'package:waiterbookadmin/widgets/pending_order_dailog.dart';

class PendingOrderTile extends StatelessWidget {
  const PendingOrderTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 160.sp,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: yellowColor,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 40.sp,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: lightGreenColor,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                  child: ElevatedButton(
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(redColor),
                            ),
                    onPressed: () {
                      // MarkAsPaidDailog()
                      //     .callMarkAsPaidDailog(context, orderModel);
                      PendingOrderdialog()
                          .callMarkAsPendingOrderDailog(context, OrderModel);
                    },
                    child: Text(
                      'done'.tr,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: lightGreyColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: Get.width * 0.05,
              top: Get.width * 0.02,
              child: Column(
                children: [
                  Text(
                    'tableNo'.tr,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Container(
                    height: 55.sp,
                    width: 60.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: darkGreyColor,
                    ),
                    child: Center(
                      child: Text(
                        "232",
                        // orderModel.tableNumber.toString(),
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: lightGreyColor,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: Get.width * 0.25,
              top: Get.width * 0.08,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.25,
                    width: Get.width * 0.60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          paneerBhurji,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: darkGreyColor),
                        ),
                        Text(
                          // "${'orderNumber'.tr} : ${orderModel.orderNumber.toString()}",
                          "Order Number : 23456",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        Text(
                          "22nd Sept 2022 15:38",
                          // orderModel.createdAt.toString(),
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 80.sp,
                          height: 30.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
