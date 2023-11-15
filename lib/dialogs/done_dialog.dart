import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/widgets.dart';

class DoneDialog {
  final String icon;
  final String title;
  final String message;
  final String buttonText;
  final void Function() callback;
  final Color color;

  static const _horizontalPadding = 20.0;

  DoneDialog({
    required this.title,
    required this.message,
    required this.callback,
    this.icon = 'assets/icons/checked.png',
    this.buttonText = 'Home',
    this.color = ThemeColors.success,
  }) {
    _show();
  }

  void _show() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: 60.w,
              decoration: Helper.dialogBoxDecoration,
              padding: EdgeInsets.only(bottom: 20),
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: Get.back,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red.shade50,
                        shape: CircleBorder(),
                        padding: EdgeInsets.zero,
                      ),
                      child: Icon(Icons.close, color: Colors.red, size: 16),
                    ),
                  ),
                  // Helper.spaceVertical(3.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
                    child: assetImage(
                      icon,
                      width: 16.w,
                      height: 16.w,
                      color: color,
                    ),
                  ),
                  Helper.spaceVertical(5.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
                    child: Text(
                      title,
                      style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold, color: color),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Helper.spaceVertical(22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
                    child: Text(
                      message,
                      style: MyTextStyle(fontSize: fontSizeMedium, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Helper.spaceVertical(50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
                    child: TextButton(
                      onPressed: callback,
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                          backgroundColor: ThemeColors.colorPrimary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        buttonText,
                        style: MyTextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      // barrierDismissible: false,
    );
  }
}
