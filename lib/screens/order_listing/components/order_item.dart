import 'package:e_plaza_vendor/dialogs/popup_menu.dart';
import 'package:e_plaza_vendor/modals/order.dart';
import 'package:e_plaza_vendor/screens/order_details/order_details_new.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/toasty.dart';
import 'package:e_plaza_vendor/values/dimen.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/widgets/my_network_image.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  final int i;

  OrderItem(this.i, this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //       color: Colors.grey.shade200,
        //       blurRadius: 1.5,
        //       spreadRadius: 1.5,
        //       offset: Offset(0, 1.5))
        // ],
      ),
      child: TextButton(
        onPressed: () {
          Get.to(() => OrderDetailsScreen());
        },
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Helper.spaceHorizontal(4),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MyNetworkImage(
                path: order.image,
                width: 20.w,
                height: 20.w,
                fit: BoxFit.fitHeight,
                open: true,
                errorWidget: assetImage(
                  'assets/icons/no_product.png',
                  width: 20.w,
                  height: 20.w,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              color: Colors.grey.shade300,
              width: 1,
              height: 50,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.title.nullStr,
                                style: MyTextStyle(
                                    fontSize: fontSizeExtraLarge, fontWeight: FontWeight.w500),
                              ),
                              Helper.spaceVertical(2),
                              Text(
                                order.desc.nullStr,
                                style: MyTextStyle(
                                    fontSize: fontSizeSmall, color: Colors.grey.shade600),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        MyPopupMenuButton<String>(
                          title: 'Action',
                          list: ['Accept', 'Cancel'],
                          onSelected: (s) {
                            Toasty.info(s.toString());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.more_vert_rounded, size: 20, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Helper.spaceVertical(8),
                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     Expanded(child: Divider(color: Colors.grey.shade400, thickness: 0.7))
                    //   ],
                    // ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Const.currencySymbol + order.cost.toString(),
                          style: MyTextStyle(
                              fontSize: fontSizeLarge,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          '29 Nov',
                          style: MyTextStyle(fontSize: fontSizeSmall, color: Colors.grey.shade600),
                        ),
                        Helper.spaceHorizontal(12),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
