import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class GaramMartMelaSection extends StatelessWidget {
  GaramMartMelaSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(flex: 5, child: _start()),
              Helper.spaceHorizontal(10),
              Expanded(flex: 4, child: _end()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _start() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Business',
          style: MyTextStyle(
            color: ThemeColors.colorPrimary,
            fontSize: fontSizeLarge,
            fontWeight: FontWeight.w600,
          ),
        ),
        Helper.spaceVertical(20),
        Text(
          'SHOP NAME HEADING',
          style: MyTextStyle(
            fontSize: fontSizeMini,
            fontWeight: FontWeight.w600,
          ),
        ),
        Helper.spaceVertical(4),
        Text(
          'adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna...',
          style: MyTextStyle(fontSize: fontSizeMicro),
        ),
        Helper.spaceVertical(20),
        PrimaryButton(
          child: 'Explore',
          onPressed: () {},
          height: 30,
          width: 100,
          textStyle: MyTextStyle(
            color: Colors.white,
            fontSize: fontSizeSmall,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _end() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Helper.spaceVertical(20),
              assetImage('assets/images/test.jpeg'),
              Helper.spaceVertical(5),
              assetImage('assets/images/test.jpeg'),
              Helper.spaceVertical(20),
            ],
          ),
        ),
        Helper.spaceHorizontal(12),
        Expanded(flex: 4, child: assetImage('assets/images/test2.jpeg', fit: BoxFit.fitWidth))
      ],
    );
  }
}
