import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/normal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/my_network_image.dart';
import '../../widgets/primary_button.dart';
import 'controller.dart';

class ReturnFillingScreen extends StatelessWidget {
  ReturnFillingScreen({Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'ReturnFillingScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar('Return'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _orderCard(),
                _reasonCard(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: PrimaryButton(
              child: 'Continue',
              onPressed: () {},
              borderRadius: 4,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _reasonCard() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
          Obx(() {
            return _controller.selectedReason.value == _controller.reasons[0]
                ? empty()
                : Text(
                    'Cancel reason',
                    style: MyTextStyle(
                      color: Colors.grey,
                      fontSize: fontSizeSmall,
                    ),
                  );
          }),
          Obx(() {
            return DropdownButton(
              isExpanded: true,
              value: _controller.selectedReason.value,
              items: _controller.reasons
                  .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(
                        e,
                        style: MyTextStyle(
                          color: e == _controller.reasons[0]
                              ? Colors.grey
                              : ThemeColors.defaultTextColor,
                        ),
                      )))
                  .toList(),
              onChanged: (e) {
                _controller.selectedReason.value = e.nullSafe;
              },
              underline: empty(),
            );
          }),
          Obx(() {
            return _controller.selectedReason.value == 'Other'
                ? NormalTextField(
                    label: 'Describe your cancellation reason',
                    controller: TextEditingController(),
                    minLines: 4,
                  )
                : empty();
          }),
        ],
      ),
    );
  }

  Widget _orderCard() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'ORDER ID : OD876543876548765',
              style: const MyTextStyle(
                fontWeight: FontWeight.w600,
                fontSize: fontSizeMedium,
              ),
            ),
          ),
          Divider(color: Colors.grey.shade400, height: 0, thickness: 0.6),
          Helper.spaceVertical(8),
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
                      'Quantity - 2KG',
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
    );
  }
}
