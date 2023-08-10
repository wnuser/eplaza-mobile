import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modals/pair.dart';

class OrderFiltersDialog {
  RxList<Pair<String, bool>> skills = <Pair<String, bool>>[
    Pair<String, bool>('On the way', false),
    Pair<String, bool>('Delivered', false),
    Pair<String, bool>('Cancelled', false),
    Pair<String, bool>('Returned', false),
  ].obs;

  OrderFiltersDialog() {
    _show();
  }

  void _show() {
    Get.bottomSheet(
      StatefulBuilder(builder: (context, state) {
        return Container(
          width: 100.w,
          // height: 40.h,
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Filters',
                    style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    ),
                    child: Text('Clear'),
                  ),
                ],
              ),
              Helper.spaceVertical(16),
              Text(
                'Order Status',
                style: MyTextStyle(fontSize: fontSizeMedium),
              ),
              Helper.spaceVertical(8),
              _skillsLayout(),
              Helper.spaceVertical(4.h),
              _buttons(),
            ],
          ),
        );
      }),
    );
  }

  Widget _skillsLayout() {
    return Obx(
      () {
        return Wrap(
          alignment: WrapAlignment.start,
          spacing: 6,
          runSpacing: 12,
          children: skills.map(_skillChip).toList(),
        ) /*: empty()*/;
      },
    );
  }

  Widget _skillChip(Pair<String, bool> pair) {
    return OutlinedButton(
      onPressed: () {
        pair.second = !pair.second;
        skills.refresh();
      },
      style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          backgroundColor:
              pair.second ? ThemeColors.colorPrimary.withOpacity(0.1) : ThemeColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(color: pair.second ? ThemeColors.colorPrimary : Colors.grey, width: 1)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Helper.spaceHorizontal(6),
          Text(
            pair.first,
            style: MyTextStyle(
                color: pair.second ? ThemeColors.colorPrimary : Colors.grey,
                fontSize: fontSizeMedium),
          ),
          Helper.spaceHorizontal(4),
          Icon(pair.second ? Icons.close : Icons.add,
              size: 16, color: pair.second ? ThemeColors.colorPrimary : Colors.grey),
          Helper.spaceHorizontal(4),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: OutlinedButton(
          onPressed: () {
            Get.back();
          },
          style: OutlinedButton.styleFrom(),
          child: Text(
            'Cancel',
            style: MyTextStyle(),
          ),
        )),
        Helper.spaceHorizontal(16),
        Expanded(
            child: TextButton(
          onPressed: () {
            Get.back();
          },
          style: TextButton.styleFrom(
            backgroundColor: ThemeColors.colorPrimary,
          ),
          child: Text(
            'Apply',
            style: MyTextStyle(color: Colors.white),
          ),
        )),
      ],
    );
  }
}
