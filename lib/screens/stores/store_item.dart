import 'package:e_plaza/modals/category_shop_model.dart';
import 'package:e_plaza/modals/store_category.dart';
import 'package:e_plaza/screens/single_store_screen/single_store_screen.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/category_stores_model.dart';

class StoreItem extends StatelessWidget {
  final CategoryShopModel _categoryStoreModel;
  final int i;
  final double radius = 5;

  StoreItem(this.i, this._categoryStoreModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: Colors.grey.shade300, width: 2)
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade300,
          //     spreadRadius: 4,
          //     blurRadius: 0,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
          ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                // color: Colors.green.shade50,
                // border: Border.all(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(radius / 1.6),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey.withOpacity(0.5),
                //       spreadRadius: 2,
                //       blurRadius: 2,
                //       offset: Offset(0, 2))
                // ],
              ),
              child: MyNetworkImage(
                path: '',
                imageName: _categoryStoreModel.data![0].image1.nullSafe,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          // Helper.spaceVertical(6),
          Helper.spaceVertical(1),
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
                      _categoryStoreModel.data![0].shopName.nullStr,
                      style: MyTextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    // Helper.spaceVertical(1.5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: Colors.grey.shade700, size: fontSizeSmall),
                        Flexible(
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
            ],
          ),
          // Helper.spaceVertical(6),
          // Container(
          //   padding: EdgeInsets.only(left: 6, right: 8, top: 4, bottom: 4),
          //   decoration: BoxDecoration(
          //       color: ThemeColors.success, borderRadius: BorderRadius.circular(10)),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Icon(
          //         Icons.star,
          //         color: Colors.white,
          //         size: 12,
          //       ),
          //       Helper.spaceHorizontal(4),
          //       Text(
          //         '4.5',
          //         style: MyTextStyle(
          //           color: Colors.white,
          //           fontSize: fontSizeMini,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Helper.spaceVertical(4),
          TextButton(
            onPressed: () {
              // Get.to(() => SingleStoreScreen(storeCategory));
            },
            style: TextButton.styleFrom(
                backgroundColor: ThemeColors.colorPrimary,
                minimumSize: Size.zero,
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            child: Text(
              'Visit Store',
              style: MyTextStyle(color: ThemeColors.white, fontSize: fontSizeMini),
            ),
          ),
        ],
      ),
    );
  }
}
