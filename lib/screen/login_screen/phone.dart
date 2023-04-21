import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/color_constant.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';
import 'package:waiterbookadmin/constant/text_constant.dart';
import 'package:waiterbookadmin/helper/common_ui.dart';
import 'package:waiterbookadmin/helper/textfield_validators.dart';
import 'package:waiterbookadmin/screen/loading_screen/loading_screen.dart';

class LoginScreenPhone extends StatelessWidget {
  const LoginScreenPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (phoneAuthController.isLoading.value) {
          return const LoadingScreen();
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildHeaderWidget(context),
                _buildBottomWidget(context),
              ],
            ),
          );
        }
      }),
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
        child: Form(
          key: phoneAuthController.formKey,
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
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: lightGreyColor,
                    ),
                controller: phoneAuthController.phoneController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 10) {
                    CommonUI.dismissKeyboard(context);
                  }
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autovalidateMode: AutovalidateMode.disabled,
                validator: validateMobileNumber,
                decoration: const InputDecoration(
                  label: Text(
                    plusNineOne,
                  ),
                  counterText: "",
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 45.sp,
                child: ElevatedButton(
                  onPressed: () {
                    phoneAuthController.validateAndLogin();
                  },
                  child: Text(
                    'submit'.tr,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
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
