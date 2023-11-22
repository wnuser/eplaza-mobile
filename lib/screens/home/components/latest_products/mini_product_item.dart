import 'package:e_plaza/helper/extension.dart';
import 'package:e_plaza/modals/LatestProduct.dart';
import 'package:e_plaza/screens/store_product_details/store_product_details_screen.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../modals/product.dart';
import '../../../../widgets/widgets.dart';

class LatestProductItemMini extends StatelessWidget {
  final LatestProduct product;

  LatestProductItemMini(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(() => StoreProductDetailsScreen(product_id: product.id!));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2),
        padding: EdgeInsets.only(top: 0, bottom: 0, left: 12, right: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 10,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                product.name.nullSafe,
                style: MyTextStyle(fontSize: fontSizeSmall),
              ),
            ),
            MyNetworkImage(
              path: '',
              imageName: product.image1.nullSafe,
              height: 28,
              width: 28,
            ),
          ],
        ),
      ),
    );
  }
}
