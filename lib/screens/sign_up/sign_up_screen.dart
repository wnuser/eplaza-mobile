import 'package:e_plaza/screens/components/social_buttons.dart';
import 'package:e_plaza/screens/login_with_otp/login_with_otp.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../widgets/normal_outline_text_field.dart';
import '../../widgets/normal_text_field.dart';
import 'signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Controller _controller;

  final cp = 8.0;

  @override
  void initState() {
    _controller = Get.put<Controller>(Controller(), tag: 'SignUpController');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 95.h,
              width: 100.w,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Helper.spaceVertical(3.h),
                  assetImage('assets/icons/logo.png', width: 60.w, fit: BoxFit.fitWidth),
                  Helper.spaceVertical(1.h),
                  Expanded(
                    child: Container(
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
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Helper.spaceVertical(3.h),
                            Text(
                              'Sign Up',
                              style: MyTextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
                            ),
                            Helper.spaceVertical(3.h),
                            NormalTextField(
                              label: 'First Name',
                              controller: _controller.fNameController,
                            ),
                            Helper.spaceVertical(2.h),
                            NormalTextField(
                              label: 'Last Name',
                              controller: _controller.lNameController,
                            ),
                            Helper.spaceVertical(2.h),
                            NormalTextField(
                              label: 'Email',
                              controller: _controller.emailController,
                              inputType: TextInputType.emailAddress,
                            ),
                            Helper.spaceVertical(2.h),
                            NormalTextField(
                              label: 'Password',
                              controller: _controller.passwordController,
                              inputType: TextInputType.visiblePassword,
                              obSecure: true,
                            ),
                            Helper.spaceVertical(2.h),
                            NormalTextField(
                              label: 'Cell No',
                              controller: _controller.cellNoController,
                              inputType: TextInputType.phone,
                            ),
                            Helper.spaceVertical(2.h),
                            NormalTextField(
                              label: 'Zip Code',
                              controller: _controller.zipCodeController,
                              inputType: TextInputType.number,
                            ),
                            Helper.spaceVertical(4.h),
                            PrimaryButton(
                              // width: 80.w,
                              height: 7.h,
                              borderRadius: 3.5.h,
                              onPressed: () => _controller.signUpRequest(_controller.fNameController.text,_controller.lNameController.text,_controller.emailController.text,
                                  _controller.passwordController.text,_controller.cellNoController.text,_controller.zipCodeController.text,context),
                              child: 'SIGNUP',
                            ),
                            Helper.spaceVertical(2.h),
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
                  ),
                  Helper.spaceVertical(2.h),  const Text(
                    'Already have an Account?',
                    style: MyTextStyle(fontWeight: FontWeight.w300),
                  ),
                  Helper.spaceVertical(2.h),
                  PrimaryButton.outline(
                    onPressed: () {},
                    child: 'SIGN IN',
                    width: (100 - ((cp * 4) + 2)).w,
                    height: 7.h,
                  ),
                ],
              ),
            ),
            Obx(() => progressLayout(enable: _controller.status.value == Status.PROGRESS))
          ],
        ),
      ),
    );
  }
}
