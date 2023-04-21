import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waiterbookadmin/constant/shared_preference_constant.dart';

class SharedPreferenceController extends GetxController {
  static SharedPreferenceController instance = Get.find();

  Future<void> setIsLoggedIn(bool isLoggedIn) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(ISLOGGEDIN, isLoggedIn);
  }

  Future<bool?> getIsLoggedIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isLoggedIn = pref.getBool(ISLOGGEDIN);
    return isLoggedIn;
  }

  Future<void> setUser(
    String uid,
    String hotelid,
    String phone,
  ) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(UID, uid);
    pref.setString(HOTELID, hotelid);
    pref.setString(PHONE, phone);
  }

  Future<void> setHotelName(String hotelName) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(HOTELNAME, hotelName);
  }

  Future<String?> getHotelName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(HOTELNAME);
  }

  Future<String?> getUid() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? uid = pref.getString(UID);
    return uid;
  }

  Future<String?> getHotelId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? hoteluid = pref.getString(HOTELID);
    return hoteluid;
  }

  Future<String?> getPhone() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? phone = pref.getString(PHONE);
    return phone;
  }

  Future<String?> getOrderNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? orderNumber = pref.getString(ORDERNUMBER);
    return orderNumber;
  }

  Future<void> removeAll() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(ISLOGGEDIN);
    pref.remove(UID);
    pref.remove(HOTELID);
    pref.remove(PHONE);
  }
}
