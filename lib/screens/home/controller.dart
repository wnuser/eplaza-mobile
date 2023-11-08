import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/logger.dart';
import 'package:get/get.dart';

// import 'package:package_info_plus/package_info_plus.dart';

import '../../../data_provider/repository.dart';
import '../../modals/plan.dart';
import '../../modals/shop_details.dart';
import '../../modals/slide.dart';
import '../../modals/subscription.dart';
import '../../utils/preference.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;

  Controller();

  @override
  void onInit() {
    init(showLoader: true);
    getShopDetails();
    super.onInit();
  }

  final RxList<Plan> plans = <Plan>[].obs;
  final RxList<Subscription> subscriptions = <Subscription>[].obs;
  List<Slide> slides = [
    Slide(
        'title', 'https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png'),
    Slide('title',
        'https://imgscf.slidemembers.com/docs/1/1/214/italian_food_-_free_presentation_template_213726.jpg'),
    Slide('title',
        'https://www.googleslidesthemes.com/images/f/o/o/d/-/food-burger-recipe-menu-google-slides-theme-slide-01-41a76612.webp'),
  ];

  Future<void> init({bool showLoader = false}) async {
    // if (Const.packageName.notEmpty) {
    //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //   Const.packageName = packageInfo.packageName;
    //   Const.versionCode = packageInfo.buildNumber;
    //   Const.versionName = packageInfo.version;
    // }

    Const.name.value = Preference.user.firstName.nullSafe + ' ' + Preference.user.lastName.nullSafe;
    Const.email.value = Preference.user.email.nullSafe;
    Const.profilePic.value = '';
    await getSubscriptions();
    getPlans();
  }

  void getPlans({bool showLoader = false}) async {
    if (showLoader) status.value = Status.PROGRESS;

    var data = await Repository.instance.getPlans();

    plans.clear();
    if (data.isNotEmpty) {
      data.forEach((element) => plans.add(Plan.fromJson(element)));
    }
    status.value = Status.NORMAL;
  }

  Future<void> getSubscriptions({bool showLoader = false}) async {
    if (showLoader) status.value = Status.PROGRESS;

    var data = await Repository.instance.getSubscription(Preference.user.id.nullSafe);

    subscriptions.clear();
    if (data.isNotEmpty) {
      data.forEach((element) => subscriptions.add(Subscription.fromJson(element)));
    }
    subscriptions.refresh();
    // status.value = Status.NORMAL;
  }

  void getShopDetails() async {
    var response = await Repository.instance.getShopDetails();
    if (response.isNotEmpty) {
      ShopDetails details = ShopDetails.fromJson(response[0]);
      Preference.shopId = details.id.nullSafe;
    }else{
      Logger.e(tag: 'SHOP NOT FOUND', value: response);
    }
  }
}








