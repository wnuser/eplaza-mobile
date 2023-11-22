import 'package:e_plaza/modals/cart_item.dart';
import 'package:e_plaza/modals/specific_store_products_model.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/store_product.dart';
import '../../utils/const.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/custom_bottom_nav_bar_static.dart';
import '../addess_form_screen/address_form_screen.dart';
import '../components/global_product.dart';
import '../store_product_details/store_product_details_screen.dart';
import 'cart_controller.dart';
import 'components/cart_item.dart';

class CartListingScreen extends StatelessWidget {
  CartListingScreen({Key? key}) : super(key: key);

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CartController _controller = Get.put(CartController(), tag: 'CartListController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding:  EdgeInsets.only(top: 10, left: 2, right: 2),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: MyFlatButton(
                    onPressed: Get.back,
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder(),
                    child:
                    const Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 18),
                  ),
                ),
                Helper.spaceHorizontal(8),
                Text(
                  'My Cart',
                  style: MyTextStyle(
                    fontSize: fontSizeExtraLarge,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          _listing(),
          Obx(() => CartController.cartItems.isNotEmpty ? _bottomLayout() : empty()),
        ]),
      ),
      bottomNavigationBar: CustomBottomNavBar(2),
    );
  }

  Widget _listing() {
    return Expanded(child: Obx(() {
      if ((_controller.status.value == Status.PROGRESS)) {
        return progressLayout();
      }

      if (CartController.cartItems.isEmpty) {
        return emptyLayout();
      }

      List<Widget> li = <Widget>[];

      for (int i = 0; i < CartController.cartItems.length; i++) {
        li.add(_cartWid(i, CartController.cartItems.values.toList()[i]));
      }

      li.add(Helper.spaceVertical(18));
      li.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text('You May',
            style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold)),
      ));
      li.add(_otherProducts(_controller.storeProductDynamic));

      li.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text('Popular Products',
            style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold)),
      ));
      li.add(_otherProducts(_controller.storeProductDynamic.reversed.toList()));

      li.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text('Grammart mela products',
            style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold)),
      ));
      li.add(_otherProducts(_controller.storeProductDynamic));

      return ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: li,
      );

      // return ListView.builder(
      //   // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      //   itemBuilder: (c, i) {
      //     CartItem item = CartController.cartItems.values.toList()[i];
      //     return CartItemWidget(
      //       i,
      //       item,
      //       onPlus: () {
      //         item.quantity++;
      //         CartController.cartItems.refresh();
      //       },
      //       onMinus: () {
      //         if (item.quantity <= 1) {
      //           CartController.cartItems.remove(item.product.title);
      //         } else {
      //           item.quantity--;
      //         }
      //         CartController.cartItems.refresh();
      //       },
      //     );
      //   },
      //   physics: BouncingScrollPhysics(),
      //   shrinkWrap: true,
      //   itemCount: CartController.cartItems.length,
      // );
    }));
  }

  Widget _cartWid(int i, CartItem item) {
    return CartItemWidget(
      i,
      item,
      onPlus: () {
        item.quantity++;
        CartController.cartItems.refresh();
      },
      onMinus: () {
        if (item.quantity <= 1) {
          CartController.cartItems.remove(item.product.name);
        } else {
          item.quantity--;
        }
        CartController.cartItems.refresh();
      },
    );
  }

  Widget _bottomLayout() {
    double sum = 0;

    CartController.cartItems.forEach((key, value) {
      sum += value.product.offerPrice as double;
    });

    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 8),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 2))
      ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Const.currencySymbol + sum.toString(),
                style: MyTextStyle(fontSize: fontSizeExtraLarge, fontWeight: FontWeight.w600),
              ),
              Text(
                'Total ' + CartController.cartItems.length.toString() + ' Products',
                style: MyTextStyle(fontSize: fontSizeSmall),
              ),
              Text(
                'You save ${Const.currencySymbol}20',
                style: MyTextStyle(fontSize: fontSizeSmall),
              ),
            ],
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              Get.to(() => AddressFormScreen());
            },
            style: TextButton.styleFrom(
                backgroundColor: ThemeColors.colorPrimary,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
            child: Text(
              'Checkout',
              style: MyTextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500, fontSize: fontSizeLarge),
            ),
          ),
          Helper.spaceHorizontal(6.w),
        ],
      ),
    );
  }

  Widget _otherProducts(List<SpecificStoreProducts> products) {
    return Container(
      height: 200,
      width: 100.w,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(/*left: 16, right: 16, */ top: 12, bottom: 15),
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (c, i) {
          return GlobalProductItem(products[0].data![i],
           (p) {
            Get.to(() => StoreProductDetailsScreen(product_id: p.id!));
          }, 
          width: 140);
        },
      ),
    );
  }
}
