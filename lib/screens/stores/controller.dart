import 'package:e_plaza/modals/category_shop_model.dart';
import 'package:e_plaza/modals/categoty_product_model.dart';
import 'package:e_plaza/modals/store_category.dart';
import 'package:e_plaza/modals/subcatmodel.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../apiHandler/api_controller.dart';
import '../../helper/navigator_key.dart';
import '../../modals/slide.dart';
import '../../utils/app_util.dart';

class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;

  final RxList<StoreCategory> shops = <StoreCategory>[].obs;
  final RxList<StoreCategory> shopsMain = <StoreCategory>[].obs;
  final RxList<CatAllProductDetailsModel> catproducts = <CatAllProductDetailsModel>[].obs;
  final RxList<SubCategoryModel> _subcatmodel = <SubCategoryModel>[].obs;

  final RxList<CategoryShopModel> catshopmodel = <CategoryShopModel>[].obs;
  


  final RxString selectedCategory = 'Category'.obs;

  Controller();

  // List<Slide> slides = [
  //   Slide(
  //       'title', 'https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png'),
  //   Slide('title',
  //       'https://imgscf.slidemembers.com/docs/1/1/214/italian_food_-_free_presentation_template_213726.jpg'),
  //   Slide('title',
  //       'https://www.googleslidesthemes.com/images/f/o/o/d/-/food-burger-recipe-menu-google-slides-theme-slide-01-41a76612.webp'),
  // ];
  //
  List<StoreCategory> storeCategories = [
    StoreCategory('1','Daily Need',
        'http://www.eplaza.in/wp-content/uploads/2022/12/c94df51e52985b4e79b74a63f9780441-1-150x150.jpg'),
    StoreCategory('2','Kirana',
        'http://www.eplaza.in/wp-content/uploads/2022/07/photo-1604719312566-8912e9227c6a-300x300.jpg'),
    StoreCategory('3','Fast Food', 'http://www.eplaza.in/wp-content/uploads/2022/12/ff-2-300x300.jpg'),
    StoreCategory('8','Fashion',
        'http://www.eplaza.in/wp-content/uploads/2022/12/a4016739adede59c5d67cb39b2ecbbf7-300x300.jpg'),
    StoreCategory('4','Medical',
        'http://www.eplaza.in/wp-content/uploads/2022/12/af093a28f0e430d4bb57c7e75d974bc5-150x150.jpg'),
    StoreCategory('5','Furniture',
        'http://www.eplaza.in/wp-content/uploads/2022/12/24d2f207d099930d69d5379b884c40cc-150x150.jpg'),
    StoreCategory('6','Mobile', 'http://www.eplaza.in/wp-content/uploads/2022/06/COMPUTER.jpg'),
    StoreCategory('7','Gift Store',
        'http://www.eplaza.in/wp-content/uploads/2022/07/Waste-management-in-beauty-can-be-improved-if-brands-add-value-and-step-up-communication-says-Certified-Sustainable-300x300.jpg'),
  ];

  @override
  void onInit() {
    // init();
    super.onInit();
  }

  // void init() {
  //   shops.add(StoreCategory('Arhat Bazar', 'https://firebasestorage.googleapis.com/v0/b/scale-xyz-pro.appspot.com/o/WhatsApp%20Image%202023-04-02%20at%205.27.16%20PM.jpeg?alt=media&token=56039afc-2b95-48de-9299-59ba31a4ef3f'));
  //   shops.add(StoreCategory('Pacific Mall', 'https://firebasestorage.googleapis.com/v0/b/scale-xyz-pro.appspot.com/o/WhatsApp%20Image%202023-04-02%20at%205.28.48%20PM.jpeg?alt=media&token=1a9e2636-1d3e-4d2f-a614-04662e1376df'));
  //   shops.add(StoreCategory('Paltan Bazaar', 'https://cdn.pixabay.com/photo/2016/03/02/20/13/grocery-1232944__340.jpg'));
  //   shops.add(StoreCategory('Tibetan Market', 'https://media.istockphoto.com/id/455198283/photo/grocery-store.jpg?s=612x612&w=0&k=20&c=SlLOSnynnnDnBqTDj-QpWIvkYGnhTaHvKljyVUS4roE='));
  //   shops.add(StoreCategory('Rajpur Road', 'https://www.gannett-cdn.com/presto/2022/11/08/NPPP/37c6403b-bcd3-41fc-8cea-1e5660c0d8c5-josephs4.jpg'));
  //   shops.add(StoreCategory('Astley Hall', 'https://www.gannett-cdn.com/presto/2022/11/08/NPPP/37c6403b-bcd3-41fc-8cea-1e5660c0d8c5-josephs4.jpg'));
  //   shopsMain.addAll(shops);
  // }

  void fetchSubcategoryRequest(BuildContext context) {
    AppUtil.checkInternet().then((value) {
      if (value) {
        EasyLoading.show(status: LocalizationString.loading);
        ApiController().getSubCategories(2).then((response) async {
          if (response.success!) {
            EasyLoading.dismiss();

            showSuccessMessage("getsubcatRequest_success",context);

            if (response.data != null) {
              for (var data in response.data!) {
                // Create a new SubCategoryModel instance and add it to the list
                SubCategoryModel _subcategories = SubCategoryModel(
                  data: [data],
                  success: true,
                );
                _subcatmodel.add(_subcategories);
              }
            }

            print("getsubcatRequest_success  "+"success");

          } else {
            EasyLoading.dismiss();

            showErrorMessage(response.success! as String,context);

            print("getsubcatRequest_error "+response.success.toString());

          }
        });
      } else {
        showErrorMessage(LocalizationString.noInternet, context);
      }
    });
  }


  void getCategoryShops(BuildContext context,int cat_id) {
    print("getCategeryShopsRequest");
    AppUtil.checkInternet().then((value) {
      if (value) {
        print(value);
        EasyLoading.show(status: LocalizationString.loading);
        ApiController().getCategoryShops(cat_id).then((response) async {
          print('response is : ${response.success}');
          
          if (response.success!) {
            EasyLoading.dismiss();

            print(response.success);

            // showSuccessMessage("getCategeryShopsRequest_success",context);

            print("getCategeryShopsRequest_success  "+"success");

            for (var data in response.data!) {
              print('data is ');
              print(data.id);
              CategoryShopModel categoryShopModel = CategoryShopModel.fromJson({
                "data": [
                  {
                    'id': data.id, 
                    'vendor_id': data.vendorId, 
                    'shop_name': data.shopName, 
                    'shop_description': data.shopDescription, 
                    'city': data.city, 
                    'address': data.address, 
                    'image_1': data.image1, 
                    'image_2': data.image2, 
                    'aadhar_card_number': data.aadharCardNumber, 
                    'aadhar_image': data.aadharImage, 
                    'business_type': data.businessType, 
                    'turn_over': data.turnOver, 
                    'is_grahudhyog': data.isGrahudhyog, 
                    'is_popular': data.isPopular, 
                    'createdAt': data.createdAt, 
                    'updatedAt': data.updatedAt
                    }
                ],  // Wrap the data in a map as expected by CatProductModel
                "success": true  // Assuming success is always true in this context
              });
              catshopmodel.add(categoryShopModel);


            }


          } else {

            EasyLoading.dismiss();

            showErrorMessage(response.success!.toString(),context);

            print("checkPhoneRequest_error "+response.success.toString());

          }
        });
      } else {
        showErrorMessage(LocalizationString.noInternet, context);
      }
    });
  }

  void getCategeryProductDetailsRequest(BuildContext context) {
    AppUtil.checkInternet().then((value) {
      if (value) {
        EasyLoading.show(status: LocalizationString.loading);
        ApiController().getCategoryProducts(22).then((response) async {
          if (response.success!) {
            EasyLoading.dismiss();

            showSuccessMessage("getCategeryProductDetailsRequest_success",context);

            if (response.data != null) {
              for (var data in response.data!) {
                CatAllProductDetailsModel adsBanner = CatAllProductDetailsModel.fromJson({
                  "data": [data],  // Wrap the data in a map as expected by CatProductModel
                  "success": true  // Assuming success is always true in this context
                });
                catproducts.add(adsBanner);
              }
            }

            print("checkAdsBannerRequest_success  "+"success");

          } else {
            EasyLoading.dismiss();

            showErrorMessage(response.success! as String,context);

            print("checkPhoneRequest_error "+response.success.toString());

          }
        });
      } else {
        showErrorMessage(LocalizationString.noInternet, context);
      }
    });
  }

  


  showSuccessMessage(String message, BuildContext context) {
    AppUtil.showToast(context: context, message: message, isSuccess: true);
  }

  showErrorMessage(String message, BuildContext context) {
    AppUtil.showToast(context: context, message: message, isSuccess: false);
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
