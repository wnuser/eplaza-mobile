import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  final double? width;
  final double height;
  final double borderRadius;
  final dynamic child;
  final TextAlign textAlign;
  final MyTextStyle textStyle;
  final VoidCallback onPressed;
  final VoidCallback? onLongPressed;

  String _type = 'NORMAL';

  PrimaryButton({
    required this.child,
    required this.onPressed,
    this.onLongPressed,
    this.textStyle = const MyTextStyle(
        color: Colors.white, fontSize: fontSizeLarge, fontWeight: FontWeight.w400),
    this.width,
    this.height = 50,
    this.borderRadius = 14,
    this.textAlign = TextAlign.start,
    Key? key,
  }) : super(key: key) {
    this._type = 'NORMAL';
  }

  PrimaryButton.outline({
    required this.child,
    required this.onPressed,
    this.onLongPressed,
    this.textStyle = const MyTextStyle(
        color: ThemeColors.black, fontSize: fontSizeLarge, fontWeight: FontWeight.w400),
    this.width,
    this.height = 54,
    this.borderRadius = 14,
    this.textAlign = TextAlign.start,
    Key? key,
  }) : super(key: key) {
    this._type = 'OUTLINE';
  }

  @override
  Widget build(BuildContext context) {
    if (_type == 'NORMAL') {
      return TextButton(
        onPressed: onPressed,
        onLongPress: onLongPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
        ),
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: ThemeColors.primaryGradient,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: child is Widget
                ? child
                : Text(child.toString(), style: textStyle, textAlign: textAlign),
          ),
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            minimumSize: Size(width ?? 60.w, height),
            // elevation: 0,
            // shadowColor: Colors.grey.shade50,
            backgroundColor: Colors.white,
            side: BorderSide(color: ThemeColors.defaultTextColor, width: 1.2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height / 2))),
        child: child is Widget
            ? child
            : Text(child.toString(), style: textStyle, textAlign: textAlign),
      );
    }
  }
}
