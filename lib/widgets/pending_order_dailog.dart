import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';

class PendingOrderdialog {
  void callMarkAsPendingOrderDailog(BuildContext context, final OrderModel) {
    Get.defaultDialog(
      backgroundColor: yellowColor,
      titlePadding: const EdgeInsets.only(
        top: 20,
        bottom: 5,
        right: 10,
        left: 10,
        
      ),
      title:
          // "${'areYouSureWantToMarkTableNumber'.tr} ${orderModel.tableNumber.toString()} ${'asPaidOrder'.tr}",
          "Are you sure you have delivered the order to the below table ?",
      titleStyle: Theme.of(context).textTheme.headline4,
      content: Container(
        height: Get.height * 0.06,
        width: Get.width * 0.40,
        decoration: BoxDecoration(
            color: darkGreyColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            "232",
            // '₹12,500',
            // "₹ ${orderModel.orderTotal.toString()}",
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: lightGreyColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      contentPadding: const EdgeInsets.only(bottom: 20),
      actions: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Text(
            'no'.tr,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.30,
        ),
        InkWell(
          onTap: () async {
            Get.back();
          },
          child: Text(
            'yes'.tr,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ],
    );
  }
}
