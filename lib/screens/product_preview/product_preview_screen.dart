import 'package:e_plaza/screens/product_preview/product.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/app_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_bottom_nav_bar_static.dart';
import 'controller.dart';

class ProductPreviewScreen extends StatelessWidget {
  ProductPreviewScreen({Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'ProductPreviewScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar2(title: 'Search product...'),
              Obx(() => _controller.storeProductsDynamic.isNotEmpty
                  ? Expanded(child: StoreProducts(_controller.storeProductsDynamic))
                  : empty()),
            ]),
      ),
      bottomNavigationBar: CustomBottomNavBar(-1),
    );
  }
}
