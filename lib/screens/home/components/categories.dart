import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../modals/category.dart';

class CategoriesWidget extends StatelessWidget {
  final List<Category> categories;
  final double _h = 60;
  final List<Color> colors = [
    Color.fromARGB(255, 246, 194, 192),
    Color.fromARGB(255, 241, 241, 206),
    Color.fromARGB(255, 220, 233, 243),
    Color.fromARGB(255, 219, 243, 206),
  ];
  int colorIndex = 0;

  CategoriesWidget({required this.categories, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: _h,
      margin: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        // BoxShadow(
        //     color: Colors.grey.withOpacity(0.4),
        //     spreadRadius: 2,
        //     blurRadius: 2,
        //     offset: Offset(0, 1))
      ]),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: categories.map(_item).toList(),
      ),
    );
  }

  Widget _item(Category category) {
    if (colorIndex == colors.length - 1) {
      colorIndex = 0;
    } else {
      colorIndex++;
    }

    return Container(
      height: _h,
      margin: EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: colors[colorIndex],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: colors[colorIndex].withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2))
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            category.title.nullStr.replaceAll(' ', '\n'),
            style: MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w500),
          ),
          Helper.spaceHorizontal(4),
          ClipRRect(
            borderRadius: BorderRadius.circular(_h / 4),
            child: MyNetworkImage(
              path: category.image,
              height: _h / 1.7,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
