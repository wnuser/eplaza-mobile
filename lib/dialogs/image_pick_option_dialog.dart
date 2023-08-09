import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../values/dimen.dart';

class ImagePickOptionDialog {
  final void Function(ImageSource source) onSelected;

  ImagePickOptionDialog({required this.onSelected}) {
    _show();
  }

  void _show() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: 70.w,
              decoration: Helper.dialogBoxDecoration,
              padding: const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
              child: ListView(shrinkWrap: true, physics: BouncingScrollPhysics(), children: [
                Center(
                  child: Text('Choose One',
                      style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold)),
                ),
                Helper.spaceVertical(4.h),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _icon(
                      'Camera',
                      'assets/icons/camera.png',
                      () => onSelected(ImageSource.camera),
                    ),
                    _icon(
                      'Gallery',
                      'assets/icons/gallery.png',
                      () => onSelected(ImageSource.gallery),
                    ),
                  ],
                ),
                Helper.spaceVertical(4.h),
                Align(alignment: Alignment.centerRight, child: negativeButton('close'.t, Get.back))
              ]),
            );
          },
        ),
      ),
    );
  }

  Widget _icon(String title, String icon, void Function() cb) {
    return TextButton(
        onPressed: cb,
        style: TextButton.styleFrom(
            minimumSize: Size.square(25.w),
            maximumSize: Size.square(25.w),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.grey.shade100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            assetImage(icon, width: 8.w, height: 8.w),
            Helper.spaceVertical(12),
            Text(
              title,
              style: MyTextStyle(fontSize: fontSizeSmall),
            )
          ],
        ));
  }
}
