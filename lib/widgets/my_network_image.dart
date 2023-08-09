import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/widgets/image_view.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';

class MyNetworkImage extends StatelessWidget {
  final String? path;
  final String imageName;
  double? width;
  double? height;
  final VoidCallback? onLongPress;
  final Widget? errorWidget;
  final Color? color;
  final Color? errorBackgroundColor;
  final BoxFit fit;
  final bool open;
  final bool enableLoader;
  final bool isShimmerLoader;
  final ShapeBorder? shapeBorder;
  final String? title;
  final List<String> images;

  MyNetworkImage({
    Key? key,
    required this.path,
    this.imageName = '',
    this.width,
    this.height,
    this.onLongPress,
    this.errorWidget,
    this.color,
    this.errorBackgroundColor,
    this.fit = BoxFit.cover,
    this.open = false,
    this.enableLoader = true,
    this.isShimmerLoader = false,
    this.shapeBorder,
    this.title,
    this.images = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = path.nullSafe + imageName.nullSafe;
    bool isValid = Helper.isValidUrl(url);
    // Logger.m(tag: 'NETWORK IMAGE PATH', value: url);
    try {
      return InkWell(
        onTap: open
            ? () {
                if (isValid) {
                  Get.to(() => ImageViewScreen(
                      path.nullSafe, imageName.nullSafe,
                      title: title, images: images));
                }
              }
            : null,
        onLongPress: onLongPress,
        customBorder: shapeBorder ?? const CircleBorder(),
        child: CachedNetworkImage(
          imageUrl: path.nullSafe + imageName.nullSafe,
          width: width,
          height: height,
          errorWidget: (context, string, dynamic) {
            isValid = false;
            return errorWidget ??
                Container(
                  color: errorBackgroundColor ?? Colors.red.shade50,
                  child: const Center(
                      child: Icon(Icons.error_outline,
                          size: 30, color: Colors.red)),
                );
          },
          placeholder: (context, string) {
            width = width ?? 80;
            height = height ?? 80;
            double indicatorSize = min(width!, height!);
            return enableLoader
                ? Center(
                    child: SizedBox(
                        width: indicatorSize / 2,
                        height: indicatorSize / 2,
                        child: isShimmerLoader
                            ? circleShimmerPlaceholder(size: indicatorSize / 2)
                            : const CircularProgressIndicator(strokeWidth: 2)))
                : empty();
          },
          color: color,
          fit: fit,
        ),
      );
    } catch (e) {
      return errorWidget ??
          Container(
            color: errorBackgroundColor ?? Colors.red.shade50,
            child: const Center(
              child: Icon(Icons.error_outline, size: 30, color: Colors.red),
            ),
          );
    }
  }
}
