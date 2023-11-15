import 'package:e_plaza/screens/edit_user_profile/edit_user_profile_page.dart';
import 'package:e_plaza/screens/wish_list_screen/wish_list_screen.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/utils/toasty.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../values/theme_colors.dart';
import '../../../widgets/widgets.dart';
import '../../cart_list/cart_list_screen.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({this.openDrawer, Key? key}) : super(key: key);

  final void Function()? openDrawer;

  final double h = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: h,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Helper.spaceHorizontal(8),
          SizedBox(
            width: 40,
            height: 40,
            child: TextButton(
              onPressed: openDrawer,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.menu_rounded, color: Colors.black, size: 26),
            ),
          ),
          // Helper.spaceHorizontal(8),
          assetImage('assets/icons/logo.png', height: h / 1.03, fit: BoxFit.fitHeight),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: () {
                  Toasty.info('Coming Soon..');
                },
                style: TextButton.styleFrom(
                    backgroundColor: ThemeColors.colorPrimary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Became\nSeller',
                  style: MyTextStyle(
                    color: ThemeColors.white,
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          smallIconImage('assets/icons/cart.png', () {
            Get.to(() => CartListingScreen());
          }, iconColor: ThemeColors.colorPrimary, factor: 1.8),
          Helper.spaceHorizontal(2),
          smallIconImage('assets/icons/favorite.png', () {
            Get.to(() => WishListScreen());
          }, iconColor: ThemeColors.colorPrimary, factor: 1.8),
          Helper.spaceHorizontal(2),
          smallIconImage('assets/icons/user.png', () {
            Get.to(() => EditUserProfilePage());
          }, iconColor: ThemeColors.colorPrimary, factor: 1.8),
          Helper.spaceHorizontal(12),
        ],
      ),
    );
  }
}
