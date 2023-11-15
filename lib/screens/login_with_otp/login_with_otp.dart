import 'package:e_plaza/modals/country2.dart';
import 'package:e_plaza/screens/components/social_buttons.dart';
import 'package:e_plaza/screens/otp_verify/otp_verify.dart';
import 'package:e_plaza/screens/sign_up/sign_up_screen.dart';
import 'package:e_plaza/utils/data/country2.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../widgets/normal_outline_text_field.dart';
import '../verified_screen/verified_screen.dart';
import 'controller.dart';

class LoginWithOtpScreen extends StatefulWidget {
  @override
  _LoginWithOtpScreenState createState() => _LoginWithOtpScreenState();
}

class _LoginWithOtpScreenState extends State<LoginWithOtpScreen> {
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
                          NormalOutlineTextField<Country2>.dropdown(
                            label: 'Country',
                            controller: _controller.countryController,
                            prefix: Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Obx(() =>
                                    assetImage(_controller.flag.value, fit: BoxFit.fitHeight)),
                              ),
                            ),
                            dropdownList: countriesWithFlags,
                            showDropdownIcon: false,
                            onSelected: (c) {
                              _controller.flag.value = c.flag;
                              return c.country.toUpperCase() + ' (' + c.phoneCode + ')';
                            },
                          ),
                          Helper.spaceVertical(2.h),
                          NormalOutlineTextField(
                            label: 'Enter phone number',
                            controller: _controller.phoneController,
                            inputType: TextInputType.phone,
                          ),
                          Helper.spaceVertical(4.h),
                          PrimaryButton(
                            // width: 80.w,
                            height: 7.h,
                            borderRadius: 3.5.h,
                            onPressed: () {
                              Get.to(
                                () => OtpVerifyScreen(() {
                                  Get.back();
                                  Get.to(() => VerifiedScreen());
                                })
                                ,
                              );
                            },
                            child: 'LOGIN',
                          ),
                          Helper.spaceVertical(3.h),
                          GestureDetector(
                            onTap: Get.back,
                            child: const Text(
                              'LOGIN WITH EMAIL',
                              style: MyTextStyle(
                                  // fontSize: fontSizeSmall,
                                  fontWeight: FontWeight.w400,
                                  height: 1),
                            ),
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
            Obx(() => progressLayout(enable: _controller.status.value == Status.PROGRESS)),
          ],
        ),
      ),
    );
  }
}
