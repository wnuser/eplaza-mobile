import 'package:e_plaza/screens/stores/stores_screen.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../apiHandler/network_constant.dart';
import '../../../modals/home_main_category_model.dart';
import '../../../modals/store_category.dart';
import '../../../widgets/my_network_image.dart';
import '../../../widgets/widgets.dart';

class StoresCategoriesGridWidget extends StatelessWidget {
  final List<HomeMainCategoriesModel> categories;
  StoresCategoriesGridWidget(this.categories, {Key? key}) : super(key: key);

  // final List<StoreCategory> categories;
  


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categories.isEmpty) {
        // Display a loading indicator or placeholder when data is being fetched.
        return Center(child: CircularProgressIndicator()); // You can replace this with any loading widget.
      } else {
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
            children: categories
                .map((category) => _item(category.data))
                .toList()
        );
      }  });
  }

  Widget _item(List<Data>? data) {
    if (data != null && data.isNotEmpty) {
      // Create a list of widgets for each item in the "Data" array
      List<Widget> dataWidgets = data.map((item) {
        return TextButton(
          onPressed: () {
            Get.to(() => StoresScreen(item));
            print("Item clicked: ${item.name}");
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 6),
            minimumSize: Size.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ThemeColors.colorPrimary, width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: MyNetworkImage(
                    path: NetworkConstantsUtil.cat_img_path,
                    imageName: item.mainBanner!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Helper.spaceVertical(4),
              Text(
                item.name ?? '',
                style: MyTextStyle(
                    fontSize: fontSizeSmall-2, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ],
          ),
        );
      }).toList();

      // Use a Column to arrange the data widgets in a single column
      return Column(children: dataWidgets);
    } else {
      return Container();
    }
  }
}
