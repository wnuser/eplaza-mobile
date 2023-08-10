import 'package:e_plaza/modals/city.dart';
import 'package:e_plaza/modals/country.dart';
import 'package:e_plaza/modals/state.dart' as state;
import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';

import '../modals/country2.dart';
import '../modals/store_category.dart';

class MyPopupMenuButton<T> extends StatelessWidget {
  final String title;
  final List<T> list;
  final Widget child;
  final EdgeInsets padding;
  final void Function(T t)? onSelected;
  final void Function()? onTap;
  final bool center;
  final bool enabled;

  MyPopupMenuButton({
    required this.title,
    required this.list,
    required this.child,
    this.center = false,
    this.enabled = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    this.onSelected,
  }) {
    if (title.notEmpty)
      _items.add(
        PopupMenuItem(
          padding: padding,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: center ? MainAxisAlignment.center : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: ThemeColors.defaultTextColor,
                    fontSize: fontSizeMedium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

    for (T item in list) {
      _items.add(PopupMenuItem(
        // onTap: () => onSelected.call(item),
        value: item,
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: center ? MainAxisAlignment.center : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Expanded(child: _getChild(item))],
        ),
      ));
    }
  }

  final List<PopupMenuItem> _items = [];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // padding: padding,
      enabled: enabled,
      itemBuilder: (context) => _items,
      onSelected: (e) {
        if (onSelected != null) onSelected!.call(e as T);
      },
      initialValue: 1,
      tooltip: title,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Colors.white,
      elevation: 4,
      child: !enabled
          ? InkWell(
              onTap: onTap,
              customBorder: CircleBorder(),
              child: child,
            )
          : child,
    );
  }

  Widget _getChild(T item) {
    MyTextStyle _textStyle = MyTextStyle(
        color: ThemeColors.defaultTextColor, fontSize: fontSizeMedium, fontWeight: FontWeight.w500);
    TextAlign _align = TextAlign.start;

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
              item.country + ' (' + item.phoneCode + ')',
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
    } else if (item is StoreCategory) {
      return Text(item.title.nullSafe, textAlign: _align, style: _textStyle);
    }
    return empty();
  }
}
