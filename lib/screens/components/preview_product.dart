import 'package:e_plaza/modals/specific_store_products_model.dart' as SSPM;
import 'package:e_plaza/modals/specific_store_products_model.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../modals/store_product.dart';
import '../../utils/const.dart';
import '../../widgets/my_network_image.dart';

class PreviewProductItem extends StatelessWidget {
  final SSPM.Data product;
  final void Function(Data product) onClick;
  final double? width;
  final bool saved;

  PreviewProductItem(this.product, this.onClick, {this.width, this.saved = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            child: assetImage('assets/icons/no_image.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.only(left: 6, right: 8, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                        color: ThemeColors.colorPrimary,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 12,
                          ),
                          Helper.spaceHorizontal(4),
                          Text(
                            '4.5',
                            style: MyTextStyle(
                              color: Colors.white,
                              fontSize: fontSizeMini,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(12),
                  //     child: assetImage(saved ? 'assets/icons/heart_filled.png' :'assets/icons/heart_outlined.png',
                  //         width: 20, height: 20, color: ThemeColors.colorPrimary),
                  //   ),
                  // ),
                ],
              ),
            ),
            Helper.spaceVertical(2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                product.name!,
                style: const MyTextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
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
                  child: Text('20% OFF',
                      style: const MyTextStyle(
                          fontSize: fontSizeMini, fontWeight: FontWeight.w600, color: Colors.green),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center),
                ),
              ],
            ),
            Helper.spaceVertical(8),
          ],
        ),
      ),
    );
  }
}
