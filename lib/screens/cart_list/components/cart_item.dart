import 'package:flutter/material.dart';

import '../../../modals/cart_item.dart';
import '../../../utils/const.dart';
import '../../../utils/helper.dart';
import '../../../widgets/my_network_image.dart';
import '../../../widgets/rating_reviews/star_display.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final int i;
  final void Function() onMinus;
  final void Function() onPlus;

  CartItemWidget(this.i, this.cartItem, {required this.onMinus, required this.onPlus, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey.shade200,
          //       blurRadius: 1.5,
          //       spreadRadius: 1.5,
          //       offset: Offset(0, 1.5))
          // ],
          border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 0.7))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Helper.spaceHorizontal(4),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: MyNetworkImage(
                  path: 'https://images.meesho.com/images/products/228753704/1dmmv_512.webp',
                  width: 25.w,
                  height: 25.w,
                  fit: BoxFit.fitHeight,
                  open: true,
                  errorWidget: assetImage(
                    'assets/icons/no_product.png',
                    width: 25.w,
                    height: 25.w,
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
                      Text(
                        cartItem.product.name.nullStr,
                        style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Helper.spaceVertical(4),
                      Text('2 Unit', style: MyTextStyle(fontSize: fontSizeSmall)),
                      Helper.spaceVertical(4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StarDisplay(
                              starCount: 5,
                              rating: Helper.parseDouble(4),
                              size: 14.0,
                              color: ThemeColors.colorPrimary),
                          Helper.spaceHorizontal(8),
                          Text(
                            '(158 Reviews)',
                            style: MyTextStyle(color: Colors.grey, fontSize: fontSizeSmall),
                          )
                        ],
                      ),
                      Helper.spaceVertical(4),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Const.currencySymbol + cartItem.product.price.toString(),
                            style: MyTextStyle(
                                fontSize: fontSizeMedium,
                                color: Colors.red.shade600,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Helper.spaceHorizontal(8),
                          Text(
                            Const.currencySymbol + cartItem.product.offerPrice.toString(),
                            style: MyTextStyle(
                                fontSize: fontSizeLarge,
                                // color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500),
                          ),
                          Helper.spaceHorizontal(8),
                          Text(
                            '24% off',
                            style: MyTextStyle(
                              fontSize: fontSizeLarge,
                              color: ThemeColors.success,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Helper.spaceVertical(4),
                      Text(
                        'Sold by: Swarajya India Enterprises',
                        style: const MyTextStyle(
                          color: Colors.black87,
                          fontSize: fontSizeSmall,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     Expanded(child: Divider(color: Colors.grey.shade400, thickness: 0.7))
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Helper.spaceVertical(4),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              bt('Remove'),
              bt('Wishlist'),
              bt('Buy Now'),
              Spacer(),
              TextButton(
                onPressed: onMinus,
                style: TextButton.styleFrom(
                  backgroundColor: ThemeColors.colorPrimary,
                  shape: CircleBorder(),
                  padding: EdgeInsets.zero,
                  minimumSize: Size.square(30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Icon(Icons.remove, color: Colors.white, size: 17),
              ),
              Helper.spaceHorizontal(8),
              Text(
                cartItem.quantity.toString(),
                style: MyTextStyle(
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Helper.spaceHorizontal(8),
              TextButton(
                onPressed: onPlus,
                style: TextButton.styleFrom(
                  backgroundColor: ThemeColors.colorPrimary,
                  shape: CircleBorder(),
                  padding: EdgeInsets.zero,
                  minimumSize: Size.square(30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 17),
              ),
              Helper.spaceHorizontal(12),
            ],
          )
        ],
      ),
    );
  }

  Widget bt(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: ThemeColors.colorPrimary,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            // side: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size.zero,
        ),
        child: Text(
          title.nullSafe,
          style: MyTextStyle(fontSize: fontSizeSmall, color: Colors.white),
        ),
      ),
    );
  }
}
