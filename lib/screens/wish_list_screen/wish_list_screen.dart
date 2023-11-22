import 'package:e_plaza/screens/wish_list_screen/product.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_bottom_nav_bar_static.dart';
import 'controller.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'StoreProductsScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                'Wishlist',
                enableSearch: true,
                searchCallBack: _controller.filterList,
              ),
              Expanded(
                child: Obx(() {
                  if (_controller.status.value == Status.PROGRESS) {
                    return progressLayout();
                  }

                  if (_controller.status.value != Status.PROGRESS &&
                      _controller.storeProducts.isEmpty) {
                    return emptyLayout();
                  }

                  return WishlistProducts(_controller.storeProductsDynamic);
                }),
              ),
            ]),
      ),
      bottomNavigationBar: CustomBottomNavBar(3),
    );
  }
}
