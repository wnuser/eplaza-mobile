import 'package:e_plaza/utils/const.dart';
import 'package:get/get.dart';

import '../../modals/category.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  List<Category> categories = [
    Category(
        'Grocery', 'https://rukminim1.flixcart.com/flap/128/128/image/29327f40e9c4d26b.png?q=100'),
    Category(
        'Mobiles', 'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100'),
    Category(
        'Fashion', 'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100'),
    Category('Electronics',
        'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
    Category(
        'Travel', 'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100'),
    Category(
        'Offers', 'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100'),
    Category(
        'Toys', 'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100'),
    Category(
        'Grocery', 'https://rukminim1.flixcart.com/flap/128/128/image/29327f40e9c4d26b.png?q=100'),
    Category(
        'Mobiles', 'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100'),
    Category(
        'Fashion', 'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100'),
    Category('Electronics',
        'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
    Category(
        'Travel', 'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100'),
    Category(
        'Offers', 'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100'),
    Category(
        'Toys', 'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100'),
    Category(
        'Grocery', 'https://rukminim1.flixcart.com/flap/128/128/image/29327f40e9c4d26b.png?q=100'),
    Category(
        'Mobiles', 'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100'),
    Category(
        'Fashion', 'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100'),
    Category('Electronics',
        'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
    Category(
        'Travel', 'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100'),
    Category(
        'Offers', 'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100'),
    Category(
        'Toys', 'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100'),
  ];

  Controller();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {}
}
