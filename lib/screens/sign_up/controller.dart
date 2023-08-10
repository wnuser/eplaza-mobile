import 'package:e_plaza/modals/result.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../data_provider/repository.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;

  final Rx<Result> loginResult = Result().obs;
  final RxBool obSecureText = true.obs;

  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cellNoController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  String countryName = '';

  // FacebookLogin facebookLogin = FacebookLogin();

  Controller();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    if (Const.isDeveloper) {
      emailController.text = 'testbrain.dev@gmail.com';
      passwordController.text = '123456';
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Const.packageName = packageInfo.packageName;
    Const.versionCode = packageInfo.buildNumber;
    Const.versionName = packageInfo.version;

    Repository.instance.getConfig();
  }

  void signUp(String username, String password) {}
}
