import 'package:e_plaza/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  TextEditingController searchController = TextEditingController();

  Controller();

  @override
  void onInit() {
    super.onInit();
  }
}
