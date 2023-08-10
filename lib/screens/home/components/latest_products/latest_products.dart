import 'package:e_plaza/screens/home/components/offer_products/product_item_group.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../modals/product.dart';
import '../../../../widgets/primary_button.dart';
import 'latest_products_group.dart';
import 'product_item.dart';

class LatestProducts extends StatelessWidget {
  final List<dynamic> products;

  LatestProducts({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1 / 1),
      itemBuilder: (c, i) {
        if(products[i] is Product) {
          return ProductItem(i, products[i]);
        }else{
          return LatestProductsGroup(products:products[i]);
        }
      },
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
    );
  }
}
