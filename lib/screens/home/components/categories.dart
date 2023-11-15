import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../apiHandler/network_constant.dart';
import '../../../modals/category.dart';
import '../../../modals/home_main_category_model.dart';

class CategoriesWidget extends StatelessWidget {
  final List<HomeMainCategoriesModel> categories;

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
    return Obx(() {
      if (categories.isEmpty) {
        // Display a loading indicator or placeholder when data is being fetched.
        return Center(child: CircularProgressIndicator()); // You can replace this with any loading widget.
      } else {
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
            children: categories.map((category) {
              if (category.data != null && category.data!.isNotEmpty) {
                // If the data list is not empty, use the mainBanner from the first Data object
                return _item(category.data![0]);
              } else {
                // If the data list is empty, use default data
                return _defaultItem();
              }
            }).toList(),
          ),
        );
      }
      });

  }

  Widget _item(Data category) {
    if (colorIndex == colors.length - 1) {
      colorIndex = 0;
    } else {
      colorIndex++;
    }

    final defaultTitle = 'Not Availbale';
    final defaultImage = 'https://rukminim1.flixcart.com/flap/128/128/image/29327f40e9c4d26b.png?q=100';

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
            (category.name ?? defaultTitle).replaceAll(' ', '\n'),
            style: MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w500),
          ),
          Helper.spaceHorizontal(4),
          ClipRRect(
            borderRadius: BorderRadius.circular(_h / 4),
            child: MyNetworkImage(
              path: NetworkConstantsUtil.cat_img_path,
              imageName: category.mainBanner!,
              height: _h / 1.7,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _defaultItem() {
    final defaultTitle = 'Not Available';
    final defaultImage = 'https://rukminim1.flixcart.com/flap/128/128/image/29327f40e9c4d26b.png?q=100';

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
            defaultTitle.replaceAll(' ', '\n'),
            style: MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w500),
          ),
          Helper.spaceHorizontal(4),
          ClipRRect(
            borderRadius: BorderRadius.circular(_h / 4),
            child: MyNetworkImage(
              path: defaultImage,
              height: _h / 1.7,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}