import 'dart:math';

import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../utils/const.dart';
import '../../values/dimen.dart';
import 'controller.dart';

class OtpVerifyScreen extends StatefulWidget {
  final Function() onVerified;

  OtpVerifyScreen(this.onVerified);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final cp = 8.0;
  String final_otp="";

  VerifyOtpController _controller = Get.put<VerifyOtpController>(VerifyOtpController(), tag: 'OtpVerifyController');

  @override
  void initState() {
    _controller.onVerified = widget.onVerified;
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
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/mi_bg.jpeg'),
                fit: BoxFit.fitWidth,
              )),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Spacer(),
                  assetImage('assets/icons/logo.png', width: 60.w, fit: BoxFit.fitWidth),
                  Helper.spaceVertical(6.h),
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 70.w,
                        child: FutureBuilder<String>(
                          future: _controller.getMobileNumber(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              // Data is still loading, you can show a loading indicator here
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              // An error occurred, you can display an error message here
                              return Text('Error: ${snapshot.error}');
                            } else {
                              // Data is loaded successfully, display the mobile number
                              return RichText(
                                text: TextSpan(
                                  text: 'Please verify\nyour mobile  ',
                                  style: MyTextStyle(
                                    color: Colors.white,
                                    fontSize: 6.w,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: snapshot.data,
                                      style: MyTextStyle(
                                        color: Colors.black,
                                        fontSize: 6.w,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Helper.spaceVertical(1.2.h),
                      Container(
                        width: 90.w,
                        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Please enter the 4 digit verification Code sent to your cell number',
                          style: MyTextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Helper.spaceVertical(4.h),
                      OTPTextField(
                        length: 6,
                        width: 90.w,
                        fieldWidth: 12.w,
                        spaceBetween: 0,
                        style: const MyTextStyle(
                          fontSize: fontSizeSmall,
                          color: ThemeColors.colorPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        fieldStyle: FieldStyle.box,
                        otpFieldStyle: OtpFieldStyle(
                            borderColor: ThemeColors.colorPrimary,
                            backgroundColor: ThemeColors.whiteBlue,
                            enabledBorderColor: ThemeColors.colorPrimary,
                            focusBorderColor: ThemeColors.colorPrimary),
                        onChanged: (otp) => _controller.ENTERED_OTP = otp,
                        outlineBorderRadius: 6,
                        onCompleted: (pin) {
                          _controller.ENTERED_OTP = pin;
                          final_otp=pin;
                          _controller.verifyOtp(pin,context);
                        },
                      ),
                      // Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     _cell(),
                      //     _cell(),
                      //     _cell(),
                      //     _cell(),
                      //   ],
                      // ),
                      Helper.spaceVertical(3.h),
                      Text(
                        'Resent OTP',
                        style: MyTextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Helper.spaceVertical(3.h),
                    ],
                  ),
                  Helper.spaceVertical(4.w),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      _controller.verifyOtp(final_otp, context);
                    },
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_forward_rounded),
                  ),
                  Spacer(),
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
