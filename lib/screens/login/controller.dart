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
  final TextEditingController passwordController = TextEditingController();

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
      passwordController.text = 'Manish@123';
    }
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      status.value = Status.PROGRESS;
      var response = await Repository.instance.login(emailController.text, passwordController.text);

      if (response['success']) {
        User user = User.fromJson(response['data']);
        Preference.setLogin(true);
        Preference.setUser(user);
        Preference.token = response['token'];
        Toasty.success(response['message'].toString().placeholder('somethingWentWrong'.t));
        Get.offAll(() => HomeScreenWithBottomMenu());
      } else {
        Toasty.failed(response['message']);
      }
      status.value = Status.NORMAL;
    }
  }
}





