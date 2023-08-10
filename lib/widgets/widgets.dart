import 'dart:math';

import 'package:e_plaza/utils/const.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/utils/logger.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/strings.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'shimmer.dart';

Widget empty() => const SizedBox();

Widget smallIconImage(String iconName, void Function() cb,
    {double size = smallRoundButtonSize, Color? color, Color? iconColor, double factor = 2}) {
  return SizedBox(
    width: size,
    height: size,
    child: MyFlatButton(
      onPressed: cb,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: const CircleBorder(),
      color: color != null ? color.withOpacity(0.1):null,
      splashColor: color != null ? color.withOpacity(0.2):null,
      child: assetImage(iconName,
          width: size / factor, height: size / factor, color: iconColor),
    ),
  );
}

Widget smallIcon(IconData icon, void Function() cb,
    {double size = smallRoundButtonSize,
    double? iconSize = smallRoundButtonSize/2,
    MaterialColor color = ThemeColors.colorPrimary}) {
  return SizedBox(
    width: size,
    height: size,
    child: MyFlatButton(
      onPressed: cb,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: const CircleBorder(),
      color: color.shade50,
      splashColor: color.shade100,
      child: Icon(icon, size: iconSize ?? size / 2, color: color),
    ),
  );
}

Widget positiveButton(String text, void Function() callback, {double textSize = fontSizeSmall}) {
  return MyFlatButton(
    onPressed: callback,
    padding: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    color: Colors.green.shade50,
    child: Text(
      text,
      style: MyTextStyle(fontSize: textSize, color: Colors.green, fontWeight: FontWeight.bold),
    ),
  );
}

Widget negativeButton(String text, void Function() callback, {double textSize = fontSizeSmall}) {
  return MyFlatButton(
    onPressed: callback,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    color: Colors.red.shade50,
    child: Text(text,
        style: MyTextStyle(fontSize: textSize, color: Colors.red, fontWeight: FontWeight.bold)),
  );
}

Widget progressLayout({bool enable = true, bool onlyCircular = false}) {
  return enable == true
      ? Center(
          child: Container(
            width: onlyCircular ? Const.loaderSize / 2 : Const.loaderSize,
            height: onlyCircular ? Const.loaderSize / 2 : Const.loaderSize,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: onlyCircular
                ? const CircularProgressIndicator(strokeWidth: 2)
                : Stack(
                    fit: StackFit.expand,
                    children: [
                      const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(strokeWidth: 1)),
                      Padding(
                        padding: EdgeInsets.all(Const.loaderSize / 4),
                        child: assetImage('assets/icons/logo.png'),
                      )
                    ],
                  ),
          ),
        )
      : empty();
}

Widget emptyLayout({String? title, bool enable = true}) {
  return enable
      ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/empty.json',
                  width: min(100.w, 100.h) / 2, height: min(100.w, 100.h) / 2, repeat: true),
              Helper.spaceVertical(10),
              Text(
                title ?? Strings.get('noDataAvailable'),
                style: const MyTextStyle(fontSize: fontSizeMedium, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Helper.spaceVertical(20),
            ],
          ),
        )
      : empty();
}

Widget textShimmerPlaceholder({double height = 10, double? width}) {
  return Shimmer.fromColors(
    baseColor: ThemeColors.shimmerBaseColor,
    highlightColor: ThemeColors.shimmerHighlightColor,
    child: Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(height / 2)),
    ),
  );
}

Widget circleShimmerPlaceholder({double? size}) {
  return Shimmer.fromColors(
    baseColor: ThemeColors.shimmerBaseColor,
    highlightColor: ThemeColors.shimmerHighlightColor,
    child: Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    ),
  );
}

