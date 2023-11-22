import 'package:e_plaza/apiHandler/api_controller.dart';
import 'package:e_plaza/modals/specific_product_details_model.dart';
import 'package:e_plaza/modals/specific_store_products_model.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:get/get.dart';

import '../../modals/store_product.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  final RxList<String> slides = <String>[].obs;
  // final RxList<StoreProduct> storeProducts = <StoreProduct>[].obs;
  
  final RxList<SpecificStoreProducts> storeProductsDynamic = <SpecificStoreProducts>[].obs;
  final RxList<SpecificProductDetails> specificProductDetails = <SpecificProductDetails>[].obs;


  Controller();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    slides.value = [
      'https://rukminim1.flixcart.com/image/832/832/k48rwcw0/watch/t/c/x/lcs-8188-lois-caron-original-imafn749euz3thtn.jpeg?q=70',
      'https://rukminim1.flixcart.com/image/832/832/k7z3afk0/watch/t/c/x/lcs-8188-lois-caron-original-imafq3k9ztzdkyhe.jpeg?q=70',
      'https://rukminim1.flixcart.com/image/832/832/k48rwcw0/watch/t/c/x/lcs-8188-lois-caron-original-imafn749dvc3rtbr.jpeg?q=70',
      'https://rukminim1.flixcart.com/image/832/832/k48rwcw0/watch/t/c/x/lcs-8188-lois-caron-original-imafn749wtx62fjg.jpeg?q=70',
    ];

  

    // storeProducts.value = [
    //   StoreProduct("CONTINENTAL Malgudi 60 Degree Fresh Filter Coffee", "100", "82",
    //       "https://rukminim1.flixcart.com/image/280/280/l5jxt3k0/coffee/0/x/3/-original-imagg742vztkd82v.jpeg?q=70"),
    //   StoreProduct("Nescafe Classic Instant Coffee", "640", "524",
    //       "https://rukminim1.flixcart.com/image/280/280/kzzw5u80/coffee/s/b/x/-original-imagbwf3wvhzfh5z.jpeg?q=70"),
    //   StoreProduct("CONTINENTAL Xtra Instant Coffee", "150", "105",
    //       "https://rukminim1.flixcart.com/image/280/280/kp78e4w0/coffee/x/j/6/xtra-instant-coffee-glass-bottle-continental-original-imag3hzrxg7mwced.jpeg?q=70"),
    //   StoreProduct("Levista Strong Instant Coffee", "210", "88",
    //       "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/e/x/f/-original-imagg9qxwhstjynj.jpeg?q=70"),
    //   StoreProduct("Nescafe Gold Rich and Smooth Coffee Powder Glass Jar Instant Cof", "495", "381",
    //       "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/x/h/y/-original-imagkgfgbf6eszrr.jpeg?q=70"),
    // ];
  }

  getSpecificPRoductDetails(int product_id)async{
    await ApiController().getSpecificProductDetails(product_id).then((details) {
      specificProductDetails.add(details);
      print(' product data 1 or 0 ? : ${specificProductDetails[0].data!.length}');
    });
  }
}
