import 'package:e_plaza/modals/store_category.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  final RxList<StoreCategory> shops = <StoreCategory>[].obs;
  final RxList<StoreCategory> shopsMain = <StoreCategory>[].obs;
  final RxString selectedCategory = 'Category'.obs;

  Controller();

  List<StoreCategory> storeCategories = [
    StoreCategory('','Daily Need',
        'http://www.eplaza.in/wp-content/uploads/2022/12/c94df51e52985b4e79b74a63f9780441-1-150x150.jpg'),
    StoreCategory('','Kirana / Supermarket',
        'http://www.eplaza.in/wp-content/uploads/2022/07/photo-1604719312566-8912e9227c6a-300x300.jpg'),
    StoreCategory('','Tea, Cafe & Fast Food',
        'http://www.eplaza.in/wp-content/uploads/2022/12/ff-2-300x300.jpg'),
    StoreCategory('','Fashion',
        'http://www.eplaza.in/wp-content/uploads/2022/12/a4016739adede59c5d67cb39b2ecbbf7-300x300.jpg'),
    StoreCategory('','Medical & pharmacy',
        'http://www.eplaza.in/wp-content/uploads/2022/12/af093a28f0e430d4bb57c7e75d974bc5-150x150.jpg'),
    StoreCategory('','Furniture',
        'http://www.eplaza.in/wp-content/uploads/2022/12/24d2f207d099930d69d5379b884c40cc-150x150.jpg'),
    StoreCategory(
      '',
        'Mobile Computers', 'http://www.eplaza.in/wp-content/uploads/2022/06/COMPUTER.jpg'),
    StoreCategory('','Fancy & Gift Store',
        'http://www.eplaza.in/wp-content/uploads/2022/07/Waste-management-in-beauty-can-be-improved-if-brands-add-value-and-step-up-communication-says-Certified-Sustainable-300x300.jpg'),
  ];

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    shops.add(StoreCategory('','Paltan Bazaar',
        'http://www.eplaza.in/wp-content/uploads/2022/12/c94df51e52985b4e79b74a63f9780441-1-150x150.jpg'));
    shops.add(StoreCategory('','Tibetan Market',
        'http://www.eplaza.in/wp-content/uploads/2022/07/photo-1604719312566-8912e9227c6a-300x300.jpg'));
    shops.add(StoreCategory(
      '',
        'Rajpur Road', 'http://www.eplaza.in/wp-content/uploads/2022/12/ff-2-300x300.jpg'));
    shops.add(StoreCategory('','Astley Hall',
        'http://www.eplaza.in/wp-content/uploads/2022/12/a4016739adede59c5d67cb39b2ecbbf7-300x300.jpg'));
    shops.add(StoreCategory('','Indira Market',
        'http://www.eplaza.in/wp-content/uploads/2022/12/af093a28f0e430d4bb57c7e75d974bc5-150x150.jpg'));
    shops.add(StoreCategory('','Connaught Place',
        'http://www.eplaza.in/wp-content/uploads/2022/12/24d2f207d099930d69d5379b884c40cc-150x150.jpg'));
    shops.add(StoreCategory(
      '',
        'Arhat Bazar', 'http://www.eplaza.in/wp-content/uploads/2022/06/COMPUTER.jpg'));
    shops.add(StoreCategory('','Pacific Mall',
        'http://www.eplaza.in/wp-content/uploads/2022/07/Waste-management-in-beauty-can-be-improved-if-brands-add-value-and-step-up-communication-says-Certified-Sustainable-300x300.jpg'));

    shopsMain.addAll(shops);
  }


  void filterList(String keyword) {
    shops.clear();

    if (!Helper.isEmpty(keyword)) {
      shops.addAll(shopsMain
          .where((e) => Helper.isContainKeyword(keyword, [e.title.nullSafe]))
          .toList());
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
