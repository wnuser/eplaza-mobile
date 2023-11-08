import 'package:e_plaza_vendor/data_provider/repository.dart';
import 'package:e_plaza_vendor/modals/user.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/toasty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/preference.dart';
import '../home/home_page_w.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final RxBool obSecure = true.obs;

  Controller();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    if (Helper.isDeveloper) {
      emailController.text = 'testbrain.dev@gmail.com';
    }
  }

  Future<void> proceed() async {
    if (formKey.currentState!.validate()) {
      status.value = Status.PROGRESS;
      //TODO:
      status.value = Status.NORMAL;
    }
  }
}





