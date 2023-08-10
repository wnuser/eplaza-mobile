import 'package:e_plaza/modals/store_category.dart';
import 'package:e_plaza/screens/store_products/product.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_bottom_nav_bar_static.dart';
import '../../widgets/normal_text_field.dart';
import 'controller.dart';

class StoreProductsScreen extends StatelessWidget {
  StoreProductsScreen({Key? key}) : super(key: key);

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
                'Products',
                enableSearch: true,
                searchCallBack: _controller.filterList,
              ),
              // DropdownButton<StoreCategory>(
              //   isExpanded: true,
              //   value: _controller.selectedCategory.value,
              //   items: _controller.storeCategories
              //       .map(
              //         (e) => DropdownMenuItem<StoreCategory>(
              //           value: e,
              //           child: Text(
              //             e.title.nullSafe,
              //             style: MyTextStyle(color: ThemeColors.defaultTextColor),
              //           ),
              //         ),
              //       )
              //       .toList(),
              //   onChanged: (e) {
              //     _controller.selectedCategory.value = e!;
              //   },
              //   underline: empty(),
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: NormalTextField<StoreCategory>.dropdown(
                  label: 'Category',
                  controller: _controller.categoryController,
                  dropdownList: _controller.storeCategories,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  onSelected: (c) {
                    return c.title.nullSafe;
                  },
                ),
              ),
              Obx(() => _controller.storeProducts.isNotEmpty
                  ? Expanded(child: StoreProducts(_controller.storeProducts))
                  : empty()),
            ]),
      ),
      bottomNavigationBar: CustomBottomNavBar(-1),
    );
  }
}
