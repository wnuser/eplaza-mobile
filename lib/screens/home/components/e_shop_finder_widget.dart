import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../search_screen/search_screen.dart';

class EShopFinderWidget extends StatelessWidget {
  final String location;

  EShopFinderWidget({required this.location, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.black,
        // borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.w))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Helper.spaceVertical(4),
          Text(
            'E-SHOP FINDER',
            style: MyTextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSizeLarge,
            ),
          ),
          Helper.spaceVertical(12),
          GestureDetector(
            onTap: () {
              Get.to(() => SearchScreen());
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2))
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Search your favorite shop',
                    style: MyTextStyle(
                        fontSize: fontSizeMedium, fontWeight: FontWeight.w300, color: Colors.grey),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search_rounded,
                    size: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          Helper.spaceVertical(16),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined, size: 22, color: Colors.white),
              Helper.spaceHorizontal(8),
              RichText(
                text: TextSpan(
                  text: 'Current Location - ',
                  style: MyTextStyle(
                    color: Colors.white,
                    fontSize: fontSizeMedium,
                    fontWeight: FontWeight.w300,
                  ),
                  children: [
                    TextSpan(
                      text: location.nullStr,
                      style: MyTextStyle(
                          color: Colors.white,
                          fontSize: fontSizeMedium,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
              Helper.spaceVertical(4),
              Icon(
                Icons.arrow_drop_down,
                size: 25,
                color: Colors.white,
              ),
            ],
          ),
          Helper.spaceVertical(4),
        ],
      ),
    );
  }
}
