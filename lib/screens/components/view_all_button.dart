import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../widgets/primary_button.dart';

class ViewAllButton extends StatelessWidget {
  final void Function() onPressed;

  ViewAllButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {},
      width: 22.w,
      height: 30,
      borderRadius: 15,
      child: Text(
        'VIEW ALL',
        style: MyTextStyle(
          color: Colors.white,
          fontSize: fontSizeSmall,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
