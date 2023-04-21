import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/controller_constant.dart';

class ScreenHandlerController extends GetxController {
  static ScreenHandlerController instance = Get.find();

  var screenValue = "LOGIN".obs;

  @override
  void onInit() {
    super.onInit();
    checkIsLoggedIn();
  }

  changeToLogin() {
    screenValue("LOGIN");
  }

  changeToOtp() {
    screenValue("OTP");
  }

  changeToRequestAccess() {
    screenValue("REQUESTACCESS");
  }

  changeToWaiting() {
    screenValue("WAITING");
  }

  changeToDashboard() {
    screenValue("DASHBOARD");
  }

  checkIsLoggedIn() async {
    bool? isLoggedIn = await sharedPreferenceController.getIsLoggedIn();
    print("logged in value of $isLoggedIn");
    if (isLoggedIn == true && isLoggedIn != null) {
      changeToDashboard();
    } else {
      changeToLogin();
    }
  }
}
