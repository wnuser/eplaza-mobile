import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/dimen.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/primary_button.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../widgets/normal_text_field.dart';
import 'controller.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Controller _controller;

  final cp = 4.0;

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
            Container(
              height: 97.h,
              width: 100.w,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Helper.spaceVertical(2.h),
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
                              blurRadius: 1,
                              spreadRadius: 2,
                              offset: Offset(0, 2)),
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Form(
                          key: _controller.formKey,
                          child: Column(
                            children: [
                              Helper.spaceVertical(2.h),
                              Text(
                                'Sign Up',
                                style: MyTextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'First Name',
                                controller: _controller.fNameController,
                                validator: Helper.emptyValidator,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Last Name',
                                controller: _controller.lNameController,
                                validator: Helper.emptyValidator,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Email',
                                controller: _controller.emailController,
                                inputType: TextInputType.emailAddress,
                                validator: Helper.emptyValidator,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Password',
                                controller: _controller.passwordController,
                                validator: _controller.validatePassword,
                                obSecure: true,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.info_circle_fill,
                                      size: 20,
                                      color: Colors.grey.shade600,
                                    ),
                                    Helper.spaceHorizontal(6),
                                    Expanded(
                                        child: Text(
                                      'Password Must Contain Symbol, Number, Uppercase letter and Lowercase letter',
                                      style: MyTextStyle(fontSize: fontSizeSmall),
                                    )),
                                  ],
                                ),
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Cell No',
                                controller: _controller.cellNoController,
                                inputType: TextInputType.phone,
                                validator: Helper.emptyValidator,
                                maxLength: 10,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Zip Code',
                                controller: _controller.zipCodeController,
                                inputType: TextInputType.number,
                                validator: Helper.emptyValidator,
                                maxLength: 8,
                              ),
                              Helper.spaceVertical(4.h),
                              PrimaryButton(
                                // width: 80.w,
                                height: 7.h,
                                borderRadius: 3.5.h,
                                onPressed: _controller.signUp,
                                child: 'SIGNUP',
                              ),
                              Helper.spaceVertical(2.h),
                              // const Text(
                              //   'Or sign in with',
                              //   style: MyTextStyle(fontWeight: FontWeight.w300),
                              // ),
                              // Helper.spaceVertical(16),
                              // SocialButtons(
                              //   facebook: () {},
                              //   google: () {},
                              //   instagram: () {},
                              // ),
                              // Helper.spaceVertical(16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Helper.spaceVertical(2.h),
                  RichText(
                    text: TextSpan(
                        text: 'Already have an Account? ',
                        style: MyTextStyle(fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                            text: 'SIGN IN',
                            style: MyTextStyle(
                              fontWeight: FontWeight.w600,
                              color: ThemeColors.colorPrimary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = Get.back,
                          )
                        ]),
                  ),
                  // Helper.spaceVertical(2.h),
                  // PrimaryButton.outline(
                  //   onPressed: Get.back,
                  //   child: 'SIGN IN',
                  //   width: (100 - ((cp * 4) + 2)).w,
                  //   height: 7.h,
                  // ),
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
