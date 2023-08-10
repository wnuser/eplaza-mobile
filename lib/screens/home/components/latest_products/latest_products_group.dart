import 'package:flutter/material.dart';

import 'mini_product_item.dart';

class LatestProductsGroup extends StatelessWidget {
  final List<dynamic> products;

  LatestProductsGroup({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: products.map((e) => LatestProductItemMini(e)).toList(),
    );
  }
}
