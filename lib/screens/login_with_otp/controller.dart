import 'package:e_plaza/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;

  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final RxString flag = 'assets/flags/flag_in.png'.obs;

  Controller();

  @override
  void onInit() {
    super.onInit();
    init();

    countryController.text = 'INDIA (+91)';
  }

  Future<void> init() async {}
}
