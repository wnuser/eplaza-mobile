import 'package:e_plaza_vendor/dialogs/popup_menu.dart';
import 'package:e_plaza_vendor/screens/order_details/order_details_new.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/sub_category.dart';
import '../../utils/const.dart';
import '../../widgets/app_bar.dart';
import '../add_product/add_product_screen.dart';
import 'components/order_item.dart';
import 'controller.dart';

class OrderListingScreen extends StatelessWidget {
  OrderListingScreen({Key? key}) : super(key: key);

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Controller _controller = Get.put(Controller(), tag: 'ProductListingController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.whiteBlue,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar('Order Listing'),
          _listing(),
        ]),
      ),
    );
  }

  Widget _listing() {
    return Expanded(child: Obx(() {
      if ((_controller.status.value == Status.PROGRESS)) {
        return progressLayout();
      }

      if (_controller.orders.isEmpty) {
        return emptyLayout();
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        itemBuilder: (c, i) => OrderItem(
          i,
          _controller.orders[i],
        ),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: _controller.orders.length,
      );
    }));
  }
}
