import 'package:e_plaza/screens/home/home_screen.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../home/home_page_w.dart';

class VerifiedScreen extends StatelessWidget {

  VerifiedScreen();
  final cp = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: SafeArea(
        child: Container(
          height: 95.h,
          width: 100.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mi_bg.jpeg'),
              fit: BoxFit.fitWidth,
            )
          ),
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
                    height: 40.h,
                    alignment: Alignment.center,
                    child: Text(
                      'Your account\nhas been verified\nsuccessfully',
                      style: MyTextStyle(
                        color: Colors.black,
                        fontSize: 10.w,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Helper.spaceVertical(3.h),
                ],
              ),
              Helper.spaceVertical(4.w),
              Spacer(),
              FloatingActionButton(
                onPressed: () => Get.to(() => HomeScreen()),
                backgroundColor: Colors.black,
                child: Icon(Icons.arrow_forward_rounded),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
