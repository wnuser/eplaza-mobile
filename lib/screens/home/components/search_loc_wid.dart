import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../search_screen/search_screen.dart';

class SearchAndLocWid extends StatelessWidget {
  final String location;

  SearchAndLocWid({required this.location, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(
          color: ThemeColors.colorPrimary,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(14.w))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Helper.spaceVertical(4),
          GestureDetector(
            onTap: () {
              Get.to(() => SearchScreen());
            },
            child: Container(
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
                  Icon(
                    Icons.search_rounded,
                    size: 22,
                    color: Colors.grey.shade400,
                  ),
                  Helper.spaceHorizontal(12),
                  Text(
                    'Search',
                    style: MyTextStyle(
                        color: Colors.grey.shade400,
                        fontSize: fontSizeMedium,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
          Helper.spaceVertical(18),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined, size: 22, color: Colors.white),
              Helper.spaceHorizontal(8),
              RichText(
                text: TextSpan(
                  text: 'Delivery Location - ',
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
