import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modals/delivery_time.dart';

class DeliveryTimesBottomSheetDialog {
  List<DeliveryTime> times;
  void Function(DeliveryTime) onSelected;

  DeliveryTimesBottomSheetDialog(this.times, this.onSelected) {
    _show();
  }

  void _show() {
    Get.bottomSheet(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: 100.w,
              decoration: Helper.dialogBoxDecoration,
              // padding: EdgeInsets.only(bottom: 20),
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Helper.spaceHorizontal(16),
                      Text(
                        'Delivery Times',
                        style: MyTextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: Get.back,
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red.shade50,
                          shape: CircleBorder(),
                          padding: EdgeInsets.zero,
                        ),
                        child: Icon(Icons.close, color: Colors.red, size: 16),
                      ),
                    ],
                  ),
                  Helper.spaceVertical(20),
                  times.isNotEmpty
                      ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: times.length,
                      shrinkWrap: true,
                      itemBuilder: _item,
                        )
                      : emptyLayout(title: 'noDataAvailable'.t),
                  Helper.spaceVertical(6.h),
                ],
              ),
            );
          },
        ),
      ),
      // barrierDismissible: false,
    );
  }

  Widget _item(BuildContext c, int i) {
    DeliveryTime time = times[i];
    return TextButton(
      onPressed: () {
        Get.back();
        onSelected(time);
      },
      style: TextButton.styleFrom(backgroundColor: Colors.grey.shade50),
      child: Text(
        time.txt,
        style: MyTextStyle(),
      ),
    );
  }
}