// Widget loginLayout() => Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(50),
//           child: assetImage(ImageIcons.provider_profile_placeholder, width: 100, height: 100),
//         ),
//         Helper.spaceVertical(30),
//         Text(
//           Strings.get('guest'),
//           style: MyTextStyle(
//               color: ThemeColors.colorPrimary,
//               fontWeight: FontWeight.bold,
//               fontSize: fontSizeLarge),
//         ),
//         Helper.spaceVertical(40),
//         SizedBox(
//           height: 40,
//           child: ElevatedButton(
//               onPressed: () => Get.to(() => LoginScreen()),
//               style: ElevatedButton.styleFrom(
//                 primary: ThemeColors.colorPrimary,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                 padding: EdgeInsets.symmetric(horizontal: 40),
//                 elevation: 2,
//               ),
//               child: Text(Strings.get('login'),
//                   style: MyTextStyle(
//                       color: ThemeColors.white,
//                       fontWeight: FontWeight.normal,
//                       fontSize: fontSizeLarge))),
//         ),
//         Helper.spaceVertical(40),
//         RichText(
//           text: TextSpan(
//             text: Strings.get('dontHaveAnAccount') + ' ',
//             style: MyTextStyle(fontSize: fontSizeMedium, color: ThemeColors.colorPrimary),
//             children: [
//               TextSpan(
//                 text: Strings.get('createOne'),
//                 style: MyTextStyle(
//                     fontSize: fontSizeMedium,
//                     color: ThemeColors.colorPrimary,
//                     fontWeight: FontWeight.bold,
//                     decoration: TextDecoration.underline),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () => Get.to(() => RegistrationOptionScreen()),
//               )
//             ],
//           ),
//         )
//       ],
//     );

// void loginDialog() => Get.dialog(Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(25),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Text(
//                     Strings.get('youNeedToLogin'),
//                     style: MyTextStyle(
//                         color: ThemeColors.colorPrimary,
//                         fontWeight: FontWeight.w600,
//                         fontSize: fontSizeMedium),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 Helper.spaceVertical(30),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   child:
//                       assetImage(ImageIcons.provider_profile_placeholder, width: 100, height: 100),
//                 ),
//                 Helper.spaceVertical(30),
//                 SizedBox(
//                   height: 40,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Get.back();
//                         Get.to(() => LoginScreen());
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: ThemeColors.colorPrimary,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                         padding: EdgeInsets.symmetric(horizontal: 40),
//                         elevation: 2,
//                       ),
//                       child: Text(Strings.get('login'),
//                           style: MyTextStyle(
//                               color: ThemeColors.white,
//                               fontWeight: FontWeight.normal,
//                               fontSize: fontSizeLarge))),
//                 ),
//                 Helper.spaceVertical(20),
//                 RichText(
//                   text: TextSpan(
//                       text: Strings.get('dontHaveAnAccount') + ' ',
//                       style: MyTextStyle(fontSize: fontSizeMedium, color: ThemeColors.colorPrimary),
//                       children: [
//                         TextSpan(
//                             text: Strings.get('createOne'),
//                             style: MyTextStyle(
//                                 fontSize: fontSizeMedium,
//                                 color: ThemeColors.colorPrimary,
//                                 fontWeight: FontWeight.bold,
//                                 decoration: TextDecoration.underline),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 Get.back();
//                                 Get.to(() => RegistrationOptionScreen());
//                               })
//                       ]),
//                 )
//               ],
//             ),
//           ),
//           Positioned(
//             top: 0,
//             right: 0,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 width: 34,
//                 height: 34,
//                 child: MyFlatButton(
//                   onPressed: Get.back,
//                   padding: EdgeInsets.zero,
//                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   shape: CircleBorder(),
//                   // color: ThemeColors.colorPrimary.shade50,
//                   splashColor: ThemeColors.colorPrimary.shade100,
//                   child: Icon(Icons.close, size: 17, color: ThemeColors.colorPrimary),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     ));

// class SafeText extends Text {
//   const SafeText(
//     final String text, {
//     final String nullText = '',
//     final MyTextStyle style,
//     final TextAlign textAlign,
//     final TextDirection textDirection,
//     final bool softWrap,
//     final TextOverflow overflow,
//     final int maxLines,
//   }) : super(text ?? (nullText),
//             style: style, textAlign: textAlign, textDirection: textDirection, softWrap: softWrap, overflow: overflow, maxLines: maxLines);
// }

