import 'package:e_plaza_vendor/dialogs/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/const.dart';
import '../../utils/helper.dart';
import '../../values/dimen.dart';
import '../../values/theme_colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/my_network_image.dart';
import '../../widgets/widgets.dart';
import 'controller.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'OrderDetailsScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar('Order Details'),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _orderCard(),
                    Divider(),
                    _userInfo(),
                    Divider(),
                    _partner(),
                    Helper.spaceVertical(10),
                    Divider(),
                    Helper.spaceVertical(10),
                    _bt(),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  Widget _bt() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Helper.spaceHorizontal(12),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Helper.openUrl('https://www.africau.edu/images/default/sample.pdf', launchMode: LaunchMode.externalApplication);
            },
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: ThemeColors.offWhite,
                side: BorderSide(color: Colors.grey.shade300, width: 1)),
            child: const Text(
              'Invoice',
              style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Helper.spaceHorizontal(6),
        Expanded(
          child: MyPopupMenuButton(
            title: 'Change Status',
            list: [
              'Accept Order',
              'Cancel Order',
              'Complete Order',
            ],
            onSelected: (s) {},
            child: OutlinedButton(
              onPressed: null,
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: ThemeColors.offWhite,
                  side: BorderSide(color: Colors.grey.shade300, width: 1)),
              child: const Text(
                'Change Status',
                style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
        Helper.spaceHorizontal(12),
      ],
    );
  }

  Widget _orderCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                        Helper.spaceHorizontal(8),
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
          Helper.spaceVertical(12),
        ],
      ),
    );
  }

  Widget _userInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'User Details',
            style: const MyTextStyle(
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.w600,
            ),
          ),
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
                        'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg',
                    open: true,
                    width: 50,
                    height: 50,
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
                      'Narendra Modi',
                      style: const MyTextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Member since April 2023',
                      style: const MyTextStyle(
                        fontSize: fontSizeSmall,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'From Uttarakhand/Dehradun',
                      style: const MyTextStyle(
                        fontSize: fontSizeSmall,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              smallIconImage('assets/icons/call.png', () {
                Helper.openUrl("tel:1234567890", launchMode: LaunchMode.externalNonBrowserApplication);
              },
                  color: ThemeColors.colorPrimary, iconColor: ThemeColors.colorPrimary),
              Helper.spaceHorizontal(8),
            ],
          ),
        ],
      ),
    );
  }

  Widget _partner() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Partner',
            style: const MyTextStyle(
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.w600,
            ),
          ),
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
                        'https://www.kershaw2go.com/editable/images/user/SafeFoodDelivery.png',
                    open: true,
                    width: 50,
                    height: 50,
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
                      'Flipkart',
                      style: const MyTextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Member since April 2023',
                      style: const MyTextStyle(
                        fontSize: fontSizeSmall,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'From Uttarakhand/Dehradun',
                      style: const MyTextStyle(
                        fontSize: fontSizeSmall,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              smallIconImage('assets/icons/call.png', () {
                Helper.openUrl("tel:1234567890", launchMode: LaunchMode.externalNonBrowserApplication);
              },
                  color: ThemeColors.colorPrimary, iconColor: ThemeColors.colorPrimary),
              Helper.spaceHorizontal(8),
            ],
          ),
        ],
      ),
    );
  }
}
