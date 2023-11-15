import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:e_plaza/widgets/widgets.dart';

class ImageDialog {
  final String _url;

  ImageDialog(this._url);

  void show() {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 100.w - 40,
          minHeight: 100.w / 2,
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(fit: StackFit.loose, children: [
              InkWell(
                onTap: Get.back,
                child: MyNetworkImage(
                    path: _url,
                    errorWidget:
                        assetImage('assets/icons/image_not_found.png')),
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      width: smallRoundButtonSize,
                      height: smallRoundButtonSize,
                      child: MyFlatButton(
                        onPressed: Get.back,
                        shape: const CircleBorder(),
                        color: Colors.red.shade100,
                        padding: const EdgeInsets.all(10),
                        child: assetImage('assets/icons/close_black.png',
                            width: smallIconSize,
                            height: smallIconSize,
                            color: Colors.white),
                      ),
                    ),
                  ])
            ]),
          ),
        ),
      ),
    ));
  }
}
