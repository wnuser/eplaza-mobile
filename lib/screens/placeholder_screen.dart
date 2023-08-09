import 'package:e_plaza_vendor/values/dimen.dart';
import 'package:e_plaza_vendor/widgets/app_bar.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  final String placeholder;

  PlaceholderScreen({required this.placeholder, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            MyAppBar('Placeholder'),
            Expanded(
              child: Center(
                child: Text(
                  placeholder,
                  style: MyTextStyle(fontSize: fontSizeLarge),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
