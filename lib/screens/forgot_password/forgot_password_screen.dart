import 'package:e_plaza/screens/components/social_buttons.dart';
import 'package:e_plaza/screens/login_with_otp/login_with_otp.dart';
import 'package:e_plaza/screens/otp_verify/otp_verify.dart';
import 'package:e_plaza/screens/reset_password/reset_password_screen.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../widgets/normal_outline_text_field.dart';
import '../sign_up/sign_up_screen.dart';
import 'controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late Controller _controller;

  final cp = 8.0;

  @override
  void initState() {
    _controller = Get.put<Controller>(Controller(), tag: 'ForgotPasswordController');
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
                            'Forgot Password',
                            style: MyTextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
                          ),
                          Helper.spaceVertical(6.h),
                          NormalOutlineTextField(
                            label: 'Email',
                            controller: _controller.emailController,
                            inputType: TextInputType.emailAddress,
                            focusNode: _controller.emailFocusNode,
                            onChanged: _controller.onEmailChange,
                          ),
                          Helper.spaceVertical(6.h),
                          PrimaryButton(
                            // width: 80.w,
                            height: 7.h,
                            borderRadius: 3.5.h,
                            onPressed: () {
                              Get.to(() => OtpVerifyScreen(() {
                                Get.back();
                                Get.to(() => ResetPasswordScreen());
                              }));
                            },
                            child: 'Continue',
                          ),
                          Helper.spaceVertical(10.h),
                        ],
                      ),
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
