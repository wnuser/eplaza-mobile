import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logger {
  static bool _logEnabled = false;

  static set logEnabled(bool boo) {
    _logEnabled = boo;
    Get.isLogEnable = _logEnabled;
  }

  //For Error
  static void e(
      {dynamic baseName = '', String? tag = 'Logger', Object? value = ''}) {
    if (_logEnabled) {
      debugPrint((baseName != null && baseName.toString().isNotEmpty
              ? baseName.toString().toUpperCase() + ' :: '
              : '') +
          '💢 ERROR >> $tag : ' +
          value.toString());
    }
    // Const.logs['ERROR'].add(tag + ' :: ' + value.toString());
  }

  //For Exception
  static void ex(
      {dynamic baseName = '', String? tag = 'Logger', Object? value = ''}) {
    if (_logEnabled) {
      debugPrint((baseName != null && baseName.toString().isNotEmpty
              ? baseName.toString().toUpperCase() + ' :: '
              : '') +
          '👻 EXCEPTION >> $tag : ' +
          value.toString());
    }
    // Const.logs['EXCEPTION'].add(tag + ' :: ' + value.toString());
  }

  //For Message
  static void m(
      {dynamic baseName = '', String? tag = 'Logger', Object? value = ''}) {
    if (_logEnabled) {
      debugPrint((baseName != null && baseName.toString().isNotEmpty
              ? baseName.toString().toUpperCase() + ' :: '
              : '') +
          '✉ MESSAGE >> $tag : ' +
          value.toString());
    }
    // Const.logs['MESSAGE'].add(tag + ' :: ' + value.toString());
  }

  //For Response
  static void r(
      {dynamic baseName = '', String? tag = 'Logger', Object? value = ''}) {
    if (_logEnabled) {
      debugPrint((baseName != null && baseName.toString().isNotEmpty
              ? baseName.toString().toUpperCase() + ' :: '
              : '') +
          '🧾 RESPONSE >> $tag : ' +
          value.toString());
    }
    // Const.logs['RESPONSE'].add(tag + ' :: ' + value.toString());
  }
}
