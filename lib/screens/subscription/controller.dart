import 'package:e_plaza_vendor/modals/subscription.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

import '../../data_provider/repository.dart';
import '../../modals/plan.dart';
import '../../utils/preference.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  final ExpandableController expandableController = ExpandableController();

  Controller();

  final RxList<Plan> plans = <Plan>[].obs;
  final RxList<Subscription> subscriptions = <Subscription>[].obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    getSubscriptions();
    getPlans();
  }

  void getPlans() async {
    status.value = Status.PROGRESS;
    var data = await Repository.instance.getPlans();

    plans.clear();
    if (data.isNotEmpty) {
      data.forEach((element) => plans.add(Plan.fromJson(element)));
    }
    plans.refresh();
    status.value = Status.NORMAL;
  }

  void getSubscriptions() async {
    status.value = Status.PROGRESS;
    var data = await Repository.instance.getSubscription(Preference.user.id.nullSafe);

    subscriptions.clear();
    if (data.isNotEmpty) {
      data.forEach((element) {
        var sub = Subscription.fromJson(element);
        if (sub.isPlanExpired == '0') subscriptions.add(sub);
      });
    }
    subscriptions.refresh();
    status.value = Status.NORMAL;
  }

  List<String> get features => [
        'Access All Products',
        'Update all features of shop',
        'Save & Fill passwords',
        'Security challenge',
        'Password generator',
        'Secure Notes',
        'Multi Factor authentication',
        'Feature 8 for subscription'
      ];
}
