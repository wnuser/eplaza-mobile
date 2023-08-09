import 'dart:math' as math;

import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/dimen.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/my_network_image.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class ImageViewScreen extends StatefulWidget {
  final String _basePath;
  String _imageName;
  final String? title;
  final List<String> images;

  ImageViewScreen(this._basePath, this._imageName, {Key? key, this.title, this.images = const []})
      : super(key: key);

  @override
  _ImageViewScreenState createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  int? initialIndex;
  List<String> images = [];

  final _imagesController = ScrollController();
  PageController? _pageController;

  @override
  void initState() {
    super.initState();

    widget.images.map((e) {
      images.addIf(Helper.isValidUrl(widget._basePath + e.nullSafe), e);
    }).toList();

    initialIndex = images.isNotEmpty ? images.indexOf(widget._imageName) : 0;

    if (images.isNotEmpty) {
      Future.delayed(
          const Duration(milliseconds: 200),
          () => _imagesController.animateTo(((initialIndex! * 56) - 200).toDouble(),
              duration: const Duration(milliseconds: 500), curve: Curves.easeInOut));
    }

    _pageController = PageController(initialPage: initialIndex ?? 0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: math.max(images.length, 1),
              onPageChanged: (pos) {
                setState(() {
                  initialIndex = pos;
                  _imagesController.animateTo(((initialIndex! * 100) - 200).toDouble(),
                      duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                });
              },
              itemBuilder: (ctx, pos) {
                widget._imageName = images.isNotEmpty ? images[pos] : widget._imageName;
                return PhotoView(
                  backgroundDecoration: const BoxDecoration(color: Colors.white),
                  imageProvider: NetworkImage(widget._basePath + widget._imageName.nullSafe),
                  loadingBuilder: (img, ci) => Center(
                    child: SizedBox.fromSize(
                      size: const Size.square(40),
                      child: const CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(ThemeColors.colorPrimary)),
                    ),
                  ),
                  errorBuilder: (b, o, s) => Container(
                    color: Colors.red.shade50,
                    child: const Center(
                      child: Icon(Icons.error_outline, size: 30, color: Colors.red),
                    ),
                  ),
                );
              },
            ),
            Container(
              width: 100.w,
              height: 55,
              color: ThemeColors.colorPrimary,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: TextButton(
                      onPressed: Get.back,
                      style: TextButton.styleFrom(
                          shape: const CircleBorder(), padding: EdgeInsets.zero),
                      child:
                          const Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size: 18),
                    ),
                  ),
                  Text(
                    widget.title ?? 'Image',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                    style: MyTextStyle(color: Colors.white, fontSize: fontSizeLarge),
                  )
                ],
              ),
            ),
            _imageList()
          ],
        ),
      ),
    );
  }

  Widget _imageList() {
    double size = 80;
    return images.isNotEmpty
        ? Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _imagesController,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, pos) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: InkWell(
                        onTap: () => _pageController!.jumpToPage(pos),
                        child: SizedBox(
                          width: size,
                          height: size,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: MyNetworkImage(
                                    path: widget._basePath,
                                    imageName: images[pos],
                                    fit: BoxFit.cover,
                                    width: size,
                                    height: size),
                              ),
                              if (initialIndex != pos)
                                Container(
                                  width: size,
                                  height: size,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black38),
                                )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        : empty();
  }
}
