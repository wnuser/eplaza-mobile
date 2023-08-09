import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_plaza_vendor/modals/slide.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/shimmer.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';

import '../../../widgets/my_network_image.dart';

class MainSlider extends StatelessWidget {
  final List<Slide> slides;
  RxInt current = 0.obs;

  MainSlider(this.slides, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return slides.isEmpty
        ? _sliderPlaceholder()
        : Stack(alignment: Alignment.bottomCenter, children: [
            CarouselSlider(
              items: _slides,
              options: CarouselOptions(
                aspectRatio: 4 / 1.7,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeCenterPage: true,
                onPageChanged: (i, s) => current.value = i,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: slides.map((slide) {
                  int index = slides.indexOf(slide);
                  return Container(
                    width: current.value == index ? 22.0 : 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(4),
                      color:
                          current.value == index ? ThemeColors.colorPrimary : Colors.white,
                    ),
                  );
                }).toList(),
              ),
            ),
          ]);
  }

  List<Widget> get _slides => slides
      .map((item) => Column(
    mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: MyNetworkImage(
                    path: '',
                    imageName: item.image.nullSafe,
                    fit: BoxFit.cover,
                    width: 1000.0,
                    open: true,
                    title: 'appName'.t
                  ),
                ),
          ),
        ],
      ))
      .toList();

  Widget _sliderPlaceholder() {
    return AspectRatio(
      aspectRatio: 2.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Shimmer.fromColors(
                baseColor: ThemeColors.shimmerBaseColor,
                highlightColor: ThemeColors.shimmerHighlightColor,
                child: Container(
                  width: 25,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      color: Colors.white),
                ),
              ),
            ),
            Helper.spaceHorizontal(15),
            Expanded(
              child: Shimmer.fromColors(
                baseColor: ThemeColors.shimmerBaseColor,
                highlightColor: ThemeColors.shimmerHighlightColor,
                direction: ShimmerDirection.ttb,
                period: const Duration(milliseconds: 2000),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                ),
              ),
            ),
            Helper.spaceHorizontal(15),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Shimmer.fromColors(
                baseColor: ThemeColors.shimmerBaseColor,
                highlightColor: ThemeColors.shimmerHighlightColor,
                child: Container(
                  width: 25,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5)),
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
