import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dialogs/order_filters_dialog.dart';
import '../../utils/const.dart';
import '../../widgets/app_bar2.dart';
import '../../widgets/custom_bottom_nav_bar_static.dart';
import '../../widgets/widgets.dart';
import 'components/order_item.dart';
import 'controller.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({Key? key}) : super(key: key);

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Controller _controller = Get.put(Controller(), tag: 'MyOrdersController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          // MyAppBar('My Orders', searchCallBack: _controller.filterList),
          MyAppBar2(title: 'Search Order...'),
          _listing(),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          OrderFiltersDialog();
        },
        child: assetImage('assets/icons/filter.png', color: Colors.white, width: 22, height: 22),
      ),
      bottomNavigationBar: CustomBottomNavBar(-1),
    );
  }

  Widget _listing() {
    return Expanded(child: Obx(() {
      if ((_controller.status.value == Status.PROGRESS)) {
        return progressLayout();
      }

      if (_controller.storeProducts.isEmpty) {
        return emptyLayout();
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(/*horizontal: 16, */ vertical: 6),
        itemBuilder: (c, i) => OrderItem(
          i,
          _controller.storeProducts[i],
        ),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: _controller.storeProducts.length,
      );
    }));
  }
}
