import 'dart:convert';

import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modals/user.dart';
import 'logger.dart';

class Preference {
  static const _IS_LOGIN = "is_login";

  static const _userKey = 'user_5684';
  // static User? _user;
  static String _tokenKey = 'TOKEN';
  static String _shopId = 'shopId';

  static late SharedPreferences _pref;

  static Future init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static bool containsKey(String key) => _pref.containsKey(key);

  static bool get isUserAvailable =>
      _pref.containsKey(_userKey) && _pref.getString(_userKey).notEmpty;

  static User get user {
    return User.fromJson(jsonDecode(_pref.getString(_userKey) ?? '{}'));
    // return _user ?? User.fromJson('{}');
  }

  static void setUser(User u) {
    if (u.id.notEmpty) {
      // _user = u;
      _pref.setString(_userKey, jsonEncode(u.toJson()));
    } else {
      Logger.e(tag: 'INVALID USER', value: u.toJson());
    }
  }

  //Check Login or not?
  static bool get isLogin => _pref.getBool(_IS_LOGIN) ?? false;

  static Future<void> setLogin(bool login) => _pref.setBool(_IS_LOGIN, login);

  static String get token => _pref.getString(_tokenKey).nullSafe;

  static set token(String token) => _pref.setString(_tokenKey, token);

  static String get shopId => _pref.getString(_shopId).placeholder('22');

  static set shopId(String shopId) => _pref.setString(_shopId, shopId);

  static void clear() {
    _pref.clear();
    // _user = null;
  }
}
