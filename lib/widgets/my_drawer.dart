import 'package:e_plaza_vendor/screens/edit_user_profile/edit_user_profile_page.dart';
import 'package:e_plaza_vendor/screens/product_listing/product_listing_screen.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/const.dart';
import '../values/dimen.dart';
import '../values/theme_colors.dart';
import 'my_network_image.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                _navHeader(),
                _navItem('assets/icons/home.png', 'Home', Get.back, selected: true),
                _navItem('assets/icons/products.png', 'Product Listing', () {
                  Get.back();
                  Get.to(() => ProductListingScreen());
                }, selected: false),
                _navItem('assets/icons/payouts_outlined.png', 'Payouts', () {
                  Get.back();
                }),
                _navItem('assets/icons/delivery_truck_outlined.png', 'Delivery', () {
                  Get.back();
                }),
                _navItem('assets/icons/advertising_outlined.png', 'Ads', () {
                  Get.back();
                }),
                _navItem('assets/icons/subscribe_outlined.png', 'Subscription', () {
                  Get.back();
                }),
                _navItem('assets/icons/edit_details_outlined.png', 'Edit shop details', () {
                  Get.back();
                }),
                _navItem('assets/icons/insurance_outlined.png', 'Shipping Policy', () {
                  Get.back();
                }),
                _navItem('assets/icons/share_outline.png', 'Share', () {
                  Get.back();
                  Helper.shareApp();
                }),
                _navItem('assets/icons/help_center_outline.png', 'Help & Support', () {
                  Get.back();
                }),
                _navItem('assets/icons/logout_outline.png', 'Logout', () {
                  Get.back();
                  Helper.logOut();
                }),
              ],
            ),
          ),
          _support(),
        ],
      ),
    );
  }

  Widget _navHeader() {
    double _imgSize = 50;
    return InkWell(
      onTap: () {
        Get.back();
        Get.to(() => EditUserProfilePage());
      },
      child: Container(
          decoration: const BoxDecoration(color: ThemeColors.colorPrimary),
          padding: const EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: _imgSize,
                height: _imgSize,
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1))
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(_imgSize / 2),
                    child: Obx(
                      () => MyNetworkImage(
                          path: '',
                          imageName: Const.profilePic.value,
                          width: _imgSize,
                          height: _imgSize,
                          open: false,
                          title: 'Profile Pic',
                          errorWidget: assetImage('assets/icons/profile_placeholder_primary.png',
                              color: ThemeColors.colorPrimary)),
                    ),
                  ),
                ),
              ),
              Helper.spaceHorizontal(10),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(Const.name.value,
                          style: const MyTextStyle(
                              color: Colors.white,
                              fontSize: fontSizeSmall,
                              fontWeight: FontWeight.bold)),
                    ),
                    Helper.spaceVertical(8),
                    Obx(
                      () => Text(
                        Const.email.value,
                        style: const MyTextStyle(
                          color: Colors.white,
                          fontSize: fontSizeSmall,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.white, size: 22),
            ],
          )),
    );
  }

  Widget _navItem(String icon, String title, void Function() onTap, {bool selected = false}) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          backgroundColor: selected ? ThemeColors.colorPrimary.shade50 : null),
      child: Row(
        children: [
          assetImage(icon,
              /*color: selected ? ThemeColors.colorPrimary : Colors.black87,*/ width: 20,
              height: 20),
          Helper.spaceHorizontal(15),
          Text(
            title,
            style: MyTextStyle(
                color: selected ? ThemeColors.colorPrimary : Colors.black87,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _support() {
    String supportNumber = '+910000000000';
    return GestureDetector(
        onTap: () {
          Helper.openUrl('tel:' + supportNumber, launchMode: LaunchMode.externalNonBrowserApplication);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.call, size: 16),
              Helper.spaceHorizontal(6),
              Text(
                'Contact Support',
                style: MyTextStyle(
                  fontSize: fontSizeSmall,
                ),
              )
            ],
          ),
        ));
  }
}
