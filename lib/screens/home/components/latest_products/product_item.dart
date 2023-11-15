import 'package:e_plaza/modals/LatestProduct.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../apiHandler/network_constant.dart';
import '../../../../modals/product.dart';
import '../../../../widgets/widgets.dart';

class ProductItem extends StatelessWidget {
  final LatestProduct product;
  final int i;

  ProductItem(this.i, this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 4, child: Container()),
            Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: i.isEven ? Colors.grey.shade400 : ThemeColors.colorPrimary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                product.name.nullStr,
                                style: MyTextStyle(color: Colors.white, fontSize: fontSizeSmall, fontWeight: FontWeight.w600),
                              ),
                              Helper.spaceVertical(2),
                              Text(
                                product.price?.toString() ?? 'price',
                                style: MyTextStyle(color: Colors.white, fontSize: fontSizeSmall),
                              ),
                              Helper.spaceVertical(8),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.favorite_rounded,
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: MyNetworkImage(
            path: NetworkConstantsUtil.product_img_path,
            imageName: product.image1.nullSafe,
            width: 20.w,
          ),
        ),
      ],
    );
  }
}
