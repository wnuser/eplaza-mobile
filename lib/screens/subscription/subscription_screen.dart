import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/plan.dart';
import '../../values/dimen.dart';
import '../../values/theme_colors.dart';
import '../../widgets/widgets.dart';
import '../plan_details/plan_details_screen.dart';
import 'controller.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'SubscriptionScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar('Subscription'),
          _list(),
        ]),
      ),
    );
  }

  Widget _list() {
    return Expanded(
      child: Obx(() {
        if (_controller.status.value == Status.PROGRESS) {
          return progressLayout();
        }

        if (_controller.plans.isNotEmpty || _controller.subscriptions.isNotEmpty) {
          List<Widget> li = [];

          _controller.subscriptions.forEach((subscription) {
            print(subscription.subscriptionBilling?.duration);
            li.add(_newCard(
              planName: subscription.subscriptionPlan?.name,
              yearlyPrice: subscription.subscriptionPlan?.yearlyPrice.nullSafe,
              quarterlyPrice: subscription.subscriptionPlan?.quarterlyPrice,
              yearlyPriceDiscount: subscription.subscriptionPlan?.yearlyPriceDiscount,
              yearlyOff: subscription.subscriptionPlan?.yearlyPrice,
              facilities: subscription.subscriptionPlan?.facilities,
              id: subscription.subscriptionPlan?.id,
              planType: subscription.subscriptionBilling?.duration == '365'
                  ? PlanType.Yearly
                  : PlanType.Quarterly,
              isSubscribed: true,
            ));
          });

          if (_controller.plans.isNotEmpty) {
            for (int i = 0; i < _controller.plans.length; i++) {
              Plan plan = _controller.plans[i];

              if (_controller.subscriptions.isNotEmpty &&
                  _controller.subscriptions[0].subscriptionPlan?.id != plan.id)
                li.add(_newCard(
                  planName: plan.name,
                  yearlyPrice: plan.yearlyPrice,
                  quarterlyPrice: plan.quarterlyPrice,
                  yearlyPriceDiscount: plan.yearlyPriceDiscount,
                  yearlyOff: plan.yearlyPrice,
                  facilities: plan.facilities,
                  id: plan.id,
                  planType: PlanType.Quarterly,
                ));
            }
          }

          // _controller.plans.forEach((plan) {
          //   li.add(_newCard(
          //     planName: plan.name,
          //     yearlyPrice: plan.yearlyPrice,
          //     quarterlyPrice: plan.quarterlyPrice,
          //     yearlyPriceDiscount: plan.yearlyPriceDiscount,
          //     yearlyOff: plan.yearlyPrice,
          //     facilities: plan.facilities,
          //     id: plan.id,
          //     planType: PlanType.Quarterly,
          //       onPlanTypeChange: (type) {
          //       plan.planType = type;
          //       _controller.plans.refresh();
          //       }
          //   ));
          // });

          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            physics: BouncingScrollPhysics(),
            children: li,
          );
        }
        return empty();
      }),
    );
  }

  Widget _feature(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.8.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // assetImage('assets/icons/checked_outline.png', width: fontSizeMedium, height: fontSizeMedium, color: ThemeColors.colorPrimary),
          // Helper.spaceHorizontal(4),
          Text(
            '❖ ' + text,
            style: MyTextStyle(
              color: Colors.black54,
              fontSize: fontSizeMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _newCard({
    required String? id,
    required String? planName,
    required String? quarterlyPrice,
    required String? yearlyPrice,
    required String? yearlyOff,
    required String? yearlyPriceDiscount,
    required String? facilities,
    required String planType,
    bool isSubscribed = false,
  }) {
    RxString type = planType.obs;
    return Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400, width: 1)),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isSubscribed)
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade500, width: 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(
                          () => _type('Quarterly', type.value == PlanType.Quarterly, () {
                            type.value = PlanType.Quarterly;
                          }),
                        ),
                        Obx(
                          () => _type(' Yearly ', type.value == PlanType.Yearly, () {
                            type.value = PlanType.Yearly;
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              Helper.spaceVertical(12),
              Text(
                planName.nullSafe,
                style: MyTextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Helper.spaceVertical(16),
              Obx(
                () => type.value == PlanType.Yearly
                    ? Text(
                        Const.currencySymbol + yearlyPrice.nullSafe,
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
                          (type.value == PlanType.Quarterly
                              ? quarterlyPrice.nullSafe
                              : yearlyPriceDiscount.nullSafe),
                      style: MyTextStyle(
                        color: Colors.black,
                        fontSize: 8.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      '/' + type.value,
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
                  'Billed ' + type.value,
                  style: MyTextStyle(
                    color: Colors.black,
                    fontSize: fontSizeMedium,
                  ),
                ),
              ),
              Helper.spaceVertical(20),
              // Center(
              //   child: OutlinedButton(
              //     style: OutlinedButton.styleFrom(
              //       minimumSize: Size(100.w, 46),
              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              //       side: BorderSide(
              //         color: ThemeColors.colorPrimary.shade300,
              //         width: 1,
              //       ),
              //     ),
              //     onPressed: () {
              //       Plan plan = Plan(
              //         id: id,
              //         name: planName,
              //         quarterlyPrice: quarterlyPrice,
              //         yearlyPrice: yearlyPrice,
              //         yearlyOff: yearlyOff,
              //         yearlyPriceDiscount: yearlyPriceDiscount,
              //         facilities: facilities,
              //       );
              //       Get.to(() =>
              //           PlanDetailsScreen(plan: plan, purchased: isSubscribed, planType: planType));
              //     },
              //     child: Text(isSubscribed ? 'View Features' : 'View Details'),
              //   ),
              // ),
              Helper.spaceVertical(4),
              Text(
                'Features :',
                style: MyTextStyle(
                  color: Colors.black,
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Helper.spaceVertical(6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // padding: EdgeInsets.symmetric(horizontal: 10.w),
                    // shrinkWrap: true,
                    children: facilities.toList.map(_feature).toList(),
                  ),
                ),
              ),
            ],
          ),
          if (isSubscribed)
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  assetImage('assets/icons/check_mark.png', width: 24, height: 24),
                  Text(
                    'Purchased',
                    style: MyTextStyle(
                      color: Color.fromARGB(255, 63, 142, 77),
                      fontWeight: FontWeight.w600,
                      fontSize: fontSizeLarge,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _type(String title, bool selected, void Function() cb) {
    return TextButton(
      onPressed: cb,
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
