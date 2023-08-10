import 'package:e_plaza/modals/store_category.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../store_products/store_products_screen.dart';

class StoreItem extends StatelessWidget {
  final StoreCategory storeCategory;
  final int i;
  final double radius = 8;

  StoreItem(this.i, this.storeCategory, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 12),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(radius / 1.6),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MyNetworkImage(
                      path: '',
                      imageName: storeCategory.image.nullSafe,
                      width: 25.w,
                      height: 25.w,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Helper.spaceHorizontal(12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            storeCategory.title.nullStr,
                            style:
                                MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Helper.spaceVertical(2),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: Colors.grey.shade700, size: fontSizeSmall),
                              Expanded(
                                child: Text(
                                  'Raipur Dehradun',
                                  style: MyTextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: fontSizeSmall,
                                      fontWeight: FontWeight.w400),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: MyNetworkImage(
                        path: '',
                        imageName:
                            'https://images.meesho.com/images/products/228753704/1dmmv_512.webp',
                        width: 40,
                        height: 40,
                        open: true,
                      ),
                    ),
                    Helper.spaceHorizontal(8),
                  ],
                ),
                Helper.spaceVertical(6),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 6, right: 8, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          color: ThemeColors.success, borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 12,
                          ),
                          Helper.spaceHorizontal(4),
                          Text(
                            '4.5',
                            style: MyTextStyle(
                              color: Colors.white,
                              fontSize: fontSizeMini,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Get.to(() => StoreProductsScreen(storeCategory));
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: ThemeColors.colorPrimary,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                      child: Text(
                        'Visit Store',
                        style: MyTextStyle(
                          color: ThemeColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
