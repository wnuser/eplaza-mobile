import 'package:e_plaza/modals/cart_item.dart';
import 'package:get/get.dart';

import '../../modals/store_product.dart';
import '../../utils/const.dart';

class CartController extends GetxController {
  RxString status = Status.NORMAL.obs;

  static RxMap<String, CartItem> cartItems = <String, CartItem>{}.obs;
  final RxList<StoreProduct> storeProducts = <StoreProduct>[].obs;
  final RxList<StoreProduct> similarProducts = <StoreProduct>[].obs;

  static void add(StoreProduct product) {
    if (CartController.cartItems.containsKey(product.title)) {
      CartController.cartItems[product.title]!.quantity++;
    } else {
      CartController.cartItems.putIfAbsent(product.title, () => CartItem(product, 1));
    }
    CartController.cartItems.refresh();
  }

  static void remove(String title) {
    if (CartController.cartItems.containsKey(title)) {
      if (CartController.cartItems[title]!.quantity > 1) {
        CartController.cartItems[title]!.quantity--;
      } else {
        CartController.cartItems.remove(title);
      }
      CartController.cartItems.refresh();
    }
  }

  CartController();

  @override
  void onInit() {
    super.onInit();

    storeProducts.value = [
      StoreProduct("Nescafe Classic Instant Coffee", "640", "524",
          "https://rukminim1.flixcart.com/image/280/280/kzzw5u80/coffee/s/b/x/-original-imagbwf3wvhzfh5z.jpeg?q=70"),
      StoreProduct("CONTINENTAL Xtra Instant Coffee", "150", "105",
          "https://rukminim1.flixcart.com/image/280/280/kp78e4w0/coffee/x/j/6/xtra-instant-coffee-glass-bottle-continental-original-imag3hzrxg7mwced.jpeg?q=70"),
      StoreProduct("Levista Strong Instant Coffee", "210", "88",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/e/x/f/-original-imagg9qxwhstjynj.jpeg?q=70"),
      StoreProduct("Nescafe Gold Rich and Smooth Coffee Powder Glass Jar Instant Cof", "495", "381",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/x/h/y/-original-imagkgfgbf6eszrr.jpeg?q=70"),
      StoreProduct("Nescafe Gold Instant Coffee", "990", "851",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/d/r/s/-original-imagkgfg7gdgjjmf.jpeg?q=70"),
      StoreProduct("CONTINENTAL Malgudi 60 Degree Fresh Filter Coffee", "100", "82",
          "https://rukminim1.flixcart.com/image/280/280/l5jxt3k0/coffee/0/x/3/-original-imagg742vztkd82v.jpeg?q=70"),
    ];

    similarProducts.value = [
      StoreProduct("Nescafe Gold Instant Coffee", "990", "851",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/d/r/s/-original-imagkgfg7gdgjjmf.jpeg?q=70"),
      StoreProduct("CONTINENTAL Malgudi 60 Degree Fresh Filter Coffee", "100", "82",
          "https://rukminim1.flixcart.com/image/280/280/l5jxt3k0/coffee/0/x/3/-original-imagg742vztkd82v.jpeg?q=70"),
      StoreProduct("Nescafe Classic Instant Coffee", "640", "524",
          "https://rukminim1.flixcart.com/image/280/280/kzzw5u80/coffee/s/b/x/-original-imagbwf3wvhzfh5z.jpeg?q=70"),
      StoreProduct("CONTINENTAL Xtra Instant Coffee", "150", "105",
          "https://rukminim1.flixcart.com/image/280/280/kp78e4w0/coffee/x/j/6/xtra-instant-coffee-glass-bottle-continental-original-imag3hzrxg7mwced.jpeg?q=70"),
      StoreProduct("Levista Strong Instant Coffee", "210", "88",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/e/x/f/-original-imagg9qxwhstjynj.jpeg?q=70"),
      StoreProduct("Nescafe Gold Rich and Smooth Coffee Powder Glass Jar Instant Cof", "495", "381",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/x/h/y/-original-imagkgfgbf6eszrr.jpeg?q=70"),
    ].reversed.toList();
  }
}
