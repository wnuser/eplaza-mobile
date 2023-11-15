import 'dart:math';

import 'package:e_plaza/modals/store_product.dart';
import 'package:e_plaza/screens/store_product_details/store_product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/global_product.dart';
import '../components/global_product_3rd.dart';

class StoreProducts extends StatelessWidget {
  final List<StoreProduct> products;

  const StoreProducts(this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 6),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.1,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemCount: products.length,
      itemBuilder: (c, i) {
        return GlobalProductItem(products[i], (p) {
          Get.to(() => StoreProductDetailsScreen(product: p));
        });
      },
    );
  }
}
