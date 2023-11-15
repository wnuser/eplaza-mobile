import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_plaza/modals/slide.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/shimmer.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/my_network_image.dart';

class BusinessSection extends StatelessWidget {
  final List<Slide> slides;
  final List<dynamic> products;
  RxInt current = 0.obs;

  BusinessSection(this.slides, this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 40.w,
          // margin: EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: slides.isEmpty
                ? _sliderPlaceholder()
                : Stack(
                    children: [
                      Stack(alignment: Alignment.bottomCenter, children: [
                        CarouselSlider(
                          items: _slides,
                          options: CarouselOptions(
                            aspectRatio: 4 / 7.8,
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
                                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  // shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(4),
                                  color: current.value == index
                                      ? ThemeColors.colorPrimary
                                      : Colors.white,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ]),
                      Center(child: _content()),
                    ],
                  ),
          ),
        ),
        // Center(child: Container(width: 42.w, height: 55.w, child: ProductItemGroup2(products))),
        _it(),
      ],
    );
  }

  List<Widget> get _slides => slides
      .map((item) => Container(
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
            child: Stack(
              fit: StackFit.expand,
              children: [
                MyNetworkImage(
                    path: '',
                    imageName: item.image.nullSafe,
                    fit: BoxFit.cover,
                    width: 1000.0,
                    open: true,
                    title: 'appName'.t),
                Container(color: Colors.white.withOpacity(0.8))
              ],
            ),
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
                          topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
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
                          bottomLeft: Radius.circular(5), topLeft: Radius.circular(5)),
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _content() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Discover Popular products',
            style: MyTextStyle(
              color: ThemeColors.black,
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 22.h,
            padding: EdgeInsets.symmetric(vertical: 2.5.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: assetImage('assets/images/test.png', fit: BoxFit.fitWidth),
            ),
          ),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 8.w),
              ),
              child: Text(
                'View More',
                style: MyTextStyle(
                    color: ThemeColors.white, fontSize: fontSizeSmall, fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }

  Widget _it() {
    return SizedBox(
      width: 45.w,
      child: AspectRatio(
        aspectRatio: 4 / 7,
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _item(),
              Helper.spaceVertical(12),
              _item(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Arrivals',
              style: MyTextStyle(
                fontSize: fontSizeLarge,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: MyNetworkImage(
                      path: '',
                      imageName:
                          'https://rukminim1.flixcart.com/image/832/832/k48rwcw0/watch/t/c/x/lcs-8188-lois-caron-original-imafn749euz3thtn.jpeg?q=70',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Helper.spaceHorizontal(12),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: MyNetworkImage(
                      path: '',
                      imageName:
                          'https://rukminim1.flixcart.com/image/832/832/k48rwcw0/watch/t/c/x/lcs-8188-lois-caron-original-imafn749euz3thtn.jpeg?q=70',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
