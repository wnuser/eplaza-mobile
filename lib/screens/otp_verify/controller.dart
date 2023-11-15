
import 'package:e_plaza/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiHandler/api_controller.dart';
import '../../helper/navigator_key.dart';
import '../../utils/app_util.dart';
import '../../utils/form_validator.dart';
import '../../utils/preference.dart';
import '../home/home_screen.dart';

class VerifyOtpController extends GetxController {
  final RxString status = Status.NORMAL.obs;
  int id=0;
  String mobile="";

  String ENTERED_OTP = '';
  void Function()? onVerified;

  VerifyOtpController();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    await getRegisterData();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Const.packageName = packageInfo.packageName;
    Const.versionCode = packageInfo.buildNumber;
    Const.versionName = packageInfo.version;
  }

  Future<String> getMobileNumber() async {
    final data = await getRegisterData();
    return data['mobile'];
  }



  Future<Map<String, dynamic>> getRegisterData() async {
    final prefs = await SharedPreferences.getInstance();
    id = prefs.getInt('id') ?? 0;
    mobile = prefs.getString('mobile') ?? '';

    return {
      'id': id,
      'mobile': mobile,
    };
  }




  void verifyOtp(String otp,BuildContext context) {
    // onVerified?.call();
    if (FormValidator().isTextEmpty(otp)) {
      showErrorMessage(LocalizationString.pleaseEnterValidEmail, context);
    }else {
      AppUtil.checkInternet().then((value) {
        if (value) {
          EasyLoading.show(status: LocalizationString.loading);
          ApiController().otpVerifyRequest(id, otp).then((response) async {
            if (response.success!) {
              EasyLoading.dismiss();

              Preference.setLogin(true);

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));

              showSuccessMessage(response.message!, context);

              print("checkPhoneRequest_success  " + response.message!);
            } else {
              EasyLoading.dismiss();

              showErrorMessage(response.message!, context);

              print("checkPhoneRequest_error " + response.message!);
            }
          });
        } else {
          showErrorMessage(LocalizationString.noInternet, context);
        }
      });
    }

  }


  showSuccessMessage(String message, BuildContext context) {
    AppUtil.showToast(context: context, message: message, isSuccess: true);
  }

  showErrorMessage(String message, BuildContext context) {
    AppUtil.showToast(context: context, message: message, isSuccess: false);
  }
}
