import 'dart:math';

class StoreCategory{
  String? id = Random().nextInt(100).toString();
  String? title;
  String? image;

  StoreCategory(this.title, this.image);
}