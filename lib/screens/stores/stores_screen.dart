import 'package:e_plaza/modals/category_shop_model.dart' as CSM;
import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/category_stores_model.dart';
import '../../modals/home_main_category_model.dart';
import '../../modals/store_category.dart';
import '../../utils/const.dart';
import '../../widgets/app_bar2.dart';
import '../../widgets/custom_bottom_nav_bar_static.dart';
import '../product_preview/product_preview_screen.dart';
import 'controller.dart';
import 'store_item.dart';

class StoresScreen extends StatefulWidget {

  final Data cat_data;

  StoresScreen(this.cat_data, {Key? key}) : super(key: key);

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  final Controller _controller = Get.put(Controller(), tag: 'StoresScreenController');

  late List<CSM.CategoryShopModel> sategory_shops_model;


  int _sortIndexGroup = Sort.NEWEST;

  @override
  void initState() {
    super.initState();
    _controller.getCategoryShops(context,widget.cat_data.id!);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 20), () => Get.focusScope!.unfocus());
    Future.delayed(Duration(milliseconds: 50), () => Get.focusScope!.unfocus());
    Future.delayed(Duration(milliseconds: 100), () => Get.focusScope!.unfocus());
    Future.delayed(Duration(milliseconds: 400), () => Get.focusScope!.unfocus());
    Future.delayed(Duration(milliseconds: 800), () => Get.focusScope!.unfocus());
    Future.delayed(Duration(milliseconds: 1200), () => Get.focusScope!.unfocus());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          // MyAppBar2(),
          
          Expanded(
              child: ListView(
            children: [
              // GlobalSlider(_controller.slides),
              assetImage('assets/images/store1.jpeg', width: 100.w, fit: BoxFit.fitWidth),
              // StoreCategories(categories: _controller.storeCategories),
              Helper.spaceVertical(8),
              _preview(),
              Helper.spaceVertical(12),
              _categories(),
              Helper.spaceVertical(2),
              Obx(
                () => GridView.builder(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 80),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 6,
                    childAspectRatio: 1 / 1.22,
                  ),
                  itemBuilder: (c, i) {
                    final categoryShopModel = _controller.catshopmodel[i];

                    // Print the name of the first CategoryShopModel
                    if (i == 0) {
                      print("Name of the first CategoryShopModel: ${categoryShopModel.success}");
                    }

                    return StoreItem(i, categoryShopModel);
                  },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _controller.catshopmodel.length,
                ),
              ),
            ],
          ))
        ]),
      ),
      bottomNavigationBar: CustomBottomNavBar(-1),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ProductPreviewScreen());
        },
        backgroundColor: ThemeColors.colorPrimary,
        elevation: 6,
        splashColor: Colors.black,
        child: assetImage('assets/icons/box.png', width: 22, height: 22),
      ),
    );
  }


  Widget _preview() {
    return Obx(() => _controller.catshopmodel.isNotEmpty
        ? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              widget.cat_data.description!,
              style: MyTextStyle(
                fontSize: fontSizeLarge,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

        ],
      ),
    ):Container());
  }

  Widget _categories() {
    return Obx(
            () => SizedBox(
      height: 24,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _controller.catproducts.length,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (c, i) {
          final catProduct = _controller.catproducts[i]; // Get the CatAllProductDetailsModel object
          final data = catProduct.data![i]; // Get the Data object at the current index
          final productName = data.name ?? ''; // Access the 'name' property
          print("product_name"+productName);
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            padding: EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: ThemeColors.colorPrimary, width: 1.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              productName,
              style: MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w500),
            ),
          );
        },
      ),
    )
    );
  }



}
