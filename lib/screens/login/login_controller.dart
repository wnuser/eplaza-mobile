import 'package:e_plaza/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:e_plaza/dialogs/alert_dialog.dart';
import 'package:e_plaza/modals/result.dart';
import 'package:e_plaza/modals/user.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/utils/logger.dart';
import 'package:e_plaza/utils/preference.dart';
import 'package:e_plaza/utils/toasty.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/strings.dart';

import '../../../data_provider/repository.dart';
import '../../apiHandler/api_controller.dart';
import '../../helper/navigator_key.dart';
import '../../utils/app_util.dart';
import '../../utils/form_validator.dart';

class LoginController extends GetxController {
  final RxString status = Status.NORMAL.obs;

  final Rx<Result> loginResult = Result().obs;
  final RxBool obSecureText = true.obs;

  String osType = '';
  String deviceId = '';
  bool gmailAdded = false;
  ScrollController scrollController = ScrollController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String countryName = '';

  // FacebookLogin facebookLogin = FacebookLogin();

  LoginController();

  // void initLocation() async {
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  //   location.onLocationChanged.listen((LocationData currentLocation) {
  //     Logger.d(tag: 'Logger', error: 'Location : ' + currentLocation.latitude.toString() + ", " + currentLocation.longitude.toString());
  //   });
  // }

  @override
  void onInit() {
    super.onInit();
    init();
    // passwordFocusNode.addListener(() {
    //   if (passwordFocusNode.hasFocus) {
    //     scroll();
    //   }
    // });
    //
    // emailFocusNode.addListener(() {
    //   if (emailFocusNode.hasFocus) {
    //     scroll();
    //   }
    // });
    // printKeyHash();
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

  void scroll() => scrollController.animateTo(25.h,
      curve: Curves.easeOut, duration: const Duration(milliseconds: 300));

  void loginRequest(String email,String password, BuildContext context) {
    print("login_data"+email+" "+password);
    if (FormValidator().isTextEmpty(email)) {
      showErrorMessage(LocalizationString.pleaseEnterValidEmail, context);
    } else if (FormValidator().isTextEmpty(password)) {
      showErrorMessage(LocalizationString.pleaseEnterPassword, context);
    }else {
      AppUtil.checkInternet().then((value) {
        if (value) {
          EasyLoading.show(status: LocalizationString.loading);
          ApiController().loginRequest(email,password).then((response) async {
            if (response.success!) {
              EasyLoading.dismiss();

              Preference.setLogin(true);

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  HomeScreen()));

              showSuccessMessage(response.message!,context);

              print("checkPhoneRequest_success  "+response.message!);

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


  void onEmailChange(String value) {
    if (!gmailAdded && value.isNotEmpty && value.endsWith("@")) {
      emailController.clear();
      emailController.text = value + 'gmail.com';
      emailController.selection = TextSelection.fromPosition(
          TextPosition(offset: emailController.text.length));
      gmailAdded = true;
      emailFocusNode.requestFocus();
      passwordFocusNode.requestFocus();
    }
  }

  void loginSuccess(var json) {
    Logger.r(tag: 'Logger', value: json);
    try {
      if (json != null && json['success'] == true) {
        User user = User.fromJson(json);
        Preference.setUser(user);
        if (user.activated != '1') {
          MyAlertDialog()
              .setDefaultIcon()
              .setDialogCancelable(false)
              .setTitle(Strings.get('login'))
              .setMessage(Strings.get('yourAccountIsDeactivated'))
              .setPositiveButton(Strings.get('ok'), Get.back)
              .show();
        } else if (user.authType == 'NORMAL' && user.emailVerified != '1') {
          // Get.to(() => OtpVerifyScreen(emailController.text));
          status.value = Status.NORMAL;
        } else {
          Preference.setLogin(true);
          Toasty.success(
              Strings.get('welcome') + ' ' + user.name.nullSafe.inCaps);
          // Get.offAll(() => HomeScreen());
          status.value = Status.NORMAL;
        }
      } else {
        MyAlertDialog()
            .setTitle('Login Error')
            .setDefaultIcon()
            .setMessage(json['message'] ?? 'somethingWentWrong'.t)
            .setTextSelectable()
            .setPositiveButton('OK', null)
            .show();
        status.value = Status.COMPLETED;
      }
    } catch (e) {
      Logger.e(tag: "LOGIN ERROR", value: e);
      Toasty.failed(json['message'] ?? 'somethingWentWrong'.t);
      status.value = Status.COMPLETED;
    }
  }

// Future<void> loginWithGoogle() async {
//   // var json = await Repository.instance.socialLogin('TEST_123', 'GOOGLE', 'Manish', 'mk@gmail.com', '');
//   // loginSuccess(json);
//   // return;
//
//   status.value = Status.PROGRESS;
//   SocialLoginController.google((success, id, name, email, img) async {
//     if (success) {
//       status.value = Status.PROGRESS;
//       var json = await Repository.instance.socialLogin(id, 'GOOGLE', name, email, img);
//       loginSuccess(json);
//     } else {
//       status.value = Status.NORMAL;
//       Toasty.failed('Unable to login! Please try again later');
//     }
//   });
//
//   // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
//   // try {
//   //   GoogleSignInAccount account = await _googleSignIn.signIn();
//   //
//   //   if (account != null) {
//   //     status.value = Status.PROGRESS;
//   //     List<int> imageBytes = await Repository.instance.getImage(account.photoUrl);
//   //     Result upload = await Repository.instance.uploadImageFromBytes(imageBytes, FileUploadType.PROFILE_IMG);
//   //     var json = await Repository.instance
//   //         .socialLogin(account.id, 'GOOGLE', account.displayName, account.email, upload.value);
//   //     // var json = await Repository.instance.socialLogin('TEST_123', 'GOOGLE', 'Manish', 'mk@gmail.com', '');
//   //     // loginSuccess(json);
//   //     loginSuccess(json);
//   //   }
//   //
//   //   _googleSignIn.signOut();
//   //   // status.value = Status.NORMAL;
//   //   Logger.m(tag: "GOOGLE SIGN IN", value: account.toString());
//   // } catch (error) {
//   //   // status.value = Status.NORMAL;
//   //   Logger.e(tag: 'GOOGLE SIGN IN ERROR', value: error);
//   //   if (Const.isDeveloper) {
//   //     MyAlertDialog()
//   //         .setTitle('Google Login Error')
//   //         .setDefaultIcon()
//   //         .setMessage(error.toString())
//   //         .setTextSelectable()
//   //         .setPositiveButton('OK', null)
//   //         .show();
//   //   }
//   //   Toasty.failed('Unable to login! Please try again later');
//   // }
// }
//
// void loginWithFacebook() async {
//   status.value = Status.PROGRESS;
//
//   SocialLoginController.facebook((success, id, name, email, img) async {
//     if (success) {
//       var json = await Repository.instance.socialLogin(id, 'FACEBOOK', name, email, img);
//       if (json != null && json['success'] == true) {
//         loginSuccess(json);
//         status.value = Status.NORMAL;
//       } else {
//         Toasty.failed('Unable to login! Please try again later');
//       }
//     } else {
//       status.value = Status.NORMAL;
//       Toasty.failed('Unable to login! Please try again later');
//     }
//   });
// }

  showSuccessMessage(String message, BuildContext context) {
  AppUtil.showToast(context: context, message: message, isSuccess: true);
  }

  showErrorMessage(String message, BuildContext context) {
  AppUtil.showToast(context: context, message: message, isSuccess: false);
  }
}
