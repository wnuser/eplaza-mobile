import 'dart:convert';

import 'package:e_plaza/utils/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modals/user.dart';
import 'logger.dart';

class Preference {
  static const _IS_LOGIN = "is_login";

  static const _USER = 'user_5684';
  static late User _user;

  static late SharedPreferences _pref;

  static Future init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static bool containsKey(String key) => _pref.containsKey(key);

  static bool get isUserAvailable =>
      _pref.containsKey(_USER) && _pref.getString(_USER).notEmpty;

  static User get user {
    _user ??= User.fromJson(jsonDecode(_pref.getString(_USER) ?? '{}'));
    return _user;
  }

  static void setUser(User u) {
    if (u.id.notEmpty) {
      _user = u;
      _pref.setString(_USER, jsonEncode(u.toJson()));
    } else {
      Logger.e(tag: 'INVALID USER', value: u.toJson());
    }
  }

  //Check Login or not?
  static bool get isLogin => _pref.getBool(_IS_LOGIN) ?? false;

  static Future<void> setLogin(bool login) => _pref.setBool(_IS_LOGIN, login);

  static Future<void> setRegisterUser(bool login) => _pref.setBool(_IS_LOGIN, login);


  static void clear() => _pref.clear();
}
