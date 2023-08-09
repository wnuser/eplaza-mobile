import 'package:e_plaza_vendor/screens/update_shop_details_screen/update_shop_details_screen.dart';
import 'package:e_plaza_vendor/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/helper.dart';
import '../../values/dimen.dart';
import '../../widgets/widgets.dart';
import 'controller.dart';

class ManageStoresScreen extends StatelessWidget {
  final void Function()? backCallback;

  ManageStoresScreen({this.backCallback, Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'ManageScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar('Manage Stores', backCallBack: backCallback),
          _list(),
        ]),
      ),
    );
  }

  Widget _list() {
    return Expanded(
      child: GridView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2/1.4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            _item('Payouts', 'assets/icons/payouts.png', () {}),
            _item('Delivery', 'assets/icons/delivery_truck.png', () {}),
            _item('Ads', 'assets/icons/advertising.png', () {}),
            _item('Subscription', 'assets/icons/subscription.png', () {}),
            _item('Edit business\ndetails', 'assets/icons/business_details.png', () {
              Get.to(() => UpdateShopDetailsScreen());
            }),
            _item('Shipping Policy', 'assets/icons/policy.png', () {}),
          ]),
    );
  }

  Widget _item(String title, String icon, void Function() cb) {
    return TextButton(
      onPressed: cb,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Helper.spaceVertical(4),
          assetImage(icon, width: 35, height: 35),
          Helper.spaceVertical(4),
          Text(
            title.nullStr,
            style: MyTextStyle(fontSize: fontSizeMedium, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          Helper.spaceVertical(12),
        ],
      ),
    );
  }
}
