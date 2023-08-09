import 'package:e_plaza_vendor/screens/edit_user_profile/edit_user_profile_page.dart';
import 'package:e_plaza_vendor/screens/manage_stores/manage_stores.dart';
import 'package:e_plaza_vendor/screens/order_details/order_details_new.dart';
import 'package:e_plaza_vendor/screens/splash_screen.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/custom_bottom_nav_bar.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/plan.dart';
import '../../values/dimen.dart';
import '../../widgets/my_drawer.dart';
import '../../widgets/widgets.dart';
import '../ads/ads_screen.dart';
import '../placeholder_screen.dart';
import '../plan_details/plan_details_screen.dart';
import '../product_listing/product_listing_screen.dart';
import '../subscription/subscription_screen.dart';
import 'controller.dart';
import 'home_app_bar.dart';
import 'main_slider.dart';

class HomeScreenWithBottomMenu extends StatefulWidget {
  @override
  _HomeScreenWithBottomMenuState createState() => _HomeScreenWithBottomMenuState();
}

class _HomeScreenWithBottomMenuState extends State<HomeScreenWithBottomMenu> {
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Helper.initAutoRefreshTimer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ThemeColors.offWhite,
        body: SafeArea(
          child: PageView.builder(
            controller: _pageController,
            physics: new NeverScrollableScrollPhysics(),
            onPageChanged: (i) {
              CustomBottomNavBar.selectedMenu.value = i;
            },
            itemBuilder: (context, position) {
              switch (position) {
                case 0:
                  return _HomeScreen(
                    openDrawer: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  );
                case 1:
                  return PlaceholderScreen(placeholder: 'Chat');
                case 2:
                  return ManageStoresScreen(backCallback: _onWillPop);
                case 3:
                  return EditUserProfilePage(backCallback: _onWillPop);
                default:
                  return SplashScreen();
              }
            },
            itemCount: 4,
          ),
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => ProductListingScreen()),
          // onPressed: () => Get.to(() => ShopDetailsScreen()),
          backgroundColor: ThemeColors.colorPrimary,
          child: Icon(Icons.add, size: 24, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomNavBar(callback: (state) {
          if (state >= 0) {
            CustomBottomNavBar.selectedMenu.value = state;
            _pageController.jumpToPage(state);
          } else {
            Get.to(() => ProductListingScreen());
          }
        }),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (CustomBottomNavBar.selectedMenu.value != 0) {
      setState(() {
        CustomBottomNavBar.selectedMenu.value = 0;
        _pageController.jumpToPage(CustomBottomNavBar.selectedMenu.value);
      });
    } else {
      Helper.exitAlert();
    }
    return false;
  }
}

////////////////////////////////////////////////////////////

class _HomeScreen extends StatelessWidget {
  final void Function() openDrawer;

  _HomeScreen({required this.openDrawer, Key? key}) : super(key: key);

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Controller _controller = Get.put(Controller(), tag: 'HomeScreenController');

  final double spacing = 16;

