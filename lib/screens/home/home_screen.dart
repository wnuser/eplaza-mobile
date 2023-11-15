import 'package:e_plaza/modals/ads_banner_model.dart';
import 'package:e_plaza/modals/home_main_category_model.dart';
import 'package:e_plaza/screens/home/components/categories.dart';
import 'package:e_plaza/screens/home/components/gmart_shop_categories_grid_widget.dart';
import 'package:e_plaza/screens/home/components/tile.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/custom_bottom_nav_bar_static.dart';
import 'package:e_plaza/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/home_slider_model.dart';
import '../components/view_all_button.dart';
import 'components/add_banner.dart';
import 'components/associated_websites/associated_websites.dart';
import 'components/gram_mart_mela/business_section.dart';
import 'components/e_shop_finder_widget.dart';
import 'components/garam_mart_mela_section.dart';
import 'components/home_app_bar.dart';
import 'components/latest_products/latest_products.dart';
import 'components/main_slider.dart';
import 'components/offer_products/offer_products.dart';
import 'components/random_products/random_products.dart';
import 'components/search_loc_wid.dart';
import 'components/shop_categories_grid_widget.dart';
import 'components/shop_slider.dart';
import 'components/var_vadhu_section.dart';
import 'controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Controller _controller = Get.put(Controller(), tag: 'HomeScreenController');



  @override
  void initState() {
    super.initState();

    // Call the API to get all categories.
    _controller.getAllCategories(context);
    _controller.getGmartCategories(context);
    _controller.getBannerRequest(context);
    _controller.getLatestProducts(context);
    _controller.getOfferProducts(context);
    _controller.getOfferRandomProducts(context);
    _controller.getAdsBannerRequest(context);


    // Call the API to get all home banners.
    // _controller.getHomeBanners();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Helper.exitAlert();
        return false;
      },
      child: Scaffold(
        key: _controller.scaffoldKey,
        body: SafeArea(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            HomeAppBar(openDrawer: () {
              _controller.scaffoldKey.currentState?.openDrawer();
            }),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  // padding: EdgeInsets.only(bottom: 2),
                  children: [
                    SearchAndLocWid(location: 'Dehradun'),
                    CategoriesWidget(categories:_controller.home_main_categories_model),
                    MainSlider(_controller.home_slider),
                    Tile('VISIT STORES'),
                    StoresCategoriesGridWidget(_controller.home_main_categories_model),
                    ViewAllButton(onPressed: () {}),
                    Tile('GRAM MART MELA CATEGORY'),
                    GmartStoresCategoriesGridWidget(_controller.home_gmart_categories_model ),
                    ViewAllButton(onPressed: () {}),
                    // Tile('GRAM MART MELA STORES'),
                    // BusinessSection(_controller.slides, _controller.latestProducts.take(4).toList()),
                    Tile('NEW SHOPS'),
                    ShopSlider(_controller.slides),
                    Tile('POPULAR SHOPS'),
                    assetImage('assets/icons/popular_shops.jpeg',
                        width: 100.w, fit: BoxFit.fitWidth),
                    EShopFinderWidget(location: 'Dehradun'),
                    Tile('LATEST PRODUCTS'),
                    LatestProducts(products: _controller.ltst_product_model),
                    Helper.spaceVertical(12),
                    ViewAllButton(onPressed: () {}),
                    Obx(() {
                      return Tile('OFFER PRODUCTS UP-TO ${_controller.discountUpto.value}%');
                    }),
                    // Tile('OFFER PRODUCTS UP-TO ${_controller.discountUpto.value}%'),
                    BusinessSection(_controller.slides, _controller.latestProducts.take(4).toList()),
                    Helper.spaceVertical(12),
                    OfferProducts(products: _controller.offer_products_model),
                    Helper.spaceVertical(12),
                    ViewAllButton(onPressed: () {}),
                    Tile('GARAM MART MELA STORES'),
                    GaramMartMelaSection(),
                    Tile('OFFERS'),
                    RandomProducts(products: _controller.random_products_model),
                    Tile('ASSOCIATED WEBSITES'),
                    AssociatedWebsites(),
                    Helper.spaceVertical(10),
                    AdsBanner(_controller.home_ads_slider),
                    Helper.spaceVertical(10),
                    VarVadhuSection(),
                    AdsBanner(_controller.home_ads_slider),
                    // Helper.spaceVertical(20),
                  ],
                ),
              ),
            )
          ]),
        ),
        bottomNavigationBar: CustomBottomNavBar(0),
        drawer: MyDrawer(),
      ),
    );
  }
}
