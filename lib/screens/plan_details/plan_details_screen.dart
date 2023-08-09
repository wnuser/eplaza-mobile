import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/app_bar.dart';
import 'package:e_plaza_vendor/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/plan.dart';
import '../../values/dimen.dart';
import '../../widgets/widgets.dart';
import 'controller.dart';

class PlanDetailsScreen extends StatefulWidget {
  final Plan plan;
  final bool purchased;
  final String planType;

  PlanDetailsScreen({required this.plan, this.purchased = false, this.planType = PlanType.Quarterly, Key? key}) : super(key: key);

  @override
  State<PlanDetailsScreen> createState() => _PlanDetailsScreenState();
}

class _PlanDetailsScreenState extends State<PlanDetailsScreen> {
  final Controller _controller = Get.put(Controller(), tag: 'PlanDetailsScreenController');

  @override
  void initState() {
    _controller.plan.value = widget.plan;
    // Future.delayed(Duration(milliseconds: 700), () {
    //   _controller.planType.value = widget.planType;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar('Plan Details'),
          Helper.spaceVertical(12),
          _planTypeWid(),
          Expanded(
            child: Container(
              width: 100.w,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400, width: 1)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _controller.plan.value.name.nullSafe,
                    style: MyTextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Helper.spaceVertical(16),
                  Obx(
                    () => _controller.planType.value == PlanType.Yearly
                        ? Text(
                            Const.currencySymbol + _controller.plan.value.yearlyPrice.nullSafe,
                            style: MyTextStyle(
                              color: Colors.black54,
                              fontSize: 5.w,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        : empty(),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Text(
                          Const.currencySymbol +
                              (_controller.planType.value == PlanType.Quarterly
                                  ? _controller.plan.value.quarterlyPrice.nullSafe
                                  : _controller.plan.value.yearlyPriceDiscount.nullSafe),
                          style: MyTextStyle(
                            color: Colors.black,
                            fontSize: 8.w,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          '/' + _controller.planType.value,
                          style: MyTextStyle(
                            color: Colors.black,
                            // fontSize: fontSizeSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Helper.spaceVertical(4),
                  Obx(
                    () => Text(
                      'Billed ' + _controller.planType.value,
                      style: MyTextStyle(
                        color: Colors.black,
                        fontSize: fontSizeMedium,
                      ),
                    ),
                  ),
                  Helper.spaceVertical(20),
                  if (!widget.purchased)
                    Center(
                      child: PrimaryButton(
                        // child: 'Start Free Trial',
                        child: 'Purchase',
                        onPressed: _controller.purchase,
                        width: 75.w,
                        borderRadius: 6,
                      ),
                    ),
                  Helper.spaceVertical(16),
                  Text(
                    'Features you get :',
                    style: MyTextStyle(
                      color: Colors.black,
                      fontSize: fontSizeLarge,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Helper.spaceVertical(12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // padding: EdgeInsets.symmetric(horizontal: 10.w),
                          // shrinkWrap: true,
                          children: _controller.plan.value.facilities.toList.map(_feature).toList(),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 20),
                  //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  //   decoration: BoxDecoration(
                  //     color: Colors.black,
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: Text(
                  //     'Purchase',
                  //     style: MyTextStyle(
                  //       color: Colors.white,
                  //       fontSize: fontSizeLarge,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _feature(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.8.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              '❖ ' + text,
              style: MyTextStyle(
                color: Colors.black,
                fontSize: fontSizeMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _planTypeWid() {
    return widget.purchased ?
    Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Purchased ' + widget.planType,
        style: MyTextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    )
        : Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade500, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => _type('Quarterly', _controller.planType.value == PlanType.Quarterly, () {
              _controller.planType.value = PlanType.Quarterly;
            }),
          ),
          Obx(
            () => _type(' Yearly ', _controller.planType.value == PlanType.Yearly, () {
              _controller.planType.value = PlanType.Yearly;
            }),
          ),
        ],
      ),
    );
  }

  Widget _type(String title, bool selected, void Function() cb) {
    return TextButton(
      onPressed: cb,
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          backgroundColor: selected ? ThemeColors.colorPrimary : ThemeColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))),
      child: Text(
        title,
        style: MyTextStyle(
          color: selected ? Colors.white : ThemeColors.colorPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
