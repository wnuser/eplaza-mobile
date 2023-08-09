import 'package:e_plaza_vendor/dialogs/alert_dialog.dart';
import 'package:e_plaza_vendor/modals/product.dart' as product;
import 'package:e_plaza_vendor/modals/result.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/toasty.dart';
import 'package:get/get.dart';

import '../../data_provider/repository.dart';
import '../../modals/sub_category.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  final RxString category = 'Category'.obs;

  final RxList<product.Product> products = <product.Product>[].obs;
  final RxList<product.Product> productsMain = <product.Product>[].obs;

  // List<Product> products = [
  //   Product(
  //       'Mobiles',
  //       '200',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100',
  //       'Nice product at this range'),
  //   Product(
  //       'Fashion',
  //       '300',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100',
  //       'Nice product at this range'),
  //   Product(
  //       'Electronics',
  //       '400',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100',
  //       'Nice product at this range'),
  //   Product(
  //       'Travel',
  //       '600',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100',
  //       'Nice product at this range'),
  //   Product(
  //       'Offers',
  //       '700',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100',
  //       'Nice product at this range'),
  //   Product(
  //       'Toys',
  //       '800',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100',
  //       'Nice product at this range'),
  //   Product(
  //       'Mobiles',
  //       '200',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100',
  //       'Nice product at this range'),
  //   Product(
  //       'Fashion',
  //       '300',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/c12afc017e6f24cb.png?q=100',
  //       'Nice product at this range'),
  //   Product(
  //       'Electronics',
  //       '400',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100',
  //       'Nice product at this range'),
  //   Product(
  //       'Travel',
  //       '600',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100',
  //       'Nice product at this range'),
  //   Product(
  //       'Offers',
  //       '700',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100',
  //       'Nice product at this range'),
  //   Product(
  //       'Toys',
  //       '800',
  //       'https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100',
  //       'Nice product at this range'),
  // ];

  RxList<SubCategory> categories = <SubCategory>[].obs;

  Controller();

  @override
  void onInit() {
    super.onInit();
    _getSubCategories();
    getProducts();
  }

  void _getSubCategories() async {
    var data = await Repository.instance.getSubCategories('1');

    categories.clear();
    if (data.isNotEmpty) {
      data.forEach((element) => categories.add(SubCategory.fromJson(element)));
    }
    // status.value = Status.NORMAL;
  }

  void getProducts() async {
    status.value = Status.PROGRESS;
    var res = await Repository.instance.getProducts();
    products.clear();
    productsMain.clear();
    if (res.isNotEmpty) {
      res.forEach((element) {
        products.add(product.Product.fromJson(element));
      });
      productsMain.addAll(products);
    }
    category.value = 'Category';
    status.value = Status.NORMAL;
  }

  void deleteProduct(num? id) {
    MyAlertDialog()
        // .setDefaultIcon()
        .setTitle('Delete Product?')
        .setMessage('You want to delete this product?')
        .setPositiveButton('Yes', () async {
          Get.back();
          status.value = Status.PROGRESS;
          Result result = await Repository.instance.deleteProduct(id);
          if (result.success) {
            getProducts();
          } else {
            status.value = Status.NORMAL;
            Toasty.failed(result.message);
          }
        })
        .setNegativeButton('No', null)
        .show();
  }

  void filter(num? categoryId) {
    products.clear();
    products.addAll(productsMain.where((p0) => p0.categoryId == categoryId));
  }
}
