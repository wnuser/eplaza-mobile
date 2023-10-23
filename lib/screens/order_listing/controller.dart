import 'package:e_plaza_vendor/dialogs/alert_dialog.dart';
import 'package:e_plaza_vendor/modals/result.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/toasty.dart';
import 'package:get/get.dart';

import '../../data_provider/repository.dart';
import '../../modals/order.dart';
import '../../modals/sub_category.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  final RxString category = 'Category'.obs;

  final RxList<Order> orders = <Order>[].obs;
  final RxList<Order> ordersMain = <Order>[].obs;

  RxList<SubCategory> categories = <SubCategory>[].obs;

  Controller();

  @override
  void onInit() {
    super.onInit();
    _getSubCategories();
    getOrders();
  }

  void _getSubCategories() async {
    var data = await Repository.instance.getSubCategories('1');

    categories.clear();
    if (data.isNotEmpty) {
      data.forEach((element) => categories.add(SubCategory.fromJson(element)));
    }
    // status.value = Status.NORMAL;
  }

  void getOrders() async {
    // status.value = Status.PROGRESS;
    // var res = await Repository.instance.getProducts();
    // products.clear();
    // productsMain.clear();
    // if (res.isNotEmpty) {
    //   res.forEach((element) {
    //     products.add(product.Product.fromJson(element));
    //   });
    //   productsMain.addAll(products);
    // }
    // category.value = 'Category';
    // status.value = Status.NORMAL;

    //TODO: Temp
    orders.clear();
    ordersMain.clear();
    orders.addAll([
      Order(
          'Mobiles',
          '200',
          'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100',
          'Nice product at this range'),
      Order(
          'Fashion',
          '300',
          'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100',
          'Nice product at this range'),
      Order(
          'Electronics',
          '400',
          'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100',
          'Nice product at this range'),
      Order(
          'Travel',
          '600',
          'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100',
          'Nice product at this range'),
      Order(
          'Offers',
          '700',
          'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100',
          'Nice product at this range'),
      Order(
          'Toys',
          '800',
          'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100',
          'Nice product at this range'),
      Order(
          'Mobiles',
          '200',
          'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100',
          'Nice product at this range'),
      Order(
          'Fashion',
          '300',
          'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100',
          'Nice product at this range'),
      Order(
          'Electronics',
          '400',
          'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100',
          'Nice product at this range'),
      Order(
          'Travel',
          '600',
          'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100',
          'Nice product at this range'),
      Order(
          'Offers',
          '700',
          'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100',
          'Nice product at this range'),
      Order(
          'Toys',
          '800',
          'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100',
          'Nice product at this range'),
    ]);
    ordersMain.addAll(orders);
    status.value = Status.NORMAL;
  }


  void filter(num? categoryId) {
    // orders.clear();
    // orders.addAll(ordersMain.where((p0) => p0.categoryId == categoryId));
  }
}
