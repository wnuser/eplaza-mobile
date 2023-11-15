import 'package:e_plaza/modals/store_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/helper.dart';
import '../../../widgets/my_network_image.dart';
import '../../my_order_details/my_order_details_new.dart';

class OrderItem extends StatelessWidget {
  final StoreProduct product;
  final int i;

  OrderItem(this.i, this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade400, width: 0.7))
          // borderRadius: BorderRadius.circular(8),
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
          Get.to(() => MyOrderDetailsScreen());
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Helper.spaceHorizontal(4),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MyNetworkImage(
                path: product.image,
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
                                product.title.nullStr,
                                style: MyTextStyle(
                                    fontSize: fontSizeLarge, fontWeight: FontWeight.w500),
                                maxLines: 2,
                              ),
                              Helper.spaceVertical(12),
                              Text(
                                'Delivered on March 2, 2023',
                                style: MyTextStyle(color: Colors.grey.shade600),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
            ),
            Helper.spaceHorizontal(12),
          ],
        ),
      ),
    );
  }
}
