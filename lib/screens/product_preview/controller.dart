import 'package:e_plaza/modals/store_product.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/slide.dart';
import '../../modals/store_category.dart';
import '../../utils/helper.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  final RxList<StoreProduct> storeProducts = <StoreProduct>[].obs;
  final RxList<StoreProduct> storeProductsMain = <StoreProduct>[].obs;

  Rx<StoreCategory> selectedCategory = StoreCategory('id','Category', '').obs;
  TextEditingController categoryController = TextEditingController();

  Controller();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  List<Slide> slides = [
    Slide(
        'title', 'https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png'),
    Slide('title',
        'https://imgscf.slidemembers.com/docs/1/1/214/italian_food_-_free_presentation_template_213726.jpg'),
    Slide('title',
        'https://www.googleslidesthemes.com/images/f/o/o/d/-/food-burger-recipe-menu-google-slides-theme-slide-01-41a76612.webp'),
  ];

  void init() {
    storeProducts.value = [
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
      StoreProduct("Nescafe Classic Instant Coffee", "330", "296",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/8/4/j/-original-imaghvjchqfa6vwm.jpeg?q=70"),
      StoreProduct("Nescafe Sunrise Instant Coffee", "410", "373",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/r/z/u/-original-imagmnpsfgsbycbg.jpeg?q=70"),
      StoreProduct("Nescafe Classic Instant Coffee", "160", "147",
          "https://rukminim1.flixcart.com/image/280/280/kfvfwy80hlty2aw-0/coffee/n/c/j/50-classic-instant-coffee-pouch-1-nescafe-original-imafw8gk9qm7ayng.jpeg?q=70"),
      StoreProduct("Rejuve by Flipkart Fine Blend Instant Coffee", "90", "60",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/a/y/c/100-fine-blend-pouch-1-instant-coffee-rejuve-by-flipkart-original-imaghr9zazjcxzge.jpeg?q=70"),
      StoreProduct("Sunbean Beaten Caffe Powder Instant Coffee", "150", "117",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/n/3/r/120-beaten-caffe-powder-box-1-instant-coffee-sunbean-original-imagmhfjhwczsque.jpeg?q=70"),
      StoreProduct("Nescafe Classic Instant Coffee", "600", "546",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/y/r/n/-original-imaghb82vyhyyf2g.jpeg?q=70"),
      StoreProduct("Levista Premium Instant Coffee", "284", "119",
          "https://rukminim1.flixcart.com/image/280/280/k0o69ow0/coffee/t/h/d/100-premium-instant-coffee-tin-levista-original-imafke787c7qvzvb.jpeg?q=70"),
      StoreProduct("Tata Coffee Grand Classic, Strong Taste &amp; Rich Aroma, With F", "105", "84",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/v/1/r/-original-imagj87vscvzfhws.jpeg?q=70"),
      StoreProduct("Tata Coffee Grand Classic, Strong Taste &amp; Rich Aroma, With F", "210", "134",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/x/n/s/-original-imagj87vwwdd85dw.jpeg?q=70"),
      StoreProduct("Nescafe Sunrise Instant Coffee", "455", "414",
          "https://rukminim1.flixcart.com/image/280/280/l1whaq80/coffee/2/b/7/-original-imagdcxfb3vytduz.jpeg?q=70"),
      StoreProduct("CONTINENTAL Malgudi Filter Coffee", "285", "193",
          "https://rukminim1.flixcart.com/image/280/280/l27wtjk0/coffee/e/u/l/500-80-20-pouch-5-filter-coffee-continental-malgudi-original-imagdhw76nsahvmh.jpeg?q=70"),
      StoreProduct("Levista Premium Instant Coffee", "140", "58",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/z/k/k/-original-imagg9qxayydhggx.jpeg?q=70"),
      StoreProduct("Nescafe Classic Black Roast Instant Coffee", "360", "302",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/i/b/0/-original-imaggjp52mzam98m.jpeg?q=70"),
      StoreProduct("Nescafe Sunrise Instant Coffee", "425", "391",
          "https://rukminim1.flixcart.com/image/280/280/kzvlua80/coffee/y/i/i/-original-imagbsevftkdrd9s.jpeg?q=70"),
      StoreProduct("Tata Gold Instant Coffee", "475", "332",
          "https://rukminim1.flixcart.com/image/280/280/l2tcfbk0/coffee/a/j/a/100-100-pure-glass-bottle-1-instant-coffee-tata-coffee-original-image2kyc9byvmx5.jpeg?q=70"),
      StoreProduct("Tata Coffee Grand Premium | 100% Coffee Blend | With Flavour Loc", "290", "191",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/4/s/i/-original-imagh625hzdgjwu8.jpeg?q=70"),
      StoreProduct("CONTINENTAL Malgudi 80 Degree Fresh Filter Coffee", "125", "102",
          "https://rukminim1.flixcart.com/image/280/280/l5jxt3k0/coffee/8/a/f/-original-imagg742ykfghvg2.jpeg?q=70"),
      StoreProduct("Tata Cafe Specials Hazelnut 7 Sachets Instant Coffee", "209", "146",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/o/j/h/101-5-cafe-specials-deliciously-creamy-and-frothy-coffee-sachet-original-imagj8b7mdtmsfef.jpeg?q=70"),
      StoreProduct("Tata Coffee Grand Premium | 100% Coffee Blend | With Flavour Loc", "170", "110",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/v/y/i/-original-imagh6252knmv4sm.jpeg?q=70"),
      StoreProduct("Sleepy Owl Original Instant Coffee", "475", "356",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/g/n/m/100-original-tin-1-instant-coffee-sleepy-owl-original-imaggbym2bavduqv.jpeg?q=70"),
      StoreProduct("Nescafe Gold Blend Instant Coffee", "320", "275",
          "https://rukminim1.flixcart.com/image/280/280/l572ufk0/coffee/c/i/s/-original-imagfx6a2b6fmgj7.jpeg?q=70"),
      StoreProduct("Sleepy Owl Premium Instant Coffee", "475", "356",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/k/o/m/100-premium-tin-1-instant-coffee-sleepy-owl-original-imaggbyzrbzanpyy.jpeg?q=70"),
      StoreProduct("BRU Beaten Mix Instant Coffee", "375", "303",
          "https://rukminim1.flixcart.com/image/280/280/l58iaa80/coffee/r/c/e/180-beaten-mix-pouch-1-instant-coffee-bru-original-imagfyj76y4pvxdz.jpeg?q=70"),
      StoreProduct("Deccan Gold Premium Filter Coffee", "68", "58",
          "https://rukminim1.flixcart.com/image/280/280/kxtaxzk0/coffee/c/2/r/100-premium-filter-coffee-pouch-1-deccan-gold-original-imaga6rfzzc9vqat.jpeg?q=70"),
      StoreProduct("Nescafe Gold Blend Decaf Instant Coffee", "635", "546",
          "https://rukminim1.flixcart.com/image/280/280/k95yhzk0/coffee/q/v/q/100-gold-blend-imported-decaf-coffee-powder-roast-ground-coffee-original-imafry74vfvaf3zp.jpeg?q=70"),
      StoreProduct("TGL Co. Morning Motivation Instant Coffee Powder Freeze Dried fr", "539", "307",
          "https://rukminim1.flixcart.com/image/280/280/k1118cw0/coffee/u/h/e/100-morning-motivation-instant-coffee-powder-instant-coffee-original-imafkzu4kzz79bjx.jpeg?q=70"),
      StoreProduct("TGL Co. Euphoria Instant Coffee Powder | Makes Great Iced Coffee", "339", "288",
          "https://rukminim1.flixcart.com/image/280/280/kvba7bk0/coffee/t/2/n/100-euphoria-instant-coffee-powder-makes-great-iced-coffee-original-imag88jthhph89bb.jpeg?q=70"),
      StoreProduct("RAGE Irish Instant Coffee", "349", "279",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/y/q/g/50-barista-box-coffee-jar-hazelnut-50-gms-signature-mug-and-original-imaggkz5cqqqqkc5.jpeg?q=70"),
      StoreProduct("Sleepy Owl Assorted Cold Brew Packs (Set of 5) Roast &amp; Groun", "575", "356",
          "https://rukminim1.flixcart.com/image/280/280/l23mhzk0/coffee/6/1/j/250-assorted-cold-brew-packs-set-of-5-box-5-roast-ground-coffee-original-imagdgydryrdy3sy.jpeg?q=70"),
      StoreProduct("TGL Co. Signature Filter Instant Coffee Powder Instant Coffee", "299", "254",
          "https://rukminim1.flixcart.com/image/280/280/k186fm80/coffee/c/r/k/100-signature-filter-instant-coffee-powder-instant-coffee-glass-original-imafkttfszreaxgz.jpeg?q=70"),
      StoreProduct("RAGE Creme Instant Coffee", "349", "279",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/j/f/e/50-gift-box-of-4-flavours-instant-coffee-4-x-50-g-glass-bottle-4-original-imaggh26z9ryefy8.jpeg?q=70"),
      StoreProduct("RAGE Instant Coffee", "349", "279",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/k/5/f/50-gift-box-of-4-flavours-instant-coffee-4-x-50-g-glass-bottle-4-original-imaggh263yqu8euh.jpeg?q=70"),
      StoreProduct("Levista Classic Instant Coffee", "680", "374",
          "https://rukminim1.flixcart.com/image/280/280/xif0q/coffee/e/2/5/-original-imagg9qxzgn2rcyh.jpeg?q=70"),
      StoreProduct("Sleepy Owl Cold Brew Coffee", "975", "604",
          "https://rukminim1.flixcart.com/image/280/280/kp2y2kw0/fmcg-combo/i/q/4/gift-box-cold-brew-assorted-sleepy-owl-original-imag3e7fzmvgsxkv.jpeg?q=70"),
    ];
    storeProducts.shuffle();
    storeProductsMain.addAll(storeProducts);
  }

  // RxList<StoreCategory> storeCategories = <StoreCategory>[
  //   StoreCategory('Daily Need',
  //       'http://www.eplaza.in/wp-content/uploads/2022/12/c94df51e52985b4e79b74a63f9780441-1-150x150.jpg'),
  //   StoreCategory('Kirana',
  //       'http://www.eplaza.in/wp-content/uploads/2022/07/photo-1604719312566-8912e9227c6a-300x300.jpg'),
  //   StoreCategory('Fast Food', 'http://www.eplaza.in/wp-content/uploads/2022/12/ff-2-300x300.jpg'),
  //   StoreCategory('Fashion',
  //       'http://www.eplaza.in/wp-content/uploads/2022/12/a4016739adede59c5d67cb39b2ecbbf7-300x300.jpg'),
  //   StoreCategory('Medical',
  //       'http://www.eplaza.in/wp-content/uploads/2022/12/af093a28f0e430d4bb57c7e75d974bc5-150x150.jpg'),
  //   StoreCategory('Furniture',
  //       'http://www.eplaza.in/wp-content/uploads/2022/12/24d2f207d099930d69d5379b884c40cc-150x150.jpg'),
  //   StoreCategory('Mobile', 'http://www.eplaza.in/wp-content/uploads/2022/06/COMPUTER.jpg'),
  //   StoreCategory('Gift Store',
  //       'http://www.eplaza.in/wp-content/uploads/2022/07/Waste-management-in-beauty-can-be-improved-if-brands-add-value-and-step-up-communication-says-Certified-Sustainable-300x300.jpg'),
  // ].obs;

  void filterList(String keyword) {
    storeProducts.clear();

    if (!Helper.isEmpty(keyword)) {
      storeProducts.addAll(storeProductsMain
          .where((e) => Helper.isContainKeyword(keyword, [e.title.nullSafe, e.price]))
          .toList());
    } else {
      storeProducts.addAll(storeProductsMain);
    }
  }
}
