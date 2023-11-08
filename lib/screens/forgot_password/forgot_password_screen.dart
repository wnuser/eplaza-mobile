import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/dimen.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/primary_button.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../widgets/normal_outline_text_field.dart';
import 'controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late Controller _controller;

  final cp = 4.0;

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
                                'Forgot Password',
                                style: MyTextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
                              ),
                            ),
                            Helper.spaceVertical(4.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Enter your registered email address to get verification code.\n\nWe\'ll ask for password in next step.\n\nIf you don\'t have your email? Please contact to the E-Plaza Support',
                                style: MyTextStyle(fontSize: fontSizeMedium, color: Colors.black),
                              ),
                            ),
                            Helper.spaceVertical(4.h),
                            NormalOutlineTextField(
                              label: 'Email',
                              controller: _controller.emailController,
                              inputType: TextInputType.emailAddress,
                              validator: Helper.emptyValidator,
                            ),
                            Helper.spaceVertical(4.h),
                            PrimaryButton(
                              // width: 80.w,
                              height: 7.h,
                              borderRadius: 3.5.h,
                              onPressed: _controller.proceed,
                              child: 'Verify',
                            ),
                            Helper.spaceVertical(4.h),
                          ],
                        ),
                      ),
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
