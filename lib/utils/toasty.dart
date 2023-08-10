import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:e_plaza/values/dimen.dart';

class Toasty {
  static void success(String msg, {duration = 2}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: duration,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: fontSizeLarge);
  }

  static void failed(String msg, {duration = 2}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: duration,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: fontSizeLarge);
  }

  static void info(String msg, {duration = 2}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: duration,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: fontSizeLarge);
  }

  static void normal(String msg, {duration = 2}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: duration,
        fontSize: fontSizeLarge);
  }
}
