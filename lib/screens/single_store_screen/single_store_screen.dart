import 'package:e_plaza/dialogs/popup_menu.dart';
import 'package:e_plaza/modals/ads_banner_model.dart';
import 'package:e_plaza/modals/category_shop_model.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/store_category.dart';
import '../../widgets/app_bar2.dart';
import '../../widgets/custom_bottom_nav_bar_static.dart';
import 'controller.dart';
import 'product.dart';
import 'store_details.dart';

class SingleStoreScreen extends StatefulWidget {
  final CategoryShopModel storeDetails;

  SingleStoreScreen(this.storeDetails, {Key? key}) : super(key: key);

  @override
  State<SingleStoreScreen> createState() => _SingleStoreScreenState();
}

class _SingleStoreScreenState extends State<SingleStoreScreen> {
  final Controller _controller = Get.put(Controller(), tag: 'SingleStoreScreenController');
  TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
  

    _controller.getAllProductsOfSpecificStore(widget.storeDetails.data![0].id);

    print(_controller.storeProductsDynamic.length);

    super.initState();
  }
  
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
              // MyAppBar2(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: ThemeColors.colorPrimary, width: 1.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _textEditingController,
                        onChanged: (value){
                          if(value.isNotEmpty){
                            _controller.resetSearchedPRoductLength();
                          }
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for product...',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        _controller.getSearchedProductsOfSpecificStore(widget.storeDetails.data![0].id!,_textEditingController.text);
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        backgroundColor: ThemeColors.colorPrimary,
                      ),
                      child: Icon(Icons.search_rounded, color: Colors.white),
                    ),
                    // Helper.spaceHorizontal(4),
                  ],
                ),
              ),
              Helper.spaceVertical(8),
              Expanded(
                  child: ListView(
                children: [
                  assetImage('assets/images/store1.jpeg', width: 100.w, fit: BoxFit.fitWidth),
                  // widget.storeDetails.data![0].image1 != null || widget.storeDetails.data![0].image != null && storeCategory.image!.isNotEmpty ? 
                  // Image.network('https://api.eplaza.in/images/shops/${widget.storeDetails.data![0].image1}', width: 100.w, fit: BoxFit.fitWidth),
                  // : assetImage('assets/images/store1.jpeg', width: 100.w, fit: BoxFit.fitWidth),
                  StoreDetailsWidget(widget.storeDetails.data![0].shopName.toString(),widget.storeDetails.data![0].shopDescription.toString(),widget.storeDetails.data![0].address.toString()),
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
                  Obx(() => _controller.SearchedStoreProductsDynamic.isNotEmpty ? StoreProducts(_controller.SearchedStoreProductsDynamic) : _controller.storeProductsDynamic.isNotEmpty
                      ? StoreProducts(_controller.storeProductsDynamic)
                      : empty())
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
