import 'package:e_plaza/utils/const.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../modals/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final int i;

  ProductItem(this.i, this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Helper.spaceVertical(2),
              Expanded(
                child: MyNetworkImage(
                  path: '',
                  imageName: product.image.nullSafe,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Helper.spaceVertical(4),
              Text(
                product.title.nullStr,
                style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w500, height: 1),
              ),
              Helper.spaceVertical(2),
              Text(
                Const.currencySymbol + product.price.nullStr,
                style: MyTextStyle(fontSize: fontSizeLarge, color: Colors.grey.shade700,fontWeight: FontWeight.w600, height: 1),
              ),
              Helper.spaceVertical(2),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.grey.shade100,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        padding: EdgeInsets.only(left: 20, right: 16, top: 6, bottom: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        side: BorderSide(
                          color: ThemeColors.colorPrimary,
                          width: 0.7,
                        )),
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
                  ),
                ],
              ),
              Helper.spaceVertical(8),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: assetImage('assets/icons/tag.png', width: 24, height: 24),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: assetImage('assets/icons/heart_outlined.png',
                  width: 20, height: 20, color: ThemeColors.colorPrimary),
            ),
          ),
        ],
      ),
    );
  }
}