import 'package:e_plaza/modals/offerproducts.dart';
import 'package:e_plaza/screens/home/components/offer_products/product_mini_item.dart';
import 'package:flutter/material.dart';

import '../../../../modals/LatestProduct.dart';
import '../../../../modals/product.dart';

class ProductItemGroup extends StatelessWidget {
  final List<OfferProductsModel> products;

  ProductItemGroup(this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(18),
      ),
      child:
      GridView(
        padding: EdgeInsets.all(12),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        children: products.map((e) => ProductMiniItem(e)).toList(),
      ),
    );
  }
}
