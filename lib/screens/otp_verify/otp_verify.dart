import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/dimen.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../utils/const.dart';
import 'controller.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String userId;

  OtpVerifyScreen(this.userId);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final cp = 8.0;

  Controller _controller = Get.put<Controller>(Controller(), tag: 'OtpVerifyController');

  @override
  void initState() {
    _controller.userId = widget.userId;
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
                        child: RichText(
                          text: TextSpan(
                              text: 'Please verify\nyour ',
                              style: MyTextStyle(
                                color: Colors.white,
                                fontSize: 6.w,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Cell Number',
                                  style: MyTextStyle(
                                    color: Colors.black,
                                    fontSize: 6.w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Helper.spaceVertical(1.2.h),
                      Container(
                        width: 70.w,
                        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Please enter the 6 digit verification Code sent to your cell number',
                          style: MyTextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Helper.spaceVertical(4.h),
                      OTPTextField(
                        length: 6,
                        width: 80.w,
                        fieldWidth: 10.w,
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
                          _controller.verify();
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
                      _controller.verify();
                      // if (kDebugMode) {
                      //   //Temp Code
                      //   Preference.setLogin(true);
                      //   Preference.token =
                      //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtYXRjaFBhc3N3b3JkIjpbeyJpZCI6NTIsImZpcnN0X25hbWUiOiJUZXN0IiwibGFzdF9uYW1lIjoiQnJhaW4iLCJlbWFpbCI6InRlc3RicmFpbi5kZXZAZ21haWwuY29tIiwicGFzc3dvcmQiOiIkMmIkMTAkL0JYS091YUVYaFN1QzAvWWRjZ1hOdUp2cDFwSWRUZDFMNVhXV29wSXVpTkVXRTNVaHRUNkMiLCJtb2JpbGUiOiI3OTA2MjM0ODY2IiwidXNlcl90eXBlIjoyLCJzdGF0dXMiOjEsInppcF9jb2RlIjpudWxsLCJzb2NpYWxfaWQiOiIiLCJyZWdpc3Rlcl9vdHAiOiI2NjE2OTEiLCJpc192ZXJpZmllZCI6bnVsbCwiY2l0eSI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMy0xMC0wMVQxMjo1NjoyNy4wMDBaIiwidXBkYXRlZEF0IjoiMjAyMy0xMC0wMVQxMjo1Njo0NC4wMDBaIn1d';
                      //   Get.offAll(() => VerifiedScreen());
                      // }
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
