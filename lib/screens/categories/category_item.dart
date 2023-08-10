import 'package:e_plaza/modals/category.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int i;

  CategoryItem(this.i, this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Helper.spaceVertical(2),
          Expanded(
            child: MyNetworkImage(
              path: '',
              imageName: category.image.nullSafe,
              fit: BoxFit.fitHeight,
            ),
          ),
          Helper.spaceVertical(4),
          Text(
            category.title.nullStr,
            style: MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w600, height: 1),
            maxLines: 1,
          ),
          Helper.spaceVertical(8),
        ],
      ),
    );
  }
}
