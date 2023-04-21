import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';

class HomePage extends StatelessWidget {
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
    {'name': 'मराठी', 'locale': const Locale('mar', 'IN')},
  ];

  HomePage({Key? key}) : super(key: key);
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  changeLanguageAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text('Choose Your Language'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text(locale[index]['name']),
                onTap: () {
                  updateLanguage(locale[index]['locale']);
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.blue,
            );
          },
          itemCount: locale.length,
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'appTitle'.tr,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'plusNineOne'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'managerYourRestaurant'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            ElevatedButton(
              onPressed: () {
                changeLanguageAlertDialog(context);
              },
              child: const Text(
                "Change Language",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                changeThemeController.changeAppTheme();
              },
              child: const Text(
                'Change Theme',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
