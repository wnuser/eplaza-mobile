import 'package:e_plaza/modals/city.dart';
import 'package:e_plaza/modals/country.dart';
import 'package:e_plaza/modals/country2.dart';
import 'package:e_plaza/modals/state.dart' as state;
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/strings.dart';
import 'package:e_plaza/widgets/normal_outline_text_field.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchableListDialog<T> {
  final String title;
  final List<T> list;
  final RxList<T> _filteredList = <T>[].obs;
  final double textSize;
  final bool isSearch;
  final TextEditingController _searchController = TextEditingController();

  SearchableListDialog(this.title, this.list,
      {this.textSize = fontSizeMedium, this.isSearch = true});

  void show(void onClick(T s)) {
    _filteredList.clear();
    _filteredList.addAll(list);

    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
        decoration: Helper.dialogBoxDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold)),
            if (isSearch) Helper.spaceVertical(20),
            if (isSearch)
              NormalOutlineTextField(
                label: Strings.get('search') + '...', controller: _searchController,
                onChanged: _filter,
                // disableBorder: true,
                // enableLabel: false,
                // textSize: fontSizeSmall,
              ),
            Helper.spaceVertical(20),
            Obx(
              () => Flexible(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _filteredList.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, pos) => _item(_filteredList[pos], onClick)),
              ),
            ),
            Helper.spaceVertical(10),
            Align(
                alignment: Alignment.centerRight,
                child: negativeButton(Strings.get('close'), Get.back))
          ],
        ),
      ),
    ));
  }

  Widget _item(T t, void onClick(T s)) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 4, top: 2),
      child: MyFlatButton(
          onPressed: () {
            Get.back();
            onClick(t);
          },
          padding: EdgeInsets.all(12),
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: _getChild(t)),
    );
  }

  Widget _getChild(T item) {
    MyTextStyle _textStyle = MyTextStyle(fontSize: textSize);
    TextAlign _align = TextAlign.center;

    if (item is int || item is String || item is double) {
      return Text(item.toString(), textAlign: _align, style: _textStyle);
    } else if (item is Country) {
      return Text(item.name.nullSafe, textAlign: _align, style: _textStyle);
    } else if (item is Country2) {
      return Row(
        children: [
          Image.asset(item.flag, width: 25, height: 20),
          Helper.spaceHorizontal(5),
          Flexible(
            child: Text(
              item.phoneCode + "  " + item.country,
              textAlign: TextAlign.start,
              style: _textStyle,
            ),
          ),
        ],
      );
    } else if (item is state.State) {
      return Text(item.name.nullSafe, textAlign: _align, style: _textStyle);
    } else if (item is City) {
      return Text(item.name.nullSafe, textAlign: _align, style: _textStyle);
    }
    return empty();
  }

  void _filter(String str) {
    _filteredList.clear();
    if (str.isNotEmpty) {
      _filteredList.addAll(list.where((e) => _isContain(e, str)).toList());
    } else {
      _filteredList.addAll(list);
    }
  }

  bool _isContain(T item, String keyword) {
    if (item is int || item is String || item is double) {
      return Helper.isContainKeyword(keyword, [item.toString()]);
    } else if (item is Country) {
      return Helper.isContainKeyword(keyword, [item.name, item.phoneCode.toString()]);
    } else if (item is Country2) {
      return Helper.isContainKeyword(keyword, [item.country, item.phoneCode]);
    } else if (item is state.State) {
      return Helper.isContainKeyword(keyword, [item.name]);
    } else if (item is City) {
      return Helper.isContainKeyword(keyword, [item.name]);
    }
    return false;
  }
}
