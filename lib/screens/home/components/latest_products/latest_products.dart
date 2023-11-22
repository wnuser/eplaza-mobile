import 'package:e_plaza/modals/LatestProduct.dart';
import 'package:e_plaza/modals/latest%20_product_model.dart';
import 'package:e_plaza/screens/home/components/offer_products/product_item_group.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../modals/gmart_cat_model.dart';
import '../../../../modals/product.dart';
import '../../../../widgets/primary_button.dart';
import 'latest_products_group.dart';
import 'product_item.dart';

class LatestProducts extends StatelessWidget {
  final List<LatestProduct> products;
  // final LatestProductModel products;

  LatestProducts({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Obx(() {
      return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          final productItem = products[index];
          print("product_name" + productItem.name.toString());
          if (productItem != null) {
            return ProductItem(index, productItem);
          } else {
            return LatestProductsGroup(products: [products[index]]);
          }
        },
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
      );
    });
  }
}

