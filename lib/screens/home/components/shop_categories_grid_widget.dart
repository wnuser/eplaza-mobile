import 'package:e_plaza/screens/stores/stores_screen.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modals/store_category.dart';
import '../../../widgets/my_network_image.dart';
import '../../../widgets/widgets.dart';

class StoresCategoriesGridWidget extends StatelessWidget {
  StoresCategoriesGridWidget(this.categories, {Key? key}) : super(key: key);
  final List<StoreCategory> categories;

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 1 / 1.3,
          // mainAxisExtent: 4,
          mainAxisSpacing: 0,
          // crossAxisSpacing: 12
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: categories.map(_item).toList());
  }

  Widget _item(StoreCategory category) {
    return TextButton(
      onPressed: () {
        Get.to(() => StoresScreen(category));
      },
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 6),
          minimumSize: Size.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // width: _s.w,
            // height: _s.w,
            decoration: BoxDecoration(
              border: Border.all(color: ThemeColors.colorPrimary, width: 2),
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: MyNetworkImage(
                path: category.image,
                // width: _s,
                // height: _s,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Helper.spaceVertical(4),
          Text(
            category.title.nullStr,
            style: MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
