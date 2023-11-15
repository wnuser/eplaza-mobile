import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class SocialButtons extends StatelessWidget {

  final void Function() facebook;
  final void Function() google;
  final void Function() instagram;

  SocialButtons({Key? key, required this.facebook, required this.google, required this.instagram}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _socialIcon('assets/icons/facebook.png'),
        Helper.spaceHorizontal(14),
        _socialIcon('assets/icons/google.png'),
        Helper.spaceHorizontal(14),
        _socialIcon('assets/icons/instagram.png'),
      ],
    );
  }

  Widget _socialIcon(String icon) {
    // return Container(width: 20, height: 20,color: Colors.deepOrange,);
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          minimumSize: Size(15.w, 5.h),
          maximumSize: Size(15.w, 5.h),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5.h))),
      child: assetImage(icon, width: 18, height: 18, color: Colors.white),
    );
  }
}