class MyTextStyle extends TextStyle {
  const MyTextStyle({
    bool inherit = true,
    Color? color,
    Color? backgroundColor,
    double fontSize = fontSizeMedium,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    String? fontFamily,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextDecoration? decoration,
  }) : super(
            inherit: inherit,
            color: color ?? ThemeColors.defaultTextColor,
            backgroundColor: backgroundColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            textBaseline: textBaseline,
            height: height,
            decoration: decoration);
}

class MyFlatButton extends MaterialButton {
  // ignore: use_key_in_widget_constructors
  const MyFlatButton(
      {required final VoidCallback onPressed,
      required final Widget child,
      final VoidCallback? onLongPress,
      final double? height,
      final double width = double.infinity,
      final double? minWidth,
      final Color? color,
      final Color? focusColor,
      final Color? splashColor,
      final Color? textColor,
      final EdgeInsetsGeometry? padding = EdgeInsets.zero,
      final ShapeBorder? shape,
      final double? elevation,
      final MaterialTapTargetSize? materialTapTargetSize})
      : super(
          onPressed: onPressed,
          onLongPress: onLongPress,
          height: height,
          minWidth: minWidth,
          color: color ?? Colors.transparent,
          highlightElevation: elevation ?? 0,
          focusColor: focusColor,
          splashColor: splashColor,
          textColor: textColor,
          padding: padding ?? EdgeInsets.zero,
          shape: shape,
          elevation: elevation ?? 0,
          materialTapTargetSize: materialTapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
          child: child,
        );
}

Widget assetImage(String name,
    {double? width,
    double? height,
    Color? color,
    BoxFit? fit,
    Alignment alignment = Alignment.center,
    ImageErrorWidgetBuilder? errorBuilder}) {
  if (name.empty) return SizedBox(width: width, height: height);
  return Image.asset(
    name,
    width: width,
    height: height,
    color: color,
    fit: fit,
    alignment: alignment,
    errorBuilder: errorBuilder ??
        (c, o, s) {
          Logger.e(tag: 'ASSET IMAGE "' + name + '"', value: s);
          return SizedBox(width: width, height: height);
        },
  );
}

Widget imagePlaceholderByName(String name, double size, {Color? color, Color? textColor}) {
  return Container(
    width: size,
    height: size,
    alignment: Alignment.center,
    decoration: BoxDecoration(color: color ?? Colors.grey.shade400, shape: BoxShape.circle),
    child: Text(
      name.everyFirstDigit,
      style: MyTextStyle(
          color: textColor ?? ThemeColors.white, fontSize: size / 2, fontWeight: FontWeight.bold),
    ),
  );
}

Widget floatingActionButton(String imageName, {required VoidCallback onPressed}) {
  return FloatingActionButton(
    onPressed: onPressed,
    shape: const CircleBorder(),
    child: assetImage(imageName, color: Colors.white, width: 24, height: 24),
  );
}

// Widget marqueeText({String text, Color color = ThemeColors.colorPrimary}) {
//   return SizedBox(
//     width: 100.w,
//     height: fontSizeLarge,
//     child: Marquee(
//       text: text ?? Strings.get('tagLine'),
//       style:  MyTextStyle(
//           color: color, fontWeight: FontWeight.w600, fontSize: fontSizeLarge),
//       scrollAxis: Axis.horizontal,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       blankSpace: 20.0,
//       velocity: 50.0,
//       pauseAfterRound: const Duration(seconds: 1),
//       startPadding: 10.0,
//       accelerationDuration: const Duration(seconds: 1),
//       accelerationCurve: Curves.linear,
//       decelerationDuration: const Duration(milliseconds: 500),
//       decelerationCurve: Curves.easeOut,
//     ),
//   );
// }
