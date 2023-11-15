import 'package:e_plaza/modals/result.dart';
import 'package:e_plaza/screens/otp_verify/otp_verify.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data_provider/repository.dart';
import '../../apiHandler/api_controller.dart';
import '../../helper/navigator_key.dart';
import '../../utils/app_util.dart';
import '../../utils/form_validator.dart';

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
    EasyLoading.init();
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

  void signUpRequest(String fname,String lname,String email,String password,String phone,String zipcode, BuildContext context) {
    print("signup_data"+fname+" "+lname+" "+email+" "+password+" "+phone+" "+zipcode);

    if (FormValidator().isTextEmpty(fname)) {
      showErrorMessage(LocalizationString.pleaseEnterfName, context);
    } else if (FormValidator().isTextEmpty(lname)) {
      showErrorMessage(LocalizationString.pleaseEnterlName, context);
    }else if (FormValidator().isTextEmpty(email)) {
      showErrorMessage(LocalizationString.pleaseEnterEmail, context);
    }else if (FormValidator().isTextEmpty(password)) {
      showErrorMessage(LocalizationString.pleaseEnterPassword, context);
    }else if (FormValidator().isTextEmpty(phone)) {
      showErrorMessage(LocalizationString.pleaseEnterPhone, context);
    }else if (FormValidator().isTextEmpty(zipcode)) {
      showErrorMessage(LocalizationString.pleaseEnterZipcode, context);
    }
    else {
      AppUtil.checkInternet().then((value) {
        if (value) {
          EasyLoading.show(status: LocalizationString.loading);
          ApiController().signUpRequest(fname,lname,email,password,phone,zipcode).then((response) async {
            if (response.success!) {
              EasyLoading.dismiss();

              if(response.data != null)
              {
                saveRegisterData(response.data!.id!,response.data!.mobile!);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  OtpVerifyScreen(() => null)));

                showSuccessMessage(response.message!, context);
              }


              // if (response.data != null) {
              //   String? firstName = response.data!.firstName;
              //   String? lastName = response.data!.lastName;
              //   showSuccessMessage(
              //       response.message!, context);
              // }

              print("checkPhoneRequest_success  "+response.message!);

            }else if(!response.success! && response.data != null){
              EasyLoading.dismiss();

              bool? isVerified = response.data!.is_verified;
                if(isVerified==null)
                  {
                    saveRegisterData(response.data!.id!,response.data!.mobile!);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>  OtpVerifyScreen(() => null)));

                    showErrorMessage(response.message!, context);
                  }

            } else {
              EasyLoading.dismiss();

              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(builder: (context) =>  LoginReffralViewScreen(mobile: mobile,)));
              showErrorMessage(response.message!,context);

              print("checkPhoneRequest_error "+response.message!);

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

  Future<void> saveRegisterData(int id, String mob) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id);
    await prefs.setString('mobile', mob);
  }

}
