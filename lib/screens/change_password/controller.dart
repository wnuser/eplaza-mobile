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

  String osType = '';
  String deviceId = '';
  ScrollController scrollController = ScrollController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final RxBool obSecure = true.obs;

  String countryName = '';

  Controller();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    // var r = await Repository.instance.getDataFromIp();
    // if (r != null && r['success'] == true) {
    //   Const.country = r['countryCode'];
    //   countryName = r['country'];
    // }

    if (Const.isDeveloper) {
      emailController.text = 'testbrain.dev@gmail.com';
      passwordController.text = '123456';
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Const.packageName = packageInfo.packageName;
    Const.versionCode = packageInfo.buildNumber;
    Const.versionName = packageInfo.version;

    Repository.instance.getConfig();

    // String id = await PlatformDeviceId.getDeviceId;
    //   Logger.m(baseName: runtimeType, tag: 'TEST DEVICE ID', value: id);
    //   MyAlertDialog()
    //       .setTitle('title')
    //       .setMessage(id)
    //       .setTextSelectable()
    //   .setPositiveButton('ok', Get.back)
    //       .show();
  }
}
