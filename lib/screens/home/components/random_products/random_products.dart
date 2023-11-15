import 'package:e_plaza/modals/latest%20_product_model.dart';
import 'package:e_plaza/modals/offerproducts.dart';
import 'package:e_plaza/modals/randomproductmodel.dart';
import 'package:e_plaza/screens/home/components/offer_products/product_item_group.dart';
import 'package:e_plaza/screens/home/components/random_products/random_product_item_group.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../modals/LatestProduct.dart';
import '../../../../modals/product.dart';
import '../../../../widgets/primary_button.dart';
import 'random_product_item.dart';

class RandomProducts extends StatelessWidget {
  // final List<dynamic> products;
  final List<RandomProductsModel> products;

  RandomProducts({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 20,
          childAspectRatio: 1 / 1),
      itemBuilder: (context, index) {
        final productItem = products[index];
        print("product_name" + productItem.name.toString());
        if (productItem != null) {
          return RandomProductItem(index, productItem);
        } else {
          return RandomProductItemGroup([products[index]]);
        }
      },
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
    );
    });
  }
}
