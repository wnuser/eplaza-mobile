import 'package:e_plaza/modals/store_category.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetListDialog<T> {
  final String title;
  final List<T> list;
  List<T> _mainList = [];
  final double textSize;
  bool isBottomSheet;

  BottomSheetListDialog(this.title, this.list, {this.textSize = fontSizeMedium, this.isBottomSheet = false});

  void show(void Function(int position, T s) onClick) {
    _mainList.clear();
    _mainList = list;

    if (isBottomSheet) {
      Get.bottomSheet(_dialog(onClick));
    } else {
      Get.dialog(_dialog(onClick));
    }
  }

  Widget _dialog(void Function(int position, T s) onClick) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
        decoration: Helper.dialogBoxDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold)),
            Helper.spaceVertical(20),
            list.isNotEmpty
                ? Flexible(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, pos) => _item(pos, onClick)))
                : emptyLayout(title: 'noDataAvailable'.t),
            Helper.spaceVertical(10),
            Align(alignment: Alignment.centerRight, child: negativeButton('close'.t, Get.back))
          ],
        ),
      ),
    );
  }

  Widget _item(int pos, void Function(int position, T s) onClick) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: MyFlatButton(
            onPressed: () {
              Get.back();
              onClick(pos, list[pos]);
            },
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: _getChild(list[pos])),
      ),
    );
  }

  Widget _getChild(T item) {
    MyTextStyle _textStyle = MyTextStyle(fontSize: textSize);
    TextAlign _align = TextAlign.center;

    if (item is int) {
      return Text(item.toString(), textAlign: _align, style: _textStyle);
    } else if (item is String) {
      return Text(item.nullSafe, textAlign: _align, style: _textStyle);
    }if (item is StoreCategory) {
      return Text(item.title.nullStr, textAlign: _align, style: _textStyle);
    }
    return empty();
  }
}
