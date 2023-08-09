import 'package:e_plaza_vendor/screens/components/social_buttons.dart';
import 'package:e_plaza_vendor/screens/sign_up/sign_up_screen.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/primary_button.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../widgets/normal_outline_text_field.dart';
import 'controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Controller _controller;

  final cp = 4.0;

  @override
  void initState() {
    _controller = Get.put<Controller>(Controller(), tag: 'LoginWithOtpController');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: assetImage(
                'assets/images/red_bg.png',
                width: 80.w,
                fit: BoxFit.fitWidth,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: assetImage(
                  'assets/images/black_bg.png',
                  width: 80.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 95.h,
                width: 100.w,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //       image: AssetImage('assets/images/red_bg.jpeg'),
                //       fit: BoxFit.fitWidth
                //   ),
                // ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Helper.spaceVertical(4.h),
                    Helper.spaceVertical(2.h),
                    assetImage('assets/icons/logo.png', width: 60.w, fit: BoxFit.fitWidth),
                    Helper.spaceVertical(6.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: (cp + 2).w),
                      padding: EdgeInsets.symmetric(horizontal: cp.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 1,
                              spreadRadius: 2,
                              offset: Offset(0, 2)),
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Form(
                        key: _controller.formKey,
                        child: Column(
                          children: [
                            Helper.spaceVertical(3.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Log In',
                                style: MyTextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
                              ),
                            ),
                            Helper.spaceVertical(4.h),
                            NormalOutlineTextField(
                              label: 'Email',
                              controller: _controller.emailController,
                              inputType: TextInputType.emailAddress,
                              validator: Helper.emptyValidator,
                            ),
                            Helper.spaceVertical(2.h),
                            Stack(
                              children: [
                                Obx(
                                  () => NormalOutlineTextField(
                                    label: 'Password',
                                    controller: _controller.passwordController,
                                    obSecure: _controller.obSecure.value,
                                    validator: Helper.passwordValidator,
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed: () {
                                          _controller.obSecure.value = !_controller.obSecure.value;
                                        },
                                        style: TextButton.styleFrom(shape: CircleBorder()),
                                        child: Icon(Icons.remove_red_eye_outlined)))
                              ],
                            ),
                            Helper.spaceVertical(4.h),
                            PrimaryButton(
                              // width: 80.w,
                              height: 7.h,
                              borderRadius: 3.5.h,
                              onPressed: _controller.login,
                              child: 'LOGIN',
                            ),
                            Helper.spaceVertical(3.h),
                            const Text(
                              'Or sign in with',
                              style: MyTextStyle(fontWeight: FontWeight.w300),
                            ),
                            Helper.spaceVertical(16),
                            SocialButtons(
                              facebook: () {},
                              google: () {},
                              instagram: () {},
                            ),
                            Helper.spaceVertical(16),
                          ],
                        ),
                      ),
                    ),
                    Helper.spaceVertical(4.h),
                    PrimaryButton.outline(
                      onPressed: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: 'SIGNUP',
                      width: (100 - ((cp * 4) + 2)).w,
                      height: 7.h,
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => progressLayout(enable: _controller.status.value == Status.PROGRESS)),
          ],
        ),
      ),
    );
  }
}
