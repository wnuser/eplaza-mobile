// import 'package:e_plaza/utils/helper.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CustomBottomNavBar extends StatelessWidget {
//   void Function(int pos) callback;
//
//   CustomBottomNavBar({Key? key, required this.callback}) : super(key: key);
//
//   static RxInt selectedMenu = 0.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       shape: CircularNotchedRectangle(),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           _item('assets/icons/home_filled.png', 'Home', 0),
//           _item('assets/icons/search_filled.png', 'Search', 1),
//           _item('assets/icons/cart_filled.png', 'My Cart', 2),
//           _item('assets/icons/heart_filled.png', 'Wishlist', 3),
//           _item('assets/icons/person_filled.png', 'Profile', 4),
//         ],
//       ),
//     );
//   }
//
//   Widget _item(String icon, String label, int menuState) {
//     return TextButton(
//       onPressed: () {
//         callback(menuState);
//       },
//       style:
//           TextButton.styleFrom(shape: CircleBorder(), padding: EdgeInsets.symmetric(vertical: 12)),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Obx(
//             () => assetImage(
//               icon,
//               color: menuState == selectedMenu.value
//                   ? ThemeColors.colorPrimary
//                   : const Color(0xFFB6B6B6),
//               width: 24,
//               height: 24,
//             ),
//           ),
//           Helper.spaceVertical(6),
//           Obx(
//             () => Text(
//               label,
//               style: MyTextStyle(
//                 color:
//                     menuState == selectedMenu.value ? Colors.black : Colors.black.withOpacity(0.7),
//                 fontSize: fontSizeSmall,
//                 fontWeight: FontWeight.w500,
//                 height: 1,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
