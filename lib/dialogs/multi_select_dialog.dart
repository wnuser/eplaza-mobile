import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/helper.dart';
import '../values/dimen.dart';
import '../values/theme_colors.dart';
import '../widgets/widgets.dart';

class MultiSelectDialog<T> {
  BuildContext context;
  final String title;
  final EdgeInsets padding;
  final void Function(List<T> t)? onSelected;
  final String Function(T t) itemTitle;
  final String Function(T t)? itemSubTitle;
  List<T> list = <T>[];
  List<T> selected = <T>[];

  MultiSelectDialog(
    this.context, {
    required this.title,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    this.onSelected,
    required this.list,
    required this.itemTitle,
    this.selected = const [],
    this.itemSubTitle,
  }) {
    _show();
  }

  void _show() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
              decoration: BoxDecoration(
                  // color: ThemeColors.colorPrimary,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: ThemeColors.colorPrimary.withOpacity(0.5),
                  //       spreadRadius: 5,
                  //       blurRadius: 7,
                  //       offset: const Offset(0, 3))
                  // ],
            ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Helper.spaceVertical(4),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Helper.spaceHorizontal(12),
                      Expanded(
                        child: Text(
                          title.nullSafe,
                          style: const MyTextStyle(
                              fontSize: fontSizeLarge,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      smallIcon(Icons.close_rounded, () {
                        Navigator.pop(context);
                      }, color: Colors.grey.shade200),
                    ],
                  ),
                  // Text(title,
                  //     style: const MyTextStyle(
                  //         color: Colors.white,
                  //         fontSize: fontSizeLarge,
                  //         fontWeight: FontWeight.bold)),
                  Helper.spaceVertical(20),
                  list.isNotEmpty
                      ? Flexible(
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: list.length,
                              shrinkWrap: true,
                              itemBuilder: (ctx, pos) {
                                bool isSelected = selected.contains(list[pos]);
                                return ListTile(
                                  onTap: () {
                                    if (selected.contains(list[pos])) {
                                      selected.remove(list[pos]);
                                    } else {
                                      selected.add(list[pos]);
                                    }
                                    setState(() {});
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  selected: isSelected,
                                  tileColor: ThemeColors.colorPrimary,
                                  selectedTileColor: ThemeColors.black,
                                  dense: true,
                                  leading: Icon(
                                    isSelected
                                        ? Icons.check_box_rounded
                                        : Icons.check_box_outline_blank_rounded,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    itemTitle(list[pos]),
                                    style: const MyTextStyle(
                                      color: Colors.black,
                                      fontSize: fontSizeLarge,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: itemSubTitle == null
                                      ? null
                                      : Text(
                                          itemSubTitle!(list[pos]),
                                          style: const MyTextStyle(
                                            color: Colors.black,
                                            fontSize: fontSizeSmall,
                                          ),
                                        ),
                                );
                              }),
                        )
                      : emptyLayout(title: 'noDataAvailable'.t),
                  Helper.spaceVertical(10),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          go();
                          Get.back();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: ThemeColors.colorPrimary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16)
                        ),
                        child: Text('Select', style: MyTextStyle(color: Colors.white),)),
                  )
                ],
              ),
            );
          });
        });
  }

  void go() {
    onSelected?.call(selected);
  }
}
