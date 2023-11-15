import 'package:flutter/material.dart';

import '../../../values/dimen.dart';
import '../../../widgets/widgets.dart';

class Tile extends StatelessWidget {
  final String txt;
  final double spacing;

  Tile(this.txt, {this.spacing = 20, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: spacing),
        child: Text(
          txt,
          style: MyTextStyle(
            fontSize: fontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
