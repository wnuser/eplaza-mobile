import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/my_network_image.dart';
import '../../widgets/order_setps.dart';
import 'controller.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'CheckoutScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar('Order Summary'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                OrderSteps(active: 1),
                Helper.spaceVertical(8),
                _addressCard(),
                Helper.spaceVertical(8),
                _productCard(),
                Helper.spaceVertical(8),
                _priceDetailsCard(),
                Helper.spaceVertical(40),
              ],
            ),
          ),
          _bottomLayout(),
        ]),
      ),
    );
  }

  Widget _priceDetailsCard() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Price Details',
                style: MyTextStyle(fontWeight: FontWeight.w600, fontSize: fontSizeLarge)),
            Helper.spaceVertical(12),
            _tile('List Price', '20000'),
            _tile('Discount', '200'),
            _tile('Delivery Charges', '60'),
            _tile('Total Amount', '1860', bold: true),
          ],
        ),
      ),
    );
  }

  Widget _tile(String label, String price, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(label, style: MyTextStyle(fontWeight: bold ? FontWeight.w500 : FontWeight.normal)),
          const Spacer(),
          Text(
            'Rs.' + price + '/-',
            style: MyTextStyle(
                fontSize: fontSizeMedium, fontWeight: bold ? FontWeight.w600 : FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _productCard() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Large 33 L Backpack RIDDLE 3  (Black)',
                        style:
                            const MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w500),
                      ),
                      // Helper.spaceVertical(),
                      // Text(
                      //   product.productDescription,
                      //   style: const MyTextStyle(fontSize: fontSizeSmall, color: Colors.black54),
                      //   maxLines: 2,
                      //   softWrap: true,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                      Helper.spaceVertical(10),
                      Text(
                        'Quantity - 2 Unit',
                        style: const MyTextStyle(
                          fontSize: fontSizeLarge,
                          fontWeight: FontWeight.w600,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Helper.spaceVertical(10),
                      Text(
                        'Rs.350/-',
                        style: const MyTextStyle(
                          fontSize: fontSizeExtraLarge,
                          fontWeight: FontWeight.w600,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Helper.spaceHorizontal(10),
                Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: MyNetworkImage(
                      path: '',
                      imageName:
                          'https://rukminim1.flixcart.com/image/832/832/xif0q/backpack/j/u/e/-original-imagkycfxtmh4mvg.jpeg?q=70',
                      open: true,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _addressCard() {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 12),
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deliver to :',
                  style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w600),
                ),
                Helper.spaceVertical(10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Text(
                        'Jitendra Kumar',
                        style: const MyTextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Helper.spaceHorizontal(12),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        'HOME',
                        style: MyTextStyle(
                          fontSize: fontSizeSmall,
                        ),
                      ),
                    ),
                  ],
                ),
                Helper.spaceVertical(6),
                Text(
                  'dehradun, shiv mandir wali gali, shivam vihar jakhan, Next gali of ansari mughal arts, DEHRADUN 248001',
                  style: const MyTextStyle(),
                ),
                Helper.spaceVertical(),
                Helper.spaceVertical(),
                Helper.spaceVertical(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '1234567890',
                      style: const MyTextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: OutlinedButton(
                onPressed: Get.back,
                style: OutlinedButton.styleFrom(
                    minimumSize: Size.zero,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18)),
                child: Text(
                  'Change',
                  style: MyTextStyle(),
                ),
              )),
        )
      ],
    );
  }

  Widget _bottomLayout() {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 8),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 2))
      ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Const.currencySymbol + '1500',
                style: MyTextStyle(fontSize: fontSizeExtraLarge, fontWeight: FontWeight.w600),
              ),
              Text(
                'Total 2 Products',
                style: MyTextStyle(fontSize: fontSizeSmall),
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 234, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              side: BorderSide(color: Colors.black, width: 0.7),
            ),
            child: Text(
              'Make Payment',
              style: MyTextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500, fontSize: fontSizeLarge),
            ),
          )
        ],
      ),
    );
  }
}
