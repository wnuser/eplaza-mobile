import 'package:e_plaza/modals/state.dart' as state;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../modals/city.dart';
import '../../modals/store_product.dart';
import '../../utils/const.dart';
import '../../utils/data/cities.dart';
import '../../utils/data/states.dart';

class Controller extends GetxController {
  RxString status = Status.NORMAL.obs;

  RxString selectedReason = 'Select Reason'.obs;

  final List<String> reasons = <String>[
    'Select Reason',
    'My mood changed',
    'Found better deal with same price',
    'Price is high for this product',
    'My address is changed',
    'Quality is low',
    'Other'
  ];
  Controller();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
  }
}
