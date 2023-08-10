import 'package:e_plaza/screens/home/home_screen.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../widgets/normal_outline_text_field.dart';
import '../home/home_page_w.dart';
import 'controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late Controller _controller;

  final cp = 8.0;

  @override
  void initState() {
    _controller = Get.put<Controller>(Controller(), tag: 'ResetPasswordController');
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
                            'Reset Password',
                            style: MyTextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
                          ),
                          Helper.spaceVertical(6.h),
                          Stack(
                            children: [
                              Obx(
                                () => NormalOutlineTextField(
                                  label: 'Password',
                                  controller: _controller.passwordController,
                                  obSecure: _controller.obSecure.value,
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Obx(
                                    () => TextButton(
                                        onPressed: () {
                                          _controller.obSecure.value = !_controller.obSecure.value;
                                        },
                                        style: TextButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: assetImage(
                                            _controller.obSecure.isTrue
                                                ? 'assets/icons/eye.png'
                                                : 'assets/icons/eye_hide.png',
                                            width: 22,
                                            height: 22)),
                                  ))
                            ],
                          ),
                          Helper.spaceVertical(2.h),
                          Stack(
                            children: [
                              Obx(
                                () => NormalOutlineTextField(
                                  label: 'Confirm Password',
                                  controller: _controller.confirmPasswordController,
                                  obSecure: _controller.obSecure.value,
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Obx(
                                    () => TextButton(
                                        onPressed: () {
                                          _controller.obSecure.value = !_controller.obSecure.value;
                                        },
                                        style: TextButton.styleFrom(
                                          shape: CircleBorder(),
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: assetImage(
                                            _controller.obSecure.isTrue
                                                ? 'assets/icons/eye.png'
                                                : 'assets/icons/eye_hide.png',
                                            width: 22,
                                            height: 22)),
                                  ))
                            ],
                          ),
                          Helper.spaceVertical(4.h),
                          PrimaryButton(
                            // width: 80.w,
                            height: 7.h,
                            borderRadius: 3.5.h,
                            onPressed: () {
                              Get.to(() => HomeScreen());
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
