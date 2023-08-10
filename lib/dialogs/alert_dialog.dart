import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class MyAlertDialog {
  bool _cancelable = true;
  double _cornersRound = 20;
  String _iconImage = '';
  String _defaultIconImage = '';
  double _iconSize = 34;
  String _title = '';
  String _message = '';
  double _titleTextSize = fontSizeLarge;
  Color _titleTextColor = ThemeColors.defaultTextColor;
  Color _messageTextColor = ThemeColors.defaultTextColor;
  Color _buttonsTextColor = ThemeColors.defaultTextColor;
  bool _html = false;
  String _negativeButtonText = '';
  String _neutralButtonText = '';
  String _positiveButtonText = '';
  bool _textSelectable = false;
  void Function()? _positiveClickListener;
  void Function()? _negativeClickListener;
  void Function()? _neutralClickListener;
  Alignment _buttonAlignment = Alignment.centerRight;
  Alignment _titleAlignment = Alignment.centerLeft;
  Alignment _messageAlignment = Alignment.centerLeft;
  double _firstSpacing = 15;
  double _secondSpacing = 10;

  MyAlertDialog();

  MyAlertDialog setIcon(String _iconImage, {String defaultIcon = 'assets/icons/logo.png'}) {
    this._iconImage = _iconImage;
    _defaultIconImage = defaultIcon;
    return this;
  }

  MyAlertDialog setDefaultIcon() {
    _defaultIconImage = 'assets/icons/logo.png';
    return this;
  }

  MyAlertDialog setIconSize(double iconSize) {
    _iconSize = iconSize;
    return this;
  }

  MyAlertDialog setCornersRound(double cornersRound) {
    _cornersRound = cornersRound;
    return this;
  }

  MyAlertDialog setFirstSpacing(double space) {
    _firstSpacing = space;
    return this;
  }

  MyAlertDialog setSecondSpacing(double space) {
    _secondSpacing = space;
    return this;
  }

  MyAlertDialog setButtonAlignment(Alignment buttonAlignment) {
    _buttonAlignment = buttonAlignment ?? Alignment.centerRight;
    return this;
  }

  MyAlertDialog setTitleAlignment(Alignment titleAlignment) {
    _titleAlignment = titleAlignment ?? Alignment.centerLeft;
    return this;
  }

  MyAlertDialog setMessageAlignment(Alignment messageAlignment) {
    _messageAlignment = messageAlignment ?? Alignment.centerLeft;
    return this;
  }

  MyAlertDialog setTextSelectable() {
    _textSelectable = true;
    return this;
  }

  MyAlertDialog setTitle(String title) {
    _title = title;
    return this;
  }

  MyAlertDialog setTitleTextSize(double titleTextSize) {
    _titleTextSize = titleTextSize;
    return this;
  }

  MyAlertDialog setMessage(String message) {
    _message = message;
    return this;
  }

  MyAlertDialog setPositiveButton(String text, void Function()? positiveClickListener) {
    _positiveButtonText = text;
    _positiveClickListener = positiveClickListener;
    return this;
  }

  MyAlertDialog setNeutralButton(String text, void Function()? neutralClickListener) {
    _neutralButtonText = text;
    _neutralClickListener = neutralClickListener;
    return this;
  }

  MyAlertDialog setNegativeButton(String text, void Function()? negativeClickListener) {
    _negativeButtonText = text;
    _negativeClickListener = negativeClickListener;
    return this;
  }

  MyAlertDialog setTitleTextColor(Color titleTextColor) {
    _titleTextColor = titleTextColor;
    return this;
  }

  MyAlertDialog setMessageTextColor(Color messageTextColor) {
    _messageTextColor = messageTextColor;
    return this;
  }

  MyAlertDialog setButtonsTextColor(Color buttonsTextColor) {
    _buttonsTextColor = buttonsTextColor;
    return this;
  }

  MyAlertDialog setDialogCancelable(bool cancelable) {
    _cancelable = cancelable;
    return this;
  }

  MyAlertDialog setHtml(bool isHtml) {
    _html = isHtml;
    return this;
  }

  void show() {
    Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_cornersRound)),
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            decoration: Helper.dialogBoxDecoration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: _titleAlignment,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _iconImage.isNotEmpty || _defaultIconImage.isNotEmpty
                          ? Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(_iconSize / 2),
                                child: assetImage('assets/icons/logo_circle.png',
                                    width: _iconSize,
                                    height: _iconSize,
                                    errorBuilder: (ctx, o, e) => assetImage(_defaultIconImage,
                                        width: _iconSize, height: _iconSize)),
                                // child: Helper.isValidUrl(_iconImage, validExtensions: Helper.validImageExtensions)
                                //     ? MyNetworkImage(
                                //         path: _iconImage,
                                //         width: _iconSize,
                                //         height: _iconSize,
                                //         errorWidget: assetImage(_defaultIconImage, width: _iconSize, height: _iconSize),
                                //       )
                                //     : assetImage(_defaultIconImage, width: _iconSize, height: _iconSize),
                              ),
                            )
                          : empty(),
                      Flexible(
                          child: Text(_title,
                              style:
                                  MyTextStyle(color: _titleTextColor, fontSize: _titleTextSize))),
                    ],
                  ),
                ),
                Helper.spaceVertical(_firstSpacing),
                Flexible(
                    child: SingleChildScrollView(
                        child: Align(alignment: _messageAlignment, child: _textWidget()))),
                Helper.spaceVertical(_secondSpacing),
                Align(
                  alignment: _buttonAlignment ?? Alignment.centerRight,
                  child: Row(mainAxisSize: MainAxisSize.min, children: _getButtons()),
                )
              ],
            ),
          ),
        ),
        barrierDismissible: _cancelable);
  }

  List<Widget> _getButtons() {
    List<Widget> list = [];

    if (_negativeButtonText.isNotEmpty) {
      list.add(MaterialButton(
        onPressed: () {
          if (_negativeClickListener != null) {
            _negativeClickListener!();
          } else {
            Get.back();
          }
        },
        minWidth: 0,
        height: 0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(_negativeButtonText,
            style: MyTextStyle(color: _buttonsTextColor, fontSize: fontSizeSmall)),
      ));
    }

    if (_neutralButtonText.isNotEmpty) {
      list.add(MaterialButton(
        onPressed: () {
          if (_neutralClickListener != null) {
            _neutralClickListener!();
          } else {
            Get.back();
          }
        },
        minWidth: 0,
        height: 0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(_neutralButtonText,
            style: MyTextStyle(
              color: _buttonsTextColor,
              fontSize: fontSizeSmall,
            )),
      ));
    }

    if (_positiveButtonText.isNotEmpty) {
      list.add(MaterialButton(
        onPressed: () {
          if (_positiveClickListener != null) {
            _positiveClickListener!();
          } else {
            Get.back();
          }
        },
        minWidth: 0,
        height: 0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(_positiveButtonText,
            style: MyTextStyle(
              color: _buttonsTextColor,
              fontSize: fontSizeSmall,
            )),
      ));
    }
    return list;
  }

  Widget _textWidget() {
    if (_html) {
      return Html(data: _message, shrinkWrap: true);
    } else if (_textSelectable) {
      return SelectableText(
        _message,
        style: MyTextStyle(color: _messageTextColor, fontSize: fontSizeMedium),
      );
    } else {
      return Text(
        _message,
        style: MyTextStyle(color: _messageTextColor, fontSize: fontSizeMedium),
        softWrap: true,
      );
    }
  }
}
