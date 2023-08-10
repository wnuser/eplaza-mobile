import 'package:e_plaza/modals/store_category.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:get/get.dart';

import '../../modals/slide.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  final RxList<StoreCategory> shops = <StoreCategory>[].obs;
  final RxList<StoreCategory> shopsMain = <StoreCategory>[].obs;
  final RxString selectedCategory = 'Category'.obs;

  Controller();

  List<Slide> slides = [
    Slide(
        'title', 'https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png'),
    Slide('title',
        'https://imgscf.slidemembers.com/docs/1/1/214/italian_food_-_free_presentation_template_213726.jpg'),
    Slide('title',
        'https://www.googleslidesthemes.com/images/f/o/o/d/-/food-burger-recipe-menu-google-slides-theme-slide-01-41a76612.webp'),
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
    StoreCategory('Furniture',
        'http://www.eplaza.in/wp-content/uploads/2022/12/24d2f207d099930d69d5379b884c40cc-150x150.jpg'),
    StoreCategory('Mobile', 'http://www.eplaza.in/wp-content/uploads/2022/06/COMPUTER.jpg'),
    StoreCategory('Gift Store',
        'http://www.eplaza.in/wp-content/uploads/2022/07/Waste-management-in-beauty-can-be-improved-if-brands-add-value-and-step-up-communication-says-Certified-Sustainable-300x300.jpg'),
  ];

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    shops.add(StoreCategory('Arhat Bazar', 'https://firebasestorage.googleapis.com/v0/b/scale-xyz-pro.appspot.com/o/WhatsApp%20Image%202023-04-02%20at%205.27.16%20PM.jpeg?alt=media&token=56039afc-2b95-48de-9299-59ba31a4ef3f'));
    shops.add(StoreCategory('Pacific Mall', 'https://firebasestorage.googleapis.com/v0/b/scale-xyz-pro.appspot.com/o/WhatsApp%20Image%202023-04-02%20at%205.28.48%20PM.jpeg?alt=media&token=1a9e2636-1d3e-4d2f-a614-04662e1376df'));
    shops.add(StoreCategory('Paltan Bazaar', 'https://cdn.pixabay.com/photo/2016/03/02/20/13/grocery-1232944__340.jpg'));
    shops.add(StoreCategory('Tibetan Market', 'https://media.istockphoto.com/id/455198283/photo/grocery-store.jpg?s=612x612&w=0&k=20&c=SlLOSnynnnDnBqTDj-QpWIvkYGnhTaHvKljyVUS4roE='));
    shops.add(StoreCategory('Rajpur Road', 'https://www.gannett-cdn.com/presto/2022/11/08/NPPP/37c6403b-bcd3-41fc-8cea-1e5660c0d8c5-josephs4.jpg'));
    shops.add(StoreCategory('Astley Hall', 'https://www.gannett-cdn.com/presto/2022/11/08/NPPP/37c6403b-bcd3-41fc-8cea-1e5660c0d8c5-josephs4.jpg'));
    shopsMain.addAll(shops);
  }

  void filterList(String keyword) {
    shops.clear();

    if (!Helper.isEmpty(keyword)) {
      shops.addAll(
          shopsMain.where((e) => Helper.isContainKeyword(keyword, [e.title.nullSafe])).toList());
    } else {
      shops.addAll(shopsMain);
    }
  }

  void sort(int sortBy) {
    switch (sortBy) {
      case Sort.NEWEST:
        // if (isSearch) {
        //   services.sort((a, b) =>
        //       Helper.convertToMillis(b.dateTime).compareTo(Helper.convertToMillis(a.dateTime)));
        //   services.refresh();
        // } else {
        //   fetchServices(subCategory, clearData: true);
        // }
        break;
      case Sort.OLDEST:
        // if (isSearch) {
        //   services.sort((a, b) =>
        //       Helper.convertToMillis(b.dateTime).compareTo(Helper.convertToMillis(a.dateTime)));
        //   services.refresh();
        // } else {
        //   fetchServices(subCategory, clearData: true);
        // }
        break;

      case Sort.A_TO_Z:
        shops.sort((a, b) => a.title.nullSafe.compareTo(b.title.nullSafe));
        shops.refresh();
        break;

      case Sort.Z_TO_A:
        shops.sort((a, b) => b.title.nullSafe.compareTo(a.title.nullSafe));
        shops.refresh();
        break;

      case Sort.RATING_HIGH_TO_LOW:
        // services.sort(
        //         (a, b) => Helper.parseDouble(b.avgRating).compareTo(Helper.parseDouble(a.avgRating)));
        // services.refresh();
        break;

      case Sort.RATING_LOW_TO_HIGH:
        // services.sort(
        //         (a, b) => Helper.parseDouble(a.avgRating).compareTo(Helper.parseDouble(b.avgRating)));
        // services.refresh();
        break;
    }
  }
}
