import 'package:e_plaza/screens/help_and_support.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/my_network_image.dart';
import '../return_filling_screen/return_filling_screen.dart';
import 'controller.dart';

class MyOrderDetailsScreen extends StatelessWidget {
  MyOrderDetailsScreen({Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'MyOrderDetailsScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       SizedBox(
              //         width: 40,
              //         height: 40,
              //         child: MyFlatButton(
              //           onPressed: Get.back,
              //           padding: EdgeInsets.zero,
              //           shape: const CircleBorder(),
              //           child:
              //               const Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 18),
              //         ),
              //       ),
              //       Helper.spaceHorizontal(8),
              //       Text(
              //         'My Order Detail',
              //         style: MyTextStyle(
              //           fontSize: fontSizeExtraLarge,
              //           color: Colors.black,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              MyAppBar('My Order Details'),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _statusCard(),
                    _orderCard(),
                    _returnCard(),
                    _addressCard(),
                    _priceDetailsCard(),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  Widget _orderCard() {
    var style = TextButton.styleFrom(
      // backgroundColor: Colors.grey.shade100,
      shape: CircleBorder(),
      padding: EdgeInsets.all(8),
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      // side: BorderSide(color: ThemeColors.colorPrimary, width: 0.7),
    );
    return Container(
      // margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(color: Colors.grey.shade300, blurRadius: 3, offset: const Offset(0, 1))
      //   ],
      // ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'ORDER ID : OD876543876548765',
              style: const MyTextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSizeMedium,
              ),
            ),
          ),
          Divider(color: Colors.grey.shade400, height: 0, thickness: 0.6),
          Helper.spaceVertical(8),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
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
              Helper.spaceHorizontal(12),
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
                    Helper.spaceVertical(8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Const.currencySymbol + '350.00',
                          style: const MyTextStyle(
                            fontSize: fontSizeExtraLarge,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Helper.spaceHorizontal(6),
                        Text(
                          Const.currencySymbol + '400.00',
                          style: const MyTextStyle(
                            // fontSize: fontSizeSmall,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Helper.spaceVertical(4),
                    Text(
                      'You Saved ${Const.currencySymbol}50.00',
                      style: const MyTextStyle(
                        color: ThemeColors.success,
                        fontWeight: FontWeight.w500,
                      ),
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
                  ],
                ),
              ),
            ],
          ),
          // Helper.spaceVertical(12),
          // Row(
          //   mainAxisSize: MainAxisSize.max,
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     TextButton(
          //         onPressed: () {},
          //         style: style,
          //         child: Icon(Icons.remove, color: ThemeColors.colorPrimary, size: 20)),
          //     Helper.spaceHorizontal(8),
          //     Text(
          //       '1',
          //       style: MyTextStyle(
          //         color: ThemeColors.colorPrimary,
          //         fontSize: fontSizeLarge,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //     Helper.spaceHorizontal(8),
          //     TextButton(
          //         onPressed: () {},
          //         style: style,
          //         child: Icon(Icons.add, color: ThemeColors.colorPrimary, size: 20)),
          //   ],
          // ),
          Helper.spaceVertical(12),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: ThemeColors.offWhite,
                      side: BorderSide(color: Colors.grey.shade300, width: 1)),
                  child: const Text(
                    'Reorder',
                    style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Helper.spaceHorizontal(6),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => HelpAndSupport());
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: ThemeColors.offWhite,
                      side: BorderSide(color: Colors.grey.shade300, width: 1)),
                  child: const Text(
                    'Need Help?',
                    style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _statusCard() {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      // margin: const EdgeInsets.only(top: 10),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(color: Colors.grey.shade300, blurRadius: 3, offset: const Offset(0, 1))
      //   ],
      // ),
      child: Text(
        'STATUS : DELIVERED',
        style: const MyTextStyle(
          fontWeight: FontWeight.w500,
          fontSize: fontSizeMedium,
        ),
      ),
    );
  }

  Widget _addressCard() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 1)],
      // ),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Address Details',
            style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w600),
          ),
          Helper.spaceVertical(10),
          Text(
            '1105 Aztec Rd',
            style: const MyTextStyle(),
          ),
          Text(
            '1105 Aztec Rd, North Pole, Alaska 99705, USA',
            style: const MyTextStyle(),
          ),
          Helper.spaceVertical(2),
          Text(
            'Pin Code : ' + '99705',
            style: const MyTextStyle(),
          ),
          Helper.spaceVertical(2),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'North Pole',
                style: const MyTextStyle(),
              ),
              const Text(', ', style: MyTextStyle()),
              Text(
                'USA',
                style: const MyTextStyle(),
              ),
            ],
          ),
          Helper.spaceVertical(2),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Phone Number : ' + '(240) 375-1288',
                style: const MyTextStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _returnCard() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 1)],
      // ),
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          Get.to(() => ReturnFillingScreen());
        },
        style: TextButton.styleFrom(
            // minimumSize: Size.fromWidth(100.w),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            alignment: Alignment.centerLeft),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                'Return Product',
                style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w600),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
            )
          ],
        ),
      ),
    );
  }

  Widget _priceDetailsCard() {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 3, offset: const Offset(0, 1))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Price Details',
              style: MyTextStyle(fontWeight: FontWeight.w600, fontSize: fontSizeLarge)),
          Helper.spaceVertical(12),
          _tile('List Price', '20000'),
          _tile('Discount', '200', color: ThemeColors.success),
          _tile('Delivery Charges', '60'),
          _tile('Total Amount', '1860', bold: true),
        ],
      ),
    );
  }

  Widget _tile(String label, String price,
      {bool bold = false, Color color = ThemeColors.defaultTextColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            label,
            style: MyTextStyle(
              fontWeight: bold ? FontWeight.w500 : FontWeight.normal,
              color: color,
            ),
          ),
          const Spacer(),
          Text(
            'Rs.' + price + '/-',
            style: MyTextStyle(
                fontSize: fontSizeMedium,
                fontWeight: bold ? FontWeight.w600 : FontWeight.w500,
                color: color),
          ),
        ],
      ),
    );
  }
}
