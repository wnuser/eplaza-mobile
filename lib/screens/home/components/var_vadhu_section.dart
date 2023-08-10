import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../widgets/primary_button.dart';

class VarVadhuSection extends StatelessWidget {
  VarVadhuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100.w,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/var_vadhu.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Var Vadhu',
                style: MyTextStyle(
                  color: ThemeColors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Helper.spaceVertical(4),
              Text(
                'Explore var vadhu section',
                style: MyTextStyle(
                  color: ThemeColors.white,
                  fontSize: fontSizeSmall,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Helper.spaceVertical(18),
              PrimaryButton(
                child: 'Explore',
                onPressed: () {},
                height: 34,
                width: 100,
                textStyle: MyTextStyle(
                  color: Colors.white,
                  fontSize: fontSizeSmall,
                ),
              ),
            ],
          ),
        ),
        Helper.spaceVertical(2),
        _buttons(),
      ],
    );
  }

  Widget _buttons() {
    return Row(
      children: [
        Helper.spaceHorizontal(4),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: ThemeColors.colorPrimary, width: 1)),
            child: Text(
              'Var Vadhu',
              style: MyTextStyle(
                color: ThemeColors.colorPrimary,
                fontSize: fontSizeMini,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Helper.spaceHorizontal(4),
        Expanded(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: ThemeColors.colorPrimary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
            child: Text(
              'Resale Bazaar',
              style: MyTextStyle(
                color: ThemeColors.white,
                fontSize: fontSizeMini,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Helper.spaceHorizontal(4),
        Expanded(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: ThemeColors.colorPrimary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: Text(
              'Job Khojo',
              style: MyTextStyle(
                color: ThemeColors.white,
                fontSize: fontSizeMini,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Helper.spaceHorizontal(4),
        Expanded(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: ThemeColors.colorPrimary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: Text(
              'Seller',
              style: MyTextStyle(
                color: ThemeColors.white,
                fontSize: fontSizeMini,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Helper.spaceHorizontal(4),
      ],
    );
  }
}
