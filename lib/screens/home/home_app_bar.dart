import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:flutter/material.dart';

import '../../values/theme_colors.dart';
import '../../widgets/widgets.dart';

class HomeAppBar extends StatelessWidget {
  final Function() onMenuClick;
  HomeAppBar({required this.onMenuClick, Key? key}) : super(key: key);

  final double h = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: h,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Helper.spaceHorizontal(8),
          SizedBox(
            width: 40,
            height: 40,
            child: TextButton(
              onPressed: onMenuClick,
              style: TextButton.styleFrom(padding: EdgeInsets.zero, shape: const CircleBorder()),
              child: const Icon(Icons.menu_rounded, color: Colors.black, size: 26),
            ),
          ),
          Helper.spaceHorizontal(8),
          assetImage('assets/icons/logo.png', height: h / 1.3, fit: BoxFit.fitHeight),
          Spacer(),
          // smallIconImage('assets/icons/cart.png', () {},
          //     iconColor: ThemeColors.colorPrimary, factor: 1.8),
          // Helper.spaceHorizontal(2),
          // smallIconImage('assets/icons/favorite.png', () {},
          //     iconColor: ThemeColors.colorPrimary, factor: 1.8),
          // Helper.spaceHorizontal(2),
          smallIconImage('assets/icons/notification_outline.png', () {},
              iconColor: ThemeColors.colorPrimary, factor: 1.8),
          Helper.spaceHorizontal(12),
        ],
      ),
    );
  }
}
