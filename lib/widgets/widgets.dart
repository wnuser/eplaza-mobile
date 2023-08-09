import 'dart:io';
import 'dart:math';

import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/logger.dart';
import 'package:e_plaza_vendor/values/dimen.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/strings.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'my_network_image.dart';
import 'shimmer.dart';

Widget empty() => const SizedBox();

Widget smallIconImage(String iconName, void Function() cb,
    {double size = smallRoundButtonSize,
    MaterialColor? color,
    MaterialColor? iconColor,
    double factor = 2}) {
  return SizedBox(
    width: size,
    height: size,
    child: MyFlatButton(
      onPressed: cb,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: const CircleBorder(),
      color: color != null ? color.shade50 : null,
      splashColor: color != null ? color.shade100 : null,
      child: assetImage(iconName, width: size / factor, height: size / factor, color: iconColor),
    ),
  );
}

Widget smallIcon(
  IconData icon,
  void Function()? cb, {
  double size = smallRoundButtonSize,
  double? iconSize = smallRoundButtonSize / 2,
  Color? color = ThemeColors.colorPrimary,
  Color? imageColor = ThemeColors.colorPrimary,
}) {
  return SizedBox(
    width: size,
    height: size,
    child: MyFlatButton(
        onPressed: cb,
        padding: EdgeInsets.zero,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const CircleBorder(),
        color: color != null ? color : null,
        splashColor: color != null ? color : null,
        child: Icon(icon, size: iconSize ?? size / 2, color: imageColor)),
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
    double fontSize = fontSizeLarge,
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
      {required final VoidCallback? onPressed,
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

// ignore: must_be_immutable
class FileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final dynamic file;
  final void Function() onTap;
  final String baseImgPath;
  final Widget? trailing;

  FileWidget(this.title, this.subtitle, this.file, this.onTap, this.baseImgPath, {this.trailing});

  Widget _leading = empty();
  Widget _trailing = empty();

  @override
  Widget build(BuildContext context) {
    init();
    return ListTile(
      onTap: onTap,
      dense: true,
      title: Text(title),
      subtitle: Text(subtitle),
      tileColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: _leading,
      trailing: trailing ?? _trailing,
    );
  }

  void init() {
    if (file is File) {
      File f = file;
      if (f.path.notEmpty) {
        _leading = Image.file(
          file,
          width: 40,
          height: 40,
          // errorBuilder: (a, b, c) => assetImage(Helper.fileIcon(file.path), width: 40, height: 40),
        );
        _trailing = Icon(Icons.check, color: Colors.green, size: 22);
        return;
      }
    }

    if (file is String) {
      Logger.m(tag: "MEDIA FILE 123", value: baseImgPath + file);
      String str = file;
      if (str.notEmpty) {
        _leading = MyNetworkImage(
          path: baseImgPath,
          imageName: str,
          width: 40,
          height: 40,
        );
        _trailing = Icon(Icons.check, color: Colors.green, size: 22);
        return;
      }
    }

    _leading = Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: ThemeColors.colorPrimary,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.add, color: Colors.white, size: 20),
    );
  }
}

Widget submitButton(String txt, void Function() callback) {
  return TextButton(
    onPressed: callback,
    style: TextButton.styleFrom(
      padding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: ThemeColors.colorPrimary,
    ),
    child: Text(
      txt,
      style: TextStyle(
        fontSize: fontSizeSmall,
        color: Colors.white,
      ),
    ),
  );
}

Widget cancelButton(String txt, void Function() callback) {
  return OutlinedButton(
    onPressed: callback,
    style: TextButton.styleFrom(
      padding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: ThemeColors.white,
      side: BorderSide(color:ThemeColors.colorPrimary, width:1),
    ),
    child: Text(
      txt,
      style: TextStyle(
        fontSize: fontSizeSmall,
        color: ThemeColors.colorPrimary,
      ),
    ),
  );
}