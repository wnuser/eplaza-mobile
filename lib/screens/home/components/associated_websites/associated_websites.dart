import 'package:flutter/material.dart';

import '../../../../modals/associated_websites_item.dart';
import 'associated_website_item.dart';

class AssociatedWebsites extends StatelessWidget {
  AssociatedWebsites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView(
          // padding: EdgeInsets.symmetric(horizontal: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 1.6 / 1,
          ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: List.generate(12, (index) => AssociatedWebsiteWidget()).toList(),
        ),
        // Helper.spaceVertical(16),
        // PrimaryButton(
        //   onPressed: () {},
        //   width: 22.w,
        //   height: 30,
        //   borderRadius: 15,
        //   child: Text(
        //     'VIEW ALL',
        //     style: MyTextStyle(
        //       color: Colors.white,
        //       fontSize: fontSizeSmall,
        //       fontWeight: FontWeight.w400,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
