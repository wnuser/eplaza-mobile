import 'package:flutter/foundation.dart';
import 'package:e_plaza_vendor/utils/data/en.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/logger.dart';

class Strings {
  static String _languageCode = 'en';
  static const Map<String, Map<String, String>> _languages = {'en': en};

  static void init(String languageCode) {
    _languageCode = languageCode;
  }

  static String get(String? key,
      {bool removeSpaces = false, String? languageCode}) {
    key = key.nullSafe;
    key = removeSpaces ? key.replaceAll(' ', '') : key;

    if (kDebugMode &&
        Helper.isEmpty(_languages[languageCode ?? _languageCode]![key])) {
      Logger.m(
          tag: 'Strings.get()', value: "(undefined '$key' in $_languageCode)");
    }

    return _languages[languageCode ?? _languageCode]![key] ?? key;
  }
}
