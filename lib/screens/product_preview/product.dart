import 'package:e_plaza/modals/specific_store_products_model.dart';
import 'package:e_plaza/modals/store_product.dart';
import 'package:e_plaza/screens/store_product_details/store_product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/preview_product.dart';

class StoreProducts extends StatelessWidget {
  final RxList<SpecificStoreProducts> products;

  const StoreProducts(this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 15),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 14,
      ),
      itemCount: products[0].data != null ?products[0].data!.length : 0,
      itemBuilder: (c, i) {
        return PreviewProductItem(products[0].data![i], (p) {
          Get.to(() => StoreProductDetailsScreen(product_id: p.id!));
        });
      },
    );
  }
}
