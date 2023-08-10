import 'package:e_plaza/modals/product.dart';
import 'package:e_plaza/modals/slide.dart';
import 'package:e_plaza/modals/store_category.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/category.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
        'Home', 'https://rukminim1.flixcart.com/flap/128/128/image/ab7e2b022a4587dd.jpg?q=100'),
    Category(
        'Travel', 'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100'),
    Category(
        'Offers', 'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100'),
    Category(
        'Toys', 'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100'),
  ];
  List<StoreCategory> storeCategories = [
    StoreCategory('Daily Need',
        'http://www.eplaza.in/wp-content/uploads/2022/12/c94df51e52985b4e79b74a63f9780441-1-150x150.jpg'),
    StoreCategory('Kirana',
        'http://www.eplaza.in/wp-content/uploads/2022/07/photo-1604719312566-8912e9227c6a-300x300.jpg'),
    StoreCategory('Fast Food', 'http://www.eplaza.in/wp-content/uploads/2022/12/ff-2-300x300.jpg'),
    StoreCategory('Fashion',
        'http://www.eplaza.in/wp-content/uploads/2022/12/a4016739adede59c5d67cb39b2ecbbf7-300x300.jpg'),
    StoreCategory('Medical',
        'http://www.eplaza.in/wp-content/uploads/2022/12/af093a28f0e430d4bb57c7e75d974bc5-150x150.jpg'),
    StoreCategory('Kirana',
        'http://www.eplaza.in/wp-content/uploads/2022/07/photo-1604719312566-8912e9227c6a-300x300.jpg'),
    StoreCategory('Furniture',
        'http://www.eplaza.in/wp-content/uploads/2022/12/24d2f207d099930d69d5379b884c40cc-150x150.jpg'),
    StoreCategory('Mobile', 'http://www.eplaza.in/wp-content/uploads/2022/06/COMPUTER.jpg'),
    StoreCategory('Gift Store',
        'http://www.eplaza.in/wp-content/uploads/2022/07/Waste-management-in-beauty-can-be-improved-if-brands-add-value-and-step-up-communication-says-Certified-Sustainable-300x300.jpg'),
    StoreCategory('Medical',
        'http://www.eplaza.in/wp-content/uploads/2022/12/af093a28f0e430d4bb57c7e75d974bc5-150x150.jpg'),
  ];

  List<StoreCategory> garamMartCategories = [
    StoreCategory('Furniture',
        'http://www.eplaza.in/wp-content/uploads/2022/12/24d2f207d099930d69d5379b884c40cc-150x150.jpg'),
    StoreCategory('Mobile', 'http://www.eplaza.in/wp-content/uploads/2022/06/COMPUTER.jpg'),
    StoreCategory('Gift Store',
        'http://www.eplaza.in/wp-content/uploads/2022/07/Waste-management-in-beauty-can-be-improved-if-brands-add-value-and-step-up-communication-says-Certified-Sustainable-300x300.jpg'),
    StoreCategory('Medical',
        'http://www.eplaza.in/wp-content/uploads/2022/12/af093a28f0e430d4bb57c7e75d974bc5-150x150.jpg'),
    StoreCategory('Gift Store',
        'http://www.eplaza.in/wp-content/uploads/2022/07/Waste-management-in-beauty-can-be-improved-if-brands-add-value-and-step-up-communication-says-Certified-Sustainable-300x300.jpg'),
  ];

  List<Slide> slides = [
    Slide(
        'title', 'https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png'),
    Slide('title',
        'https://imgscf.slidemembers.com/docs/1/1/214/italian_food_-_free_presentation_template_213726.jpg'),
    Slide('title',
        'https://www.googleslidesthemes.com/images/f/o/o/d/-/food-burger-recipe-menu-google-slides-theme-slide-01-41a76612.webp'),
  ];

  List<dynamic> latestProducts = [
    Product('Mobiles', '200', '150',
        'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100'),
    Product('Electronics', '400', '300',
        'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
    Product('Travel', '600', '500',
        'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100'),
    Product('Toys', '800', '700',
        'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100'),
    Product('Fashion', '300', '250',
        'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100'),
    [
      Product('Shoe 1', '200', '150',
          'https://freepngimg.com/thumb/shoes/27428-5-nike-shoes-transparent-background-thumb.png'),
      Product('Shoe 2', '300', '250',
          'https://freepngimg.com/thumb/shoes/27428-5-nike-shoes-transparent-background-thumb.png'),
      Product('Shoe 3', '400', '300',
          'https://freepngimg.com/thumb/shoes/27428-5-nike-shoes-transparent-background-thumb.png'),
    ],
    [
      Product('Mobiles', '200', '150',
          'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100'),
      Product('Fashion', '300', '250',
          'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100'),
      Product('Electronics', '400', '300',
          'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
    ],
    Product('Electronics', '400', '240',
        'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
    Product('Travel', '600', '300',
        'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100'),
    Product('Offers', '700', '600',
        'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100'),
    Product('Electronics', '400', '300',
        'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
    Product('Toys', '800', '700',
        'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100'),
    [
      Product('Shoe 1', '600', '500',
          'https://freepngimg.com/thumb/shoes/27428-5-nike-shoes-transparent-background-thumb.png'),
      Product('Shoe 2', '700', '600',
          'https://freepngimg.com/thumb/shoes/27428-5-nike-shoes-transparent-background-thumb.png'),
    ],
    Product('Travel ', '300', '250',
        'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100'),
    Product('Offers', '400', '300',
        'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
  ];
  List<dynamic> offerProducts = [
    Product('Mobiles', '200', '150',
        'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100'),
    Product('Fashion', '300', '200',
        'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100'),
    [
      Product('Mobiles', '200', '150',
          'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100'),
      Product('Fashion', '300', '250',
          'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100'),
      Product('Electronics', '400', '300',
          'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
      Product('Travel', '600', '500',
          'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100'),
    ],
    Product('Electronics', '400', '240',
        'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
    Product('Travel', '600', '300',
        'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100'),
    Product('Offers', '700', '600',
        'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100'),
    Product('Toys', '800', '700',
        'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100'),
    [
      Product('Fashion', '300', '250',
          'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100'),
      Product('Electronics', '400', '300',
          'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
      Product('Travel', '600', '500',
          'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100'),
      Product('Offers', '700', '600',
          'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100'),
    ],
    Product('Mobiles', '200', '150',
        'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100'),
    Product('Fashion', '300', '250',
        'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100'),
    Product('Electronics', '400', '300',
        'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
    Product('Travel', '600', '500',
        'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100'),
    [
      Product('Electronics', '400', '240',
          'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
      Product('Travel', '600', '300',
          'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100'),
      Product('Offers', '700', '600',
          'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100'),
      Product('Toys', '800', '700',
          'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100'),
    ],
    Product('Offers', '700', '600',
        'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100'),
    Product('Toys', '800', '799',
        'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100'),
    Product('Electronics', '400', '240',
        'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100'),
  ];

  Controller();

  @override
  void onInit() {
    super.onInit();
  }
}
