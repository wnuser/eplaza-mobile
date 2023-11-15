import 'package:e_plaza/modals/store_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/global_product.dart';
import '../store_product_details/store_product_details_screen.dart';

class WishlistProducts extends StatelessWidget {
  final RxList<StoreProduct> products;

  const WishlistProducts(this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 15),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 14,
      ),
      itemCount: products.length,
      itemBuilder: (c, i) {
        return GlobalProductItem(
            products[i], (p) => Get.to(() => StoreProductDetailsScreen(product: p)), saved: true);
      },
    );
  }
}
