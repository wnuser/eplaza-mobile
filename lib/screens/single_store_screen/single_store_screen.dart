import 'package:e_plaza/dialogs/popup_menu.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/store_category.dart';
import '../../widgets/app_bar2.dart';
import '../../widgets/custom_bottom_nav_bar_static.dart';
import 'controller.dart';
import 'product.dart';
import 'store_details.dart';

class SingleStoreScreen extends StatelessWidget {
  final StoreCategory storeCategory;

  SingleStoreScreen(this.storeCategory, {Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'SingleStoreScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MyAppBar(storeCategory.title.nullStr,
              //     enableSearch: true, searchCallBack: _controller.filterList),
              MyAppBar2(),
              Helper.spaceVertical(8),
              Expanded(
                  child: ListView(
                children: [
                  assetImage('assets/images/store1.jpeg', width: 100.w, fit: BoxFit.fitWidth),
                  StoreDetailsWidget(),
                  // AboutStoreWidget(),
                  // Helper.spaceVertical(2),
                  // Divider(color: Colors.grey.shade200),
                  // Helper.spaceVertical(2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _tile(),
                        Helper.spaceHorizontal(16),
                        _filter(),
                      ],
                    ),
                  ),
                  Helper.spaceVertical(8),
                  // Obx(() => _controller.storeProducts.isNotEmpty
                  //     ? StoreProducts(_controller.storeProducts.reversed.take(3).toList())
                  //     : empty()),
                  // _tile('New Arrival', () {
                  //   Get.to(() => StoreProductsScreen());
                  // }),
                  Obx(() => _controller.storeProducts.isNotEmpty
                      ? StoreProducts(_controller.storeProducts)
                      : empty()),
                ],
              ))
            ]),
      ),
      bottomNavigationBar: CustomBottomNavBar(-1),
    );
  }

  Widget _tile() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // MyPopupMenuButton<StoreCategory>(
        //   title: 'Category',
        //   list: _controller.storeProducts,
        //   onSelected: (s) {
        //     _controller.title.value = s.title.nullSafe;
        //   },
        //   child: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Obx(
        //         () => Text(
        //           _controller.title.value,
        //           style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w500),
        //         ),
        //       ),
        //       Icon(Icons.keyboard_arrow_down_rounded, size: 20)
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget _filter() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyPopupMenuButton<String>(
          title: 'Filter',
          list: ['New Arrival', 'Discount'],
          onSelected: (s) {
            _controller.filter.value = s.nullSafe;
            },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  _controller.filter.value,
                  style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w500),
                ),
              ),
              Icon(Icons.keyboard_arrow_down_rounded, size: 20)
            ],
          ),
        ),
      ],
    );
  }
}
