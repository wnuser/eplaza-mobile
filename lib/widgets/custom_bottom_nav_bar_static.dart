import 'package:e_plaza/screens/cart_list/cart_list_screen.dart';
import 'package:e_plaza/screens/edit_user_profile/edit_user_profile_page.dart';
import 'package:e_plaza/screens/placeholder_screen.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/categories/category_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/wish_list_screen/wish_list_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  static int active = 0;

  CustomBottomNavBar(int active) : super() {
    CustomBottomNavBar.active = active;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _item('assets/icons/home_filled.png', 'Home', 0, () => Get.offAll(() => HomeScreen())),
          _item('assets/icons/categories.png', 'Categories', 1,
              () => Get.to(() => CategoriesScreen())),
          _item('assets/icons/cart_filled.png', 'My Cart', 2,
              () => Get.to(() => CartListingScreen())),
          _item('assets/icons/heart_filled.png', 'Wishlist', 3,
              () => Get.to(() => WishListScreen())),
          _item('assets/icons/person_filled.png', 'Account', 4,
              () => Get.to(() => EditUserProfilePage())),
        ],
      ),
    );
  }

  Widget _item(String icon, String label, int menuState, void Function() cb) {
    return TextButton(
      onPressed: cb,
      style:
          TextButton.styleFrom(shape: CircleBorder(), padding: EdgeInsets.symmetric(vertical: 12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          assetImage(
            icon,
            color: menuState == active ? ThemeColors.colorPrimary : const Color(0xFFB6B6B6),
            width: 24,
            height: 24,
          ),
          Helper.spaceVertical(6),
          Text(
            label,
            style: MyTextStyle(
              color: menuState == active ? Colors.black : Colors.black.withOpacity(0.7),
              fontSize: fontSizeSmall,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

// static Future<bool> onWillPop() async {
//   if (active != 0) {
//     Get.to(() => HomeScreen());
//   } else {
//     Helper.exitAlert();
//   }
//   return false;
// }
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
}
