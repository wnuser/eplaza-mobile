import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../modals/product.dart';

class ProductMiniItem2 extends StatelessWidget {
  final Product product;

  ProductMiniItem2(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
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
          Helper.spaceVertical(2),
          Text(
            product.title.nullStr,
            style: MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w500),
          ),
          Text(
            '20%',
            style: MyTextStyle(fontSize: fontSizeMini, color: Colors.grey.shade600),
          ),
          Helper.spaceVertical(6),
        ],
      ),
    );
  }
}
