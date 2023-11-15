import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:flutter/material.dart';

import '../../modals/store_category.dart';

class StoreCategories extends StatelessWidget {
  final List<StoreCategory> categories;
  final double _h = 60;

  StoreCategories({required this.categories, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100.w,
      height: _h + 30,
      margin: EdgeInsets.symmetric(vertical: 2),
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

  Widget _item(StoreCategory category) {
    // if (colorIndex == colors.length - 1) {
    //   colorIndex = 0;
    // } else {
    //   colorIndex++;
    // }

    return Container(
      height: _h,
      margin: EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        // color: colors[colorIndex],
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //       color: colors[colorIndex].withOpacity(0.4),
        //       spreadRadius: 2,
        //       blurRadius: 4,
        //       offset: Offset(0, 2))
        // ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(_h / 2.6),
            child: MyNetworkImage(
              path: category.image,
              height: _h / 1.2,
              fit: BoxFit.fitHeight,
            ),
          ),
          // Helper.spaceHorizontal(4),
          Text(
            category.title.nullStr /*.replaceAll(' ', '\n')*/,
            style: MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
