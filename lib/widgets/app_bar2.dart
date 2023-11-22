import 'package:e_plaza/screens/addess_form_screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../values/theme_colors.dart';

class MyAppBar2 extends StatelessWidget {

  // final void Function() search;
  final String title;
  
  MyAppBar2({this.title = 'Search your favorite shop...', Key? key}) : super(key: key);

  // final Controller _controller = Get.put(Controller(), tag: 'SingleStoreScreenController');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.colorPrimary, width: 1.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: title,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor: ThemeColors.colorPrimary,
            ),
            child: Icon(Icons.search_rounded, color: Colors.white),
          ),
          // Helper.spaceHorizontal(4),
        ],
      ),
    );
  }
}
