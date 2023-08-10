import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../modals/product.dart';
import '../../../../widgets/widgets.dart';

class LatestProductItemMini extends StatelessWidget {
  final Product product;

  LatestProductItemMini(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.only(top: 0, bottom: 0, left: 12, right: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              product.title.nullSafe,
              style: MyTextStyle(fontSize: fontSizeSmall),
            ),
          ),
          MyNetworkImage(
            path: '',
            imageName: product.image.nullSafe,
            height: 28,
            width: 28,
          ),
        ],
      ),
    );
  }
}
