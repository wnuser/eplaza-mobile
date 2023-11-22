import 'package:e_plaza/modals/specific_store_products_model.dart';
import 'package:e_plaza/screens/cart_list/cart_controller.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/store_product.dart';
import '../../utils/const.dart';
import '../../widgets/my_network_image.dart';

class GlobalProductItem extends StatelessWidget {
  final Data product;
  final void Function(Data product) onClick;
  final double? width;
  final bool saved;

  GlobalProductItem(this.product, this.onClick, {this.width, this.saved = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(product.description);
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //       color: Colors.grey.shade300,
        //       blurRadius: 3,
        //       spreadRadius: 1,
        //       offset: const Offset(0, 3))
        // ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          onClick.call(product);
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Helper.spaceVertical(6),
            Expanded(
              child: Stack(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                        child: MyNetworkImage(
                          path: '',
                          imageName: product.image1.nullSafe,
                          title: product.name,
                          fit: BoxFit.fitWidth,
                          errorWidget: Container(
                            padding: const EdgeInsets.all(40),
                            child: assetImage('assets/images/noImageplaceholder.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Container(
                  //     margin: EdgeInsets.all(8),
                  //     padding: EdgeInsets.only(left: 6, right: 8, top: 4, bottom: 4),
                  //     decoration: BoxDecoration(
                  //       color: ThemeColors.colorPrimary,
                  //       borderRadius: BorderRadius.circular(3),
                  //     ),
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Icon(
                  //           Icons.star,
                  //           color: Colors.white,
                  //           size: 12,
                  //         ),
                  //         Helper.spaceHorizontal(4),
                  //         Text(
                  //           '4.5',
                  //           style: MyTextStyle(
                  //             color: Colors.white,
                  //             fontSize: fontSizeMini,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: assetImage(
                          saved
                              ? 'assets/icons/heart_filled.png'
                              : 'assets/icons/heart_outlined.png',
                          width: 20,
                          height: 20,
                          color: ThemeColors.colorPrimary),
                    ),
                  ),
                ],
              ),
            ),
            Helper.spaceVertical(2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                product.name!,
                style: const MyTextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Helper.spaceVertical(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Const.currencySymbol + product.price.toString(),
                  style: const MyTextStyle(
                      color: Colors.red,
                      fontSize: fontSizeSmall,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                Helper.spaceHorizontal(4),
                Text(
                  Const.currencySymbol + product.offerPrice.toString(),
                  style: const MyTextStyle(
                    color: Colors.black,
                    fontSize: fontSizeLarge,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                Helper.spaceHorizontal(4),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('${product.offerPercentage}% OFF',
                      style: const MyTextStyle(
                          fontSize: fontSizeMini, fontWeight: FontWeight.w600, color: Colors.green),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center),
                ),
              ],
            ),
            Helper.spaceVertical(4),
            _mid(),
            Helper.spaceVertical(8),
          ],
        ),
      ),
    );
  }

  Widget _mid() {
    var style = OutlinedButton.styleFrom(
        backgroundColor: Colors.grey.shade100,
        shape: CircleBorder(),
        padding: EdgeInsets.all(8),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(color: ThemeColors.colorPrimary, width: 0.7));

    return Obx(() => CartController.cartItems.containsKey(product.name)
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(
                  onPressed: () {
                    CartController.remove(product.name!);
                  },
                  style: style,
                  child: Icon(Icons.remove, color: ThemeColors.colorPrimary, size: 16)),
              Helper.spaceHorizontal(12),
              Text(
                CartController.cartItems[product.name]!.quantity.toString(),
                style: MyTextStyle(
                  color: ThemeColors.colorPrimary,
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Helper.spaceHorizontal(12),
              OutlinedButton(
                  onPressed: () {
                    // CartController.add(product);
                  },
                  style: style,
                  child: Icon(Icons.add, color: ThemeColors.colorPrimary, size: 16)),
            ],
          )
        : OutlinedButton(
            onPressed: () {
              // CartController.add(product);
            },
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.only(left: 20, right: 16, top: 6, bottom: 6),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide(color: ThemeColors.colorPrimary, width: 0.7)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add',
                  style: MyTextStyle(
                    color: ThemeColors.colorPrimary,
                    fontSize: fontSizeMedium,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Helper.spaceHorizontal(12),
                Icon(Icons.add, color: ThemeColors.colorPrimary, size: 16),
              ],
            ),
          ));
  }
}
