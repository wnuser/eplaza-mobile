import 'package:e_plaza/screens/components/social_buttons.dart';
import 'package:e_plaza/screens/login_with_otp/login_with_otp.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/primary_button.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../widgets/normal_outline_text_field.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../sign_up/sign_up_screen.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController _controller;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();



  final cp = 8.0;

  @override
  void initState() {
    _controller = Get.put<LoginController>(LoginController(), tag: 'LoginController');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _controller.scrollController,
              child: Container(
                height: 95.h,
                width: 100.w,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Helper.spaceVertical(4.h),
                    // Helper.spaceVertical(2.h),
                    assetImage('assets/icons/logo.png', width: 60.w, fit: BoxFit.fitWidth),
                    Helper.spaceVertical(2.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: (cp + 2).w),
                      padding: EdgeInsets.symmetric(horizontal: cp.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 4,
                              spreadRadius: 4,
                              offset: Offset(0, 2)),
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Helper.spaceVertical(3.h),
                          Text(
                            'Sign In',
                            style: MyTextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
                          ),
                          Helper.spaceVertical(4.h),
                          NormalOutlineTextField(
                            label: 'Email',
                            controller: _controller.emailController,
                            inputType: TextInputType.emailAddress,
                            focusNode: _controller.emailFocusNode,
                            onChanged: _controller.onEmailChange,
                          ),
                          Helper.spaceVertical(2.h),
                          Stack(
                            children: [
                              NormalOutlineTextField(
                                label: 'Password',
                                controller: _controller.passwordController,
                                focusNode: _controller.passwordFocusNode,
                                obSecure: true,
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {}, child: Icon(Icons.remove_red_eye_outlined)))
                            ],
                          ),
                          Helper.spaceVertical(4.h),
                          PrimaryButton(
                            // width: 80.w,
                            height: 7.h,
                            borderRadius: 3.5.h,
                            onPressed: () => _controller.loginRequest(_controller.emailController.text,
                                _controller.passwordController.text,context),
                            child: 'SIGN IN',
                          ),
                          Helper.spaceVertical(3.h),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    Get.to(() => ForgotPasswordScreen()),
                                child: const Text(
                                  'Forgot Password?',
                                  style: MyTextStyle(
                                      // fontSize: fontSizeSmall,
                                      fontWeight: FontWeight.w400,
                                      height: 1),
                                ),
                              ),
                              const Text(
                                ' | ',
                                style: MyTextStyle(
                                    // fontSize: fontSizeSmall,
                                    fontWeight: FontWeight.w400,
                                    height: 1),
                              ),
                              GestureDetector(
                                onTap: () => Get.to(() => LoginWithOtpScreen()),
                                child: const Text(
                                  'OTP LOGIN',
                                  style: MyTextStyle(
                                      // fontSize: fontSizeSmall,
                                      fontWeight: FontWeight.w400,
                                      height: 1),
                                ),
                              ),
                            ],
                          ),
                          Helper.spaceVertical(10),
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
            Obx(() => progressLayout(enable: _controller.status.value == Status.PROGRESS))
          ],
        ),
      ),
    );
  }
}
