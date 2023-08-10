import 'package:e_plaza/screens/home/components/gram_mart_mela/product_mini_item.dart';
import 'package:flutter/material.dart';

class ProductItemGroup2 extends StatelessWidget {
  final List<dynamic> products;

  ProductItemGroup2(this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      // padding: EdgeInsets.all(12),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      children: products.map((e) => ProductMiniItem2(e)).toList(),
    );
  }
}
