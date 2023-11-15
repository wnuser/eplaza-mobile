import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../modals/store_product.dart';
import '../../widgets/my_network_image.dart';

class GlobalProductItem3rd extends StatelessWidget {
  final StoreProduct product;
  final void Function(StoreProduct product) onClick;
  final double? width;

  GlobalProductItem3rd(this.product, this.onClick, {this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    child: MyNetworkImage(
                      path: '',
                      imageName: product.image.nullSafe,
                      title: product.title,
                      fit: BoxFit.fitWidth,
                      errorWidget: Container(
                        padding: const EdgeInsets.all(40),
                        child: assetImage('assets/icons/no_image.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Helper.spaceVertical(4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                product.title,
                style: const MyTextStyle(
                  color: Colors.black87,
                  fontSize: fontSizeSmall,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Helper.spaceVertical(12),
          ],
        ),
      ),
    );
  }
}
