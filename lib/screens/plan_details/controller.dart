import 'dart:convert';

import 'package:e_plaza_vendor/data_provider/payment_controller.dart';
import 'package:e_plaza_vendor/data_provider/repository.dart';
import 'package:e_plaza_vendor/screens/subscription/subscription_screen.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/logger.dart';
import 'package:e_plaza_vendor/utils/preference.dart';
import 'package:e_plaza_vendor/utils/toasty.dart';
import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

import '../../modals/plan.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  final ExpandableController expandableController = ExpandableController();

  Rx<Plan> plan = Plan().obs;

  Controller();

  final RxString planType = PlanType.Quarterly.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {}

  void purchase() async {
    status.value = Status.PROGRESS;

    double finalPrice = Helper.parseDouble(planType.value == PlanType.Quarterly
        ? plan.value.quarterlyPrice.nullSafe
        : plan.value.yearlyPriceDiscount.nullSafe);

    PaymentController().pay(
      price: finalPrice,
      onSuccess: (String paymentMethod, String paymentId, double totalPrice,
          Map<String, dynamic>? response) async {
        Logger.m(tag: "PAYMENT SUCCESS", value: jsonEncode(response));
        var result = await Repository.instance.purchasePlan(
          vendor_id: Preference.user.id.nullSafe,
          plan_id: plan.value.id.nullSafe,
          plan_price: planType.value == PlanType.Quarterly
              ? plan.value.quarterlyPrice.nullSafe
              : plan.value.yearlyPriceDiscount.nullSafe,
          discount_price:
              planType.value == PlanType.Quarterly ? '' : plan.value.yearlyPriceDiscount.nullSafe,
          total_billing_amount: finalPrice,
          duration: planType.value == PlanType.Quarterly ? '90' : '365',
        );

        if (result['success']) {
          Toasty.success(result['message'].toString().placeholder('somethingWentWrong'.t));
          Get.off(() => SubscriptionScreen());
        } else {
          Toasty.failed(result.message.placeholder('somethingWentWrong'.t));
        }
        status.value = Status.NORMAL;
      },
      onError: (String paymentMethod, String error, double totalPrice) {
        // Logger.e(tag: 'PAYMENT FAILED', value: error);
        Toasty.failed(error);
        status.value = Status.NORMAL;
      },
    );
  }
}
