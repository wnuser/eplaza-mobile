import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_plaza/modals/ads_banner_model.dart';
import 'package:e_plaza/modals/home_slider_model.dart';
import 'package:e_plaza/modals/slide.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/shimmer.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../apiHandler/network_constant.dart';
import '../../../widgets/my_network_image.dart';

class AdsBanner extends StatelessWidget {
  // final List<Slide> slides;
  final List<AdsBannerModel> adsslider;

  RxInt current = 0.obs;

  AdsBanner(this.adsslider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (adsslider.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return adsslider.isEmpty
            ? _sliderPlaceholder()
            : Stack(alignment: Alignment.bottomCenter, children: [
          CarouselSlider(
            items: _slides,
            options: CarouselOptions(
              aspectRatio: 4 / 1.8,
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
              children: adsslider.map((slide) {
                int index = adsslider.indexOf(slide);
                return Container(
                  width: current.value == index ? 22.0 : 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(4),
                    color: current.value == index ? ThemeColors.colorPrimary : Colors.white,
                  ),
                );
              }).toList(),
            ),
          ),
          Align(alignment: Alignment.centerLeft, child: _content()),
        ]);
      }
    });

  }

  List<Widget> get _slides => adsslider.map((item) {
    final data = item.data;
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 4 / 1.8,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: data!.length > 1,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (i, s) => current.value = i,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: data?.length,
      itemBuilder: (context, index, realIndex) {
        final bannerImage = data![index].bannerImage ?? 'https://imgscf.slidemembers.com/docs/1/1/214/italian_food_-_free_presentation_template_213726.jpg';
        return Container(
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
            path: NetworkConstantsUtil.home_banner_img_path,
            imageName: bannerImage,
            fit: BoxFit.cover,
            width: 1000.0,
            open: true,
            title: 'appName'.t,
          ),
        );
      },
    );
  }).toList();

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
      padding: EdgeInsets.only(
        bottom: 12,
        left: 30,
        right: 50.w,
      ),
      // child: Column(
      //   mainAxisSize: MainAxisSize.max,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       'Start SHOPPING from your favourite shops. EXPLORE complete.',
      //       style: MyTextStyle(
      //         color: ThemeColors.white,
      //         fontSize: fontSizeSmall,
      //         fontWeight: FontWeight.w500,
      //         height: 1.4,
      //       ),
      //     ),
      //     Helper.spaceVertical(6),
      //     Text(
      //       '#DISCOUNT',
      //       style: MyTextStyle(
      //         color: ThemeColors.white,
      //         fontSize: fontSizeSmall,
      //         fontWeight: FontWeight.w400,
      //         height: 2,
      //       ),
      //     ),
      //     Helper.spaceVertical(12),
      //     TextButton(
      //       onPressed: () {},
      //       style: TextButton.styleFrom(
      //           backgroundColor: Colors.white,
      //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      //           minimumSize: Size.zero,
      //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      //       child: Text(
      //         'EXPLORE',
      //         style: MyTextStyle(
      //           fontSize: fontSizeMini,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
