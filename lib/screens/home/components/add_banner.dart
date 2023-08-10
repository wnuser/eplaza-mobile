import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';

class AddBanner extends StatelessWidget {
  AddBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 25.w,
      color: Colors.white,
      alignment: Alignment.center,
      child: Text(
        'ADD BANNER',
        style: MyTextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