  // int _initialColorIndex = -1;
  //
  // final List<Pair<Color, Color>> _colors = [
  //   Pair(Color.fromRGBO(251, 118, 147, 0.1), Color.fromRGBO(250, 90, 125, 1.0)),
  //   Pair(Color.fromRGBO(84, 246, 151, 0.1), Color.fromRGBO(0, 200, 83, 1.0)),
  //   Pair(Color.fromRGBO(52, 202, 202, 0.1), Color.fromRGBO(26, 176, 176, 1)),
  //   Pair(Color.fromRGBO(255, 137, 96, 0.1), Color.fromRGBO(255, 137, 96, 1)),
  //   Pair(Color.fromRGBO(241, 143, 143, 0.1), Color.fromRGBO(252, 29, 29, 1.0)),
  //   Pair(Color.fromRGBO(241, 189, 144, 0.1), Color.fromRGBO(245, 127, 23, 1.0)),
  //   Pair(Color.fromRGBO(120, 200, 239, 0.1), Color.fromRGBO(3, 155, 229, 1.0)),
  //   Pair(Color.fromRGBO(157, 144, 255, 0.1), Color.fromRGBO(134, 118, 254, 1)),
  //   // Pair(Color.fromRGBO(232, 158, 136, 0.1), Color.fromRGBO(216, 67, 21, 1.0)),
  //   //Pair(Color.fromRGBO(47, 37, 92, 0.1), Color.fromRGBO(52, 53, 118, 0.7)),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          HomeAppBar(onMenuClick: openDrawer),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 40),
              children: [
                Helper.spaceVertical(8),
                MainSlider(_controller.slides),
                Helper.spaceVertical(12),
                _grid(
                  [
                    _cardItem('20', 'New Orders', 'assets/icons/active_services.png', () {
                      Get.to(() => OrderDetailsScreen());
                    }),
                    _cardItem(
                        '20', 'Completed orders', 'assets/icons/inactive_services.png', () {}),
                    _cardItem('2', 'Payments', 'assets/icons/payments.png', () {}),
                    _cardItem('2', 'Customers', 'assets/icons/customers.png', () {}),
                  ],
                ),
                // Helper.spaceVertical(12),
                // _section(
                //   title: 'Return policy',
                //   subtitle:
                //       'E-Plaza not involved in any return vendor needs to update that accordingly.',
                //   buttonText: 'Explore',
                //   image: 'assets/icons/policy.png',
                //   callback: () {},
                // ),
                // Helper.spaceVertical(12),
                // _section(
                //   title: 'Manage Subscription',
                //   subtitle: 'Access/Modify & delete your subscription anytime',
                //   buttonText: 'Manage',
                //   image: 'assets/icons/subscription.png',
                //   callback: () => Get.to(() => SubscriptionScreen()),
                // ),
                // Helper.spaceVertical(12),
                // _section(
                //   title: 'Manage Store',
                //   subtitle: 'Update shop details',
                //   buttonText: 'Manage',
                //   image: 'assets/icons/shop.png',
                //   callback: () => Get.to(() => ManageShopScreen()),
                // ),
                _subscriptionSection(),
                GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    padding: EdgeInsets.symmetric(horizontal: spacing),
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _squareItem('Ads', 'assets/icons/ads.jpeg', () {
                        Get.to(() => AdsScreen());
                      }),
                      _squareItem('Business', 'assets/icons/business.jpg', () {}),
                    ])
              ],
            ),
          ),
        ]),
      ),
      // drawer: MyDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Get.to(() => ProductListingScreen()),
      //   backgroundColor: ThemeColors.colorPrimary,
      //   child: Icon(Icons.add, size: 24, color: Colors.white),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  Widget _cardItem(
    String title,
    String? subTitle,
    String icon,
    VoidCallback callback, {
    Color? imageColor,
    double titleSize = fontSizeExtraLarge,
    double subTitleSize = fontSizeMini,
    bool swap = false,
  }) {
    if (swap) {
      String a = title;
      title = subTitle!;
      subTitle = a;
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 0.3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: MyFlatButton(
        onPressed: callback,
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            assetImage(icon, width: 40, height: 40, color: imageColor),
            Helper.spaceVertical(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25.w,
                  child: Text(
                    title,
                    style: MyTextStyle(
                        color: Colors.black, fontSize: titleSize, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                if (subTitle != null) Helper.spaceVertical(6),
                if (subTitle != null)
                  Text(
                    subTitle.nullSafe,
                    style: MyTextStyle(
                        color: Colors.black, fontSize: subTitleSize, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _grid(List<Widget> list) {
    return GridView.count(
        shrinkWrap: true,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.symmetric(horizontal: spacing),
        crossAxisCount: 2,
        childAspectRatio: 2 / 1,
        physics: NeverScrollableScrollPhysics(),
        children: list);
  }

  // Widget _section({
  //   required String title,
  //   required String subtitle,
  //   required String buttonText,
  //   required String image,
  //   required void Function() callback,
  //   Alignment alignment = Alignment.bottomLeft,
  // }) {
  //   _initialColorIndex++;
  //   return Container(
  //     width: 100.w,
  //     height: 140,
  //     margin: EdgeInsets.symmetric(horizontal: spacing),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(8),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.1),
  //           spreadRadius: 2,
  //           blurRadius: 2,
  //           offset: Offset(0, 0.3),
  //         )
  //       ],
  //       gradient: LinearGradient(
  //           colors: [
  //             _colors[_initialColorIndex].first,
  //             _colors[_initialColorIndex].second,
  //             _colors[_initialColorIndex].first
  //           ],
  //           begin: Alignment(-1.0, -4.0),
  //           end: Alignment(1.0, 4.0),
  //           stops: [0.0, 0.7, 1.0],
  //           tileMode: TileMode.clamp),
  //     ),
  //     alignment: Alignment.center,
  //     child: Row(
  //       mainAxisSize: MainAxisSize.max,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Helper.spaceHorizontal(8),
  //         Container(
  //           width: 30.w,
  //           height: 30.w,
  //           padding: EdgeInsets.all(8.w),
  //           child: assetImage(image),
  //         ),
  //         Helper.spaceHorizontal(12),
  //         Expanded(
  //           child: Column(
  //             mainAxisSize: MainAxisSize.max,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(
  //                 title,
  //                 style: MyTextStyle(
  //                   color: ThemeColors.defaultTextColor,
  //                   fontSize: fontSizeLarge,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               Helper.spaceVertical(2),
  //               Text(
  //                 subtitle,
  //                 style: MyTextStyle(
  //                   color: ThemeColors.defaultTextColor.withOpacity(0.6),
  //                   fontSize: fontSizeMini,
  //                   fontWeight: FontWeight.w400,
  //                 ),
  //                 maxLines: 2,
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //               Helper.spaceVertical(4),
  //               Align(
  //                 alignment: alignment,
  //                 child: TextButton(
  //                   onPressed: callback,
  //                   style: TextButton.styleFrom(
  //                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
  //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //                     backgroundColor: ThemeColors.colorPrimary,
  //                     minimumSize: Size.zero,
  //                   ),
  //                   child: Text(
  //                     buttonText,
  //                     style: MyTextStyle(color: Colors.white, fontWeight: FontWeight.w400),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Helper.spaceHorizontal(12),
  //       ],
  //     ),
  //   );
  // }

  Widget _subscriptionSection() {
    return Obx(
      () {
        if (_controller.status.value == Status.PROGRESS) {
          return Padding(
            padding: EdgeInsets.all(spacing),
            child: LinearProgressIndicator(
                backgroundColor: Colors.grey.shade200, color: Colors.grey.shade400),
          );
        }

        if (_controller.plans.isNotEmpty || _controller.subscriptions.isNotEmpty) {
          List<Widget> li = [];

          if (_controller.subscriptions.isNotEmpty) {
            _controller.subscriptions.forEach((subscription) {
              li.add(_subItem(
                id: subscription.subscriptionPlan?.id.nullSafe,
                planName: subscription.subscriptionPlan!.name,
                yearlyPrice: subscription.subscriptionPlan!.yearlyPrice,
                quarterlyPrice: subscription.subscriptionPlan!.quarterlyPrice,
                controller: subscription.subscriptionPlan!.controller,
                yearlyOff: subscription.subscriptionPlan!.yearlyOff.nullSafe,
                yearlyPriceDiscount: subscription.subscriptionPlan!.yearlyPriceDiscount.nullSafe,
                facilities: subscription.subscriptionPlan!.facilities.nullSafe,
                purchased: true,
              ));
            });
          }

          if (_controller.plans.isNotEmpty) {
            _controller.plans.forEach((plan) {
              if (_controller.subscriptions.isEmpty ||
                  _controller.subscriptions[0].planId != plan.id.toString())
                li.add(_subItem(
                  id: plan.id,
                  planName: plan.name,
                  yearlyPrice: plan.yearlyPrice,
                  quarterlyPrice: plan.quarterlyPrice,
                  controller: plan.controller,
                  yearlyOff: plan.yearlyOff,
                  yearlyPriceDiscount: plan.yearlyPriceDiscount,
                  facilities: plan.facilities,
                  purchased: false,
                ));
            });
          }
          return Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: spacing),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: spacing),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 0.3),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Choose Plan',
                  style: MyTextStyle(
                    color: Color.fromARGB(255, 191, 117, 134),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Helper.spaceVertical(4),
                ...li,
              ],
            ),
          );
        }
        return Helper.spaceVertical(10);
      },
    );
  }

  // Widget _subItem2(
  //     {required String? id,
  //     required String? planName,
  //     required String? quarterlyPrice,
  //     required String? yearlyPrice,
  //     required String? yearlyOff,
  //     required String? yearlyPriceDiscount,
  //     required String? facilities,
  //     required ExpandableController controller,
  //     bool purchased = false}) {
  //   double h = 60;
  //   double round = 10;
  //   return Container(
  //     height: h,
  //     margin: EdgeInsets.symmetric(vertical: 5),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(round),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.2),
  //           spreadRadius: 1,
  //           blurRadius: 1,
  //           offset: const Offset(0, 1),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         Container(
  //           width: 6,
  //           height: h,
  //           decoration: BoxDecoration(
  //             color: ThemeColors.colorPrimary,
  //             borderRadius: BorderRadius.only(
  //               bottomLeft: Radius.circular(round),
  //               topLeft: Radius.circular(round),
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 18),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Spacer(),
  //                 Text(
  //                   planName.nullSafe,
  //                   style: MyTextStyle(
  //                       color: ThemeColors.colorPrimary,
  //                       fontSize: fontSizeLarge,
  //                       fontWeight: FontWeight.w600),
  //                 ),
  //                 // Helper.spaceVertical(2),
  //                 Spacer(),
  //                 Text(
  //                   'Ensure your all product sales on the single platform',
  //                   style: MyTextStyle(
  //                       fontSize: fontSizeSmall, fontWeight: FontWeight.w400, height: 1),
  //                   maxLines: 2,
  //                 ),
  //                 Spacer(),
  //               ],
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: h,
  //           child: TextButton(
  //             onPressed: () {
  //               if (purchased) {
  //                 Get.to(() => SubscriptionScreen())?.then((value) {
  //                   _controller.init();
  //                 });
  //               } else {
  //                 Plan plan = Plan(
  //                   id: id,
  //                   name: planName,
  //                   quarterlyPrice: quarterlyPrice,
  //                   yearlyPrice: yearlyPrice,
  //                   yearlyOff: yearlyOff,
  //                   yearlyPriceDiscount: yearlyPriceDiscount,
  //                   facilities: facilities,
  //                 );
  //                 Get.to(() => PlanDetailsScreen(plan: plan))?.then((value) {
  //                   _controller.init();
  //                 });
  //               }
  //             },
  //             style: TextButton.styleFrom(
  //                 backgroundColor: purchased ? Colors.green : ThemeColors.colorPrimary.shade600,
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.only(
  //                         topRight: Radius.circular(round), bottomRight: Radius.circular(round))),
  //                 padding: EdgeInsets.symmetric(horizontal: 14)),
  //             child: Text(
  //               purchased ? 'Purchased' : ' Purchase',
  //               style: MyTextStyle(
  //                 color: Colors.white,
  //                 fontSize: fontSizeMedium,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _subItem(
      {required String? id,
      required String? planName,
      required String? quarterlyPrice,
      required String? yearlyPrice,
      required String? yearlyOff,
      required String? yearlyPriceDiscount,
      required String? facilities,
      required ExpandableController controller,
      bool purchased = false}) {
    double h = 64;
    double round = 10;
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color.fromARGB(255, 191, 117, 134), Color.fromARGB(255, 192, 117, 135)]),
        // border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(round),
      ),
      child: TextButton(
        onPressed: () {
          if (purchased) {
            Get.to(() => SubscriptionScreen())?.then((value) {
              _controller.init();
            });
          } else {
            Plan plan = Plan(
              id: id,
              name: planName,
              quarterlyPrice: quarterlyPrice,
              yearlyPrice: yearlyPrice,
              yearlyOff: yearlyOff,
              yearlyPriceDiscount: yearlyPriceDiscount,
              facilities: facilities,
            );
            Get.to(() => PlanDetailsScreen(plan: plan))?.then((value) {
              _controller.init();
            });
          }
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 14),
          minimumSize: Size.fromHeight(h),
          backgroundColor: purchased ? Colors.transparent : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(round),
          ),
        ),
        // height: h,
        // decoration: BoxDecoration(
        //   color: purchased ? Colors.transparent : Colors.white,
        //   // border: Border.all(color: Colors.white),
        //   borderRadius: BorderRadius.circular(round),
        // ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: planName.nullSafe,
                      style: MyTextStyle(
                          color: purchased ? Colors.white : Color.fromARGB(255, 191, 117, 134),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      children: [
                        if (purchased)
                          TextSpan(
                            text: ' (Purchased)',
                            style: MyTextStyle(
                                color:
                                    purchased ? Colors.white : Color.fromARGB(255, 191, 117, 134),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Helper.spaceVertical(4),
                  Text(
                    'Ensure your all product sales on the single platform',
                    style: MyTextStyle(
                        color: purchased ? Colors.white : Color.fromARGB(255, 191, 117, 134),
                        fontSize: fontSizeMini,
                        fontWeight: FontWeight.w400,
                        height: 1),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            if (purchased)
              assetImage(
                'assets/icons/checked_black.png',
                width: 22,
                height: 22,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }

  Widget _squareItem(String title, String icon, void Function() cb) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2.w),
      child: Container(
        // width: 40.w,
        // height: 40.w,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: TextButton(
            onPressed: cb,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Stack(
              children: [
                assetImage(icon, fit: BoxFit.fill),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.red.withOpacity(0.9),
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            title,
                            style: MyTextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
