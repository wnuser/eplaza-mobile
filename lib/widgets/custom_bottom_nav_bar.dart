import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/dimen.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/theme_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  void Function(int pos) callback;

  CustomBottomNavBar({Key? key, required this.callback}) : super(key: key);

  static RxInt selectedMenu = 0.obs;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _item(Icons.home_filled, 'Home', 0),
          _item(Icons.chat_bubble_outline_rounded, 'Chat', 1),
          _item(Icons.abc, 'Manage\nProduct', -1),
          _item(Icons.settings, 'Manage\nShop', 2),
          _item(Icons.person, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String label, int menuState) {
    return TextButton(
      onPressed: () {
        callback(menuState);
      },
      style: TextButton.styleFrom(shape: CircleBorder()),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Icon(
              icon,
              color: menuState == selectedMenu.value
                  ? ThemeColors.colorPrimary
                  : const Color(0xFFB6B6B6),
            ),
          ),
          Helper.spaceVertical(4),
          Text(
            label,
            style:
                const MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w400, height: 1),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
