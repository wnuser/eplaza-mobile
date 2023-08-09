import 'package:e_plaza_vendor/dialogs/popup_menu.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/sub_category.dart';
import '../../utils/const.dart';
import '../../widgets/app_bar.dart';
import '../add_product/add_product_screen.dart';
import 'components/product_item.dart';
import 'controller.dart';

class ProductListingScreen extends StatelessWidget {
  ProductListingScreen({Key? key}) : super(key: key);

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Controller _controller = Get.put(Controller(), tag: 'ProductListingController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar('Product Listing'),
          _topBar(),
          _listing(),
        ]),
      ),
    );
  }

  Widget _listing() {
    return Expanded(child: Obx(() {
      if ((_controller.status.value == Status.PROGRESS)) {
        return progressLayout();
      }

      if (_controller.products.isEmpty) {
        return emptyLayout();
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        itemBuilder: (c, i) => ProductItem(
          i,
          _controller.products[i],
          onEdit: (product) {
            Get.to(() => AddProductScreen(action: 'EDIT', productId: product.id))?.then((value) {
              if (value!=null && value) {
                _controller.getProducts();
              }
            });
          },
          onDelete: (product) {
            _controller.deleteProduct(product.id);
          },
        ),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: _controller.products.length,
      );
    }));
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => _controller.categories.value == null
                ? empty()
                : MyPopupMenuButton<SubCategory>(
                    title: 'Select Category',
                    list: _controller.categories,
                    onSelected: (c) {
                      _controller.category.value = c.name.nullStr;
                      _controller.filter(c.id);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey.shade400, width: 1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(() => Text(_controller.category.value, style: MyTextStyle())),
                          Icon(Icons.arrow_drop_down,
                              size: 24, color: ThemeColors.defaultTextColor),
                        ],
                      ),
                    ),
                  ),
          ),
          TextButton(
            onPressed: () {
              Get.to(() => AddProductScreen(action: 'ADD'))?.then((value) {
                if (value != null) {
                  _controller.getProducts();
                }
              });
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12),
              backgroundColor: ThemeColors.colorPrimary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, size: 20, color: ThemeColors.white),
                Helper.spaceHorizontal(2),
                Text('Add Product', style: MyTextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
