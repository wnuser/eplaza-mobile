import 'package:e_plaza_vendor/modals/result.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/toasty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:package_info_plus/package_info_plus.dart';

import '../../../data_provider/repository.dart';
import '../otp_verify/otp_verify.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Rx<Result> loginResult = Result().obs;
  final RxBool obSecureText = true.obs;

  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cellNoController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  String countryName = '';

  Controller();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    if (Helper.isDeveloper) {
      fNameController.text = 'Test';
      lNameController.text = 'Brain';
      emailController.text = 'testbrain.dev@gmail.com';
      passwordController.text = 'Manish@123';
      cellNoController.text = '1234567890';
      zipCodeController.text = '123456';
    }

    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // Const.packageName = packageInfo.packageName;
    // Const.versionCode = packageInfo.buildNumber;
    // Const.versionName = packageInfo.version;

    // Repository.instance.getConfig();
  }

  void signUp() async {
    if (formKey.currentState!.validate()) {
      status.value = Status.PROGRESS;
      var data = await Repository.instance.register(
        fNameController.text,
        lNameController.text,
        emailController.text,
        passwordController.text,
        cellNoController.text,
        '2',
        zipCodeController.text,
        '',
      );

      if (data['success'] == true) {
        Toasty.failed(data['message'].toString());
        Get.offAll(() => OtpVerifyScreen(data['data']['id'].toString()));
      } else {
        Toasty.failed(data['message'].toString().placeholder('somethingWentWrong'.t));
      }
      status.value = Status.NORMAL;
    }
  }
}
