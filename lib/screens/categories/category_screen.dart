import 'package:e_plaza/screens/categories/category_item.dart';
import 'package:e_plaza/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/category.dart';
import 'controller.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'categoriesScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar('Categories', enableSearch: true, searchCallBack: (s) {}),
          // Expanded(
          //   child: FutureBuilder<List<Category>>(
          //     future: _controller.getAllCategories(context),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return GridView.builder(
          //           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 3,
          //             mainAxisSpacing: 12,
          //             crossAxisSpacing: 12,
          //             childAspectRatio: 1 / 1,
          //           ),
          //           itemBuilder: (c, i) {
          //             return CategoryItem(i, snapshot.data![i]);
          //           },
          //           physics: BouncingScrollPhysics(),
          //           shrinkWrap: true,
          //           itemCount: snapshot.data!.length,
          //         );
          //       } else if (snapshot.hasError) {
          //         return Center(child: Text(snapshot.error.toString()));
          //       } else {
          //         return Center(child: CircularProgressIndicator());
          //       }
          //     },
          //   ),
          // )
        ]),
      ),
    );
  }
}
