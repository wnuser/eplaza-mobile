import 'package:e_plaza/screens/home/components/offer_products/product_item_group.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../modals/product.dart';
import '../../../../widgets/primary_button.dart';
import 'product_item.dart';

class OfferProducts extends StatelessWidget {
  final List<dynamic> products;

  OfferProducts({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 20,
          childAspectRatio: 1 / 1),
      itemBuilder: (c, i) {
        if (products[i] is Product) {
          return ProductItem(i, products[i]);
        } else {
          return ProductItemGroup(products[i]);
        }
      },
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
    );
  }
}
