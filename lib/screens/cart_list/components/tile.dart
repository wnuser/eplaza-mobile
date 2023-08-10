import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../values/dimen.dart';
import '../../../widgets/widgets.dart';

class Tile extends StatelessWidget {
  final String txt;
  Tile(this.txt, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        txt,
        style: MyTextStyle(
          fontSize: fontSizeLarge,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
