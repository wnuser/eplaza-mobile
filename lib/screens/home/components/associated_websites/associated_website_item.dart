import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';

class AssociatedWebsiteWidget extends StatelessWidget {
  AssociatedWebsiteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png',),
          opacity: 0.25,
          fit: BoxFit.fill,
        )
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          assetImage('assets/icons/heart.png',
              color: ThemeColors.colorPrimary, width: 10.w, height: 10.w),
          // Helper.spaceVertical(4),
          Text(
            'Cardiogram',
            style: MyTextStyle(
              color: ThemeColors.black,
              fontSize: fontSizeSmall,
            ),
          )
        ],
      ),
    );
  }
}
