import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../modals/product.dart';

class ProductMiniItem extends StatelessWidget {
  final Product product;

  ProductMiniItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
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
              Helper.spaceVertical(1),
              Text(
                product.title.nullStr,
                style: MyTextStyle(fontSize: fontSizeMini, height: 1),
              ),
              Helper.spaceVertical(0.5),
              Text(
                product.price.nullStr,
                style: MyTextStyle(fontSize: fontSizeMicro, color: Colors.grey.shade600, height: 1),
              ),
              Helper.spaceVertical(3),
            ],
          ),
          Align(alignment: Alignment.topLeft,child: Padding(
            padding: const EdgeInsets.all(6),
            child: assetImage('assets/icons/tag.png', width: 12, height: 12),
          )),
        ],
      ),
    );
  }
}
