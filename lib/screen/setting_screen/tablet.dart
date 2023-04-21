import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';

class SettingScreenTablet extends StatelessWidget {
  const SettingScreenTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'menuCard'.tr.toUpperCase(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'menuItems'.tr,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'addItem'.tr,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: redColor,
                    ),
              ),
            ],
          ),
          const Divider(
            color: darkGreyColor,
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('searchByItemName'.tr),
              labelStyle: Theme.of(context).textTheme.headline5,
              fillColor: greyColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, i) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: Get.height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: yellowColor,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Paneer Kadhai",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: darkGreyColor,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
