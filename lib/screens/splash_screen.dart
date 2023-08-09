import 'package:e_plaza_vendor/screens/home/home_page_w.dart';
import 'package:e_plaza_vendor/screens/login/login.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/const.dart';
import '../utils/logger.dart';
import '../utils/preference.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() {
    Future.delayed(Duration(seconds: 2), () {
      Preference.init().whenComplete(() {
        if (Preference.isLogin) {
          //Already Login
          Get.offAll(() => HomeScreenWithBottomMenu());
        } else {
          Get.offAll(() => LoginScreen());
        }
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: assetImage(
          'assets/images/splash.png',
          // width: 100.w,
          // height: 100.h,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
