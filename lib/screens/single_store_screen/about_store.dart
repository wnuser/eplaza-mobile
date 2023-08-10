import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';

class AboutStoreWidget extends StatelessWidget {
  AboutStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: MyTextStyle(
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Helper.spaceVertical(2),
              Text(
                'Our store specializes in providing high-quality, handcrafted home decor items that are both stylish and functional.',
                style: MyTextStyle(
                  fontSize: fontSizeSmall,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
        ],
      ),
    );
  }
}
