import 'package:e_plaza_vendor/dialogs/popup_menu.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/logger.dart';
import 'package:e_plaza_vendor/values/dimen.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/widgets/my_network_image.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../modals/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final int i;
  final void Function(Product product) onDelete;
  final void Function(Product product) onEdit;

  ProductItem(this.i, this.product, {required this.onDelete, required this.onEdit, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 1.5,
              spreadRadius: 1.5,
              offset: Offset(0, 1.5))
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Helper.spaceHorizontal(4),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: MyNetworkImage(
              path: Const.PRODUCT_IMAGE_PATH,
              imageName: product.image_1.nullSafe,
              width: 25.w,
              height: 25.w,
              fit: BoxFit.fitHeight,
              open: true,
              errorWidget: assetImage(
                'assets/icons/no_product.png',
                width: 25.w,
                height: 25.w,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name.nullStr,
                              style: MyTextStyle(
                                  fontSize: fontSizeExtraLarge, fontWeight: FontWeight.w500),
                            ),
                            Helper.spaceVertical(2),
                            Text(
                              product.description.nullStr,
                              style:
                                  MyTextStyle(fontSize: fontSizeSmall, color: Colors.grey.shade600),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      MyPopupMenuButton(
                        title: 'Action',
                        list: ['Edit', 'Delete'],
                        onSelected: (s) {
                          if (s == 'Edit') {
                            onEdit(product);
                          } else if (s == 'Delete') {
                            onDelete(product);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.more_vert_rounded, size: 20, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  Helper.spaceVertical(8),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade400, thickness: 0.7))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        Const.currencySymbol + product.offerPrice.toString(),
                        style: MyTextStyle(
                            fontSize: fontSizeLarge,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        Helper.format(product.createdAt.nullSafe, Helper.DATE_FORMAT_3),
                        style: MyTextStyle(fontSize: fontSizeSmall, color: Colors.grey.shade600),
                      ),
                      Helper.spaceHorizontal(12),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
