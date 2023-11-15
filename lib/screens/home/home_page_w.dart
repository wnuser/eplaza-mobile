// import 'package:e_plaza/screens/components/view_all_button.dart';
// import 'package:e_plaza/screens/home/components/categories.dart';
// import 'package:e_plaza/screens/home/components/tile.dart';
// import 'package:e_plaza/utils/helper.dart';
// import 'package:e_plaza/values/size_config.dart';
// import 'package:e_plaza/widgets/custom_bottom_nav_bar.dart';
// import 'package:e_plaza/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../widgets/my_drawer.dart';
// import '../placeholder_screen.dart';
// import 'components/add_banner.dart';
// import 'components/associated_websites/associated_websites.dart';
// import 'components/e_shop_finder_widget.dart';
// import 'components/garam_mart_mela_section.dart';
// import 'components/home_app_bar.dart';
// import 'components/latest_products/latest_products.dart';
// import 'components/global_slider.dart';
// import 'components/offer_products/offer_products.dart';
// import 'components/search_loc_wid.dart';
// import 'components/shop_categories_grid_widget.dart';
// import 'components/shop_slider.dart';
// import 'components/var_vadhu_section.dart';
// import 'controller.dart';
//
// class HomeScreenWithBottomMenu extends StatefulWidget {
//   @override
//   _HomeScreenWithBottomMenuState createState() => _HomeScreenWithBottomMenuState();
// }
//
// class _HomeScreenWithBottomMenuState extends State<HomeScreenWithBottomMenu> {
//   final PageController _pageController = PageController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     Helper.initAutoRefreshTimer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         key: _scaffoldKey,
//         backgroundColor: ThemeColors.offWhite,
//         body: SafeArea(
//           child: PageView.builder(
//             controller: _pageController,
//             physics: new NeverScrollableScrollPhysics(),
//             onPageChanged: (i) {
//               CustomBottomNavBar.selectedMenu.value = i;
//             },
//             itemBuilder: (context, position) {
//               switch (position) {
//                 case 0:
//                   return _HomeScreen(openDrawer: () => _scaffoldKey.currentState!.openDrawer());
//                 case 1:
//                   return PlaceholderScreen(placeholder: 'Search');
//                 case 2:
//                   return PlaceholderScreen(placeholder: 'My Cart');
//                 case 3:
//                   return PlaceholderScreen(placeholder: 'Wish List');
//                 case 4:
//                   return PlaceholderScreen(placeholder: 'Profile');
//                 default:
//                   return _HomeScreen(openDrawer: () => _scaffoldKey.currentState!.openDrawer());
//               }
//             },
//             itemCount: 5,
//           ),
//         ),
//         drawer: MyDrawer(),
//         bottomNavigationBar: CustomBottomNavBar(callback: (state) {
//           CustomBottomNavBar.selectedMenu.value = state;
//           _pageController.jumpToPage(state);
//         }),
//       ),
//     );
//   }
//
//   Future<bool> _onWillPop() async {
//     if (CustomBottomNavBar.selectedMenu.value != 0) {
//       setState(() {
//         CustomBottomNavBar.selectedMenu.value = 0;
//         _pageController.jumpToPage(CustomBottomNavBar.selectedMenu.value);
//       });
//     } else {
//       Helper.exitAlert();
//     }
//     return false;
//   }
// }
//
// ////////////////////////////////////////////////////////////
//
// class _HomeScreen extends StatelessWidget {
//   final void Function() openDrawer;
//
//   _HomeScreen({required this.openDrawer});
//
//   final Controller _controller = Get.put(Controller(), tag: 'HomeScreenController');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _controller.scaffoldKey,
//       body: SafeArea(
//         child: Column(mainAxisSize: MainAxisSize.max, children: [
//           HomeAppBar(openDrawer: openDrawer),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 // padding: EdgeInsets.only(bottom: 2),
//                 children: [
//                   SearchAndLocWid(location: 'Dehradun'),
//                   CategoriesWidget(categories: _controller.categories),
//                   MainSlider(_controller.slides),
//                   Tile('VISIT STORIES'),
//                   StoresCategoriesGridWidget(_controller.storeCategories),
//                   ViewAllButton(onPressed: () {}),
//                   Tile('GRAM MART MELA CATEGORY'),
//                   StoresCategoriesGridWidget(_controller.garamMartCategories),
//                   ViewAllButton(onPressed: () {}),
//                   Tile('NEW SHOPS'),
//                   ShopSlider(_controller.slides),
//                   Tile('POPULAR SHOPS'),
//                   assetImage('assets/icons/popular_shops.jpeg', width: 100.w, fit: BoxFit.fitWidth),
//                   EShopFinderWidget(location: 'Dehradun'),
//                   Tile('LATEST PRODUCTS'),
//                   LatestProducts(products: _controller.latestProducts),
//                   Helper.spaceVertical(12),
//                   ViewAllButton(onPressed: () {}),
//                   Tile('OFFER PRODUCTS UP-TO 50%'),
//                   OfferProducts(products: _controller.offerProducts),
//                   Helper.spaceVertical(12),
//                   ViewAllButton(onPressed: () {}),
//                   Tile('GARAM MART MELA STORES'),
//                   GaramMartMelaSection(),
//                   Tile('OFFERS'),
//                   OfferProducts(products: _controller.offerProducts),
//                   Tile('ASSOCIATED WEBSITES'),
//                   AssociatedWebsites(),
//                   Helper.spaceVertical(10),
//                   AddBanner(),
//                   Helper.spaceVertical(10),
//                   VarVadhuSection(),
//                   AddBanner(),
//                   // Helper.spaceVertical(20),
//                 ],
//               ),
//             ),
//           )
//         ]),
//       ),
//       drawer: MyDrawer(),
//     );
//   }
// }
