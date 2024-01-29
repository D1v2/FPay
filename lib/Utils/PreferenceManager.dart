import 'dart:async' show Future;

import 'package:fpay/Utils/PreferenceConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static SharedPreferences? _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static Future setLogin() {
    return _preferences!.setBool(PreferenceConstant.loginKey, true);
  }

  static bool isLogin() {
    return _preferences!.getBool(PreferenceConstant.loginKey) ?? false;
  }

  static Future setNumber(String number) {
    return _preferences!.setString(PreferenceConstant.mobileNumberKey, number);
  }

  static String getNumber() {
    return _preferences!.getString(PreferenceConstant.mobileNumberKey) ?? "";
  }


  static Future setMemberTypeId(String id) {
    return _preferences!.setString(PreferenceConstant.memberTypeId, id);
  }

  static String getMemberTypeId() {
    return _preferences!.getString(PreferenceConstant.memberTypeId) ?? "";
  }

  static Future setName(String name) {
    return _preferences!.setString(PreferenceConstant.name, name);
  }

  static String getName() {
    return _preferences!.getString(PreferenceConstant.name) ?? "";
  }

  static Future setEmail(String email) {
    return _preferences!.setString(PreferenceConstant.email, email);
  }

  static String getEmail() {
    return _preferences!.getString(PreferenceConstant.email) ?? "";
  }


  static Future setMsrNumber(int msrNumber) {
    return _preferences!.setInt(PreferenceConstant.msrNumber, msrNumber);
  }

  static int getMsrNumber() {
    return _preferences!.getInt(PreferenceConstant.msrNumber) ?? 0;
  }

  static void signOut() async {
    await _preferences?.clear();
  }
}
