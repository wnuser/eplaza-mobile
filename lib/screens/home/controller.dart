import 'dart:convert';

import 'package:e_plaza/modals/LatestProduct.dart';
import 'package:e_plaza/modals/ads_banner_model.dart';
import 'package:e_plaza/modals/latest%20_product_model.dart';
import 'package:e_plaza/modals/offerproducts.dart';
import 'package:e_plaza/modals/product.dart';
import 'package:e_plaza/modals/randomproductmodel.dart';
import 'package:e_plaza/modals/slide.dart';
import 'package:e_plaza/modals/store_category.dart';
import 'package:e_plaza/screens/home/components/offer_products/offer_products.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../apiHandler/api_controller.dart';
import '../../apiHandler/api_param_model.dart';
import '../../apiHandler/network_constant.dart';
import '../../helper/navigator_key.dart';
import '../../modals/category.dart';
import '../../modals/gmart_cat_model.dart';
import '../../modals/home_slider_model.dart';
import '../../modals/home_main_category_model.dart';
import '../../modals/offer_discount_product_model.dart';
import '../../utils/app_util.dart';
import '../../utils/shared_prefs.dart';
import 'package:http/http.dart' as http;



class Controller extends GetxController {
  RxString status = Status.PROGRESS.obs;
  RxList<HomeMainCategoriesModel> home_main_categories_model = <HomeMainCategoriesModel>[].obs;
  RxList<HomeMainCategoriesModel> home_gmart_categories_model = <HomeMainCategoriesModel>[].obs;
  RxList<LatestProductModel> latest_product_model = <LatestProductModel>[].obs;
  RxList<OfferDiscountProductModel> offer_product_model = <OfferDiscountProductModel>[].obs;

  RxList<LatestProduct> ltst_product_model = <LatestProduct>[].obs;
  RxList<OfferProductsModel> offer_products_model = <OfferProductsModel>[].obs;

  RxList<RandomProductsModel> random_products_model = <RandomProductsModel>[].obs;



  RxList<HomeSliderMainModel> home_slider = <HomeSliderMainModel>[].obs;
  RxList<AdsBannerModel> home_ads_slider = <AdsBannerModel>[].obs;

  var discountUpto = 0.obs;


  // RxList<Category> home_category_model = <Category>[].obs;


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // List<Category> categories = [
  //   Category(
  //       'Grocery','https://rukminim1.flixcart.com/flap/128/128/image/29327f40e9c4d26b.png?q=100'),
  // ];

  List<Category> categories = [];
  // List<Slide> slides = [];

  List<Slide> slides = [
    Slide(
        'title', 'https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-modern-double-color-futuristic-neon-background-image_351866.jpg'),
    // Slide('title',
    //     'https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-modern-double-color-futuristic-neon-background-image_351866.jpg'),
    // Slide('title',
    //     'https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-modern-double-color-futuristic-neon-background-image_351866.jpg'),
  ];

  // List<Hom> homeBannerList = [];


  // Future<void> getAllCategories({int? categoryId}) async {
  //
  //   final url = Uri.parse(NetworkConstantsUtil.allcategories);
  //   final headers = {'Content-Type': 'application/json'};
  //   // final body = jsonEncode({'uid':user_id,'cat_id': "1"});
  //
  //   final response = await http.post(url, headers: headers);
  //
  //   final jsonData = jsonDecode(response.body);
  //
  //   if (jsonData['success'] == true) {
  //     jsonData['data'].forEach((data) {
  //       HomeMainCategoriesModel games_clubs_list = HomeMainCategoriesModel.fromJson(data);
  //       home_main_categories_model.add(games_clubs_list);
  //     });
  //   }
  //   return jsonDecode(response.body) ;
  // }



  void getAllCategories(BuildContext context) {
    AppUtil.checkInternet().then((value) {
      if (value) {
        EasyLoading.show(status: LocalizationString.loading);
        ApiController().getHomeCategories().then((response) async {
          if (response.success!) {
            EasyLoading.dismiss();

            // showSuccessMessage(response.message!,context);
            // Clear the existing data in the list
            home_main_categories_model.clear();

            if (response.data != null) {

              for (var category in response.data!) {
                print("category_name"+category.name!+"   category_image:-  "+NetworkConstantsUtil.cat_img_path+category.mainBanner!);
                // categories.add(Category(category.name, "https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png"));
                HomeMainCategoriesModel home_categories = HomeMainCategoriesModel.fromJson({
                  'data': [category.toJson()], // Wrap the Data object in a list
                  'message': response.message,
                  'success': response.success,
                });
                home_main_categories_model.add(home_categories);
              }
            }

            print("categoryRequest_success  "+response.message!);

          } else {
            EasyLoading.dismiss();

            showErrorMessage(response.message!,context);

            print("categoryRequest_error "+response.message!);

          }
        });
      } else {
        showErrorMessage(LocalizationString.noInternet, context);
      }
    });
  }



  void getGmartCategories(BuildContext context) {
    AppUtil.checkInternet().then((value) {
      if (value) {
        EasyLoading.show(status: LocalizationString.loading);
        ApiController().getHomeGmartCategories().then((response) async {
          if (response.success!) {
            EasyLoading.dismiss();

            // showSuccessMessage(response.message!,context);
            // Clear the existing data in the list
            home_gmart_categories_model.clear();

            if (response.data != null) {

              for (var category in response.data!) {
                print("category_name"+category.name!+"   category_image:-  "+NetworkConstantsUtil.cat_img_path+category.mainBanner!);
                // categories.add(Category(category.name, "https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png"));
                GmartCatModel gmart_categories = GmartCatModel.fromJson({
                  'data': [category.toJson()], // Wrap the Data object in a list
                  'message': response.message,
                  'success': response.success,
                });
                home_gmart_categories_model.add(gmart_categories as HomeMainCategoriesModel);
              }
            }

            print("categoryRequest_success  "+response.message!);

          } else {
            EasyLoading.dismiss();

            showErrorMessage(response.message!,context);

            print("categoryRequest_error "+response.message!);

          }
        });
      } else {
        showErrorMessage(LocalizationString.noInternet, context);
      }
    });
  }

  void getLatestProducts(BuildContext context) {
    AppUtil.checkInternet().then((value) {
      if (value) {
        EasyLoading.show(status: LocalizationString.loading);
        ApiController().getHomeLatestProducts().then((response) async {
          if (response.success!) {
            EasyLoading.dismiss();

            // showSuccessMessage(response.message!,context);
            // Clear the existing data in the list
            ltst_product_model.clear();

            if (response.data != null) {

              for (var products in response.data!) {
                print(products);
                print("latestproducts_name"+products.name!+"   latestproducts_image:-  "+NetworkConstantsUtil.cat_img_path+products.image1!);
                // categories.add(Category(category.name, "https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png"));
                LatestProduct latestProducts = LatestProduct.fromJson({
                  "id":  products.id,
                  "category_id": products.categoryId,
                  "sub_category_id": products.subCategoryId,
                  "shop_id": products.shopId,
                  "name": products.name,
                  "price": products.price,
                  "offer_price": products.offerPrice,
                  "offer_percentage": products.offerPercentage,
                  "stock_quantity": products.stockQuantity,
                  "description": "Test description",
                  "shipping_policy": 1,
                  "refund_policy": "standud 7 days",
                  "is_cancel_enabled": 1,
                  "is_return_enabled": 1,
                  "is_exchange_enabled": 1,
                  "image_1": "1696236769475-user.png",
                  "image_2": "1696236769475-userII.png",
                  "image_3": "1696236769475-userIcon.jpeg",
                  "createdAt": "2023-10-02T08:52:49.000Z",
                  "updatedAt": "2023-10-02T08:52:49.000Z"
                  // Map other properties...
                });
                ltst_product_model.add(latestProducts);
              }
            }

            print("latestProductRequest_success  "+response.message!);

          } else {
            EasyLoading.dismiss();

            showErrorMessage(response.message!,context);

            print("latestProductRequest_error "+response.message!);

          }
        });
      } else {
        showErrorMessage(LocalizationString.noInternet, context);
      }
    });
  }

  void getOfferProducts(BuildContext context) {
    AppUtil.checkInternet().then((value) {
      if (value) {
        EasyLoading.show(status: LocalizationString.loading);
        ApiController().getOfferDiscounntProduct().then((response) async {
          if (response != null) {

            EasyLoading.dismiss();

            // showSuccessMessage(response.message!,context);
            // Clear the existing data in the list
            offer_products_model.clear();

            if (response.data != null) {

              discountUpto.value =response.upto!;

              for (var products in response.data!) {
                print("offer_product_name"+products.name!+"   offer_product_image:-  "+NetworkConstantsUtil.cat_img_path+products.image1!);
                // categories.add(Category(category.name, "https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png"));
                OfferProductsModel offer_products = OfferProductsModel.fromJson({
                  "id": products.id,
                  "category_id": products.categoryId,
                  "sub_category_id": products.subCategoryId,
                  "shop_id": products.shopId,
                  "name": products.name,
                  "price": products.price,
                  "offer_price": products.offerPrice,
                  "offer_percentage": products.offerPercentage,
                  "stock_quantity": products.stockQuantity,
                  "description": products.description,
                  "shipping_policy":products.shippingPolicy ,
                  "refund_policy": products.refundPolicy,
                  "is_cancel_enabled": products.isCancelEnabled,
                  "is_return_enabled": products.isReturnEnabled,
                  "is_exchange_enabled": products.isCancelEnabled,
                  "image_1": products.image1,
                  "image_2": products.image2,
                  "image_3": products.image3,
                  "createdAt": products.createdAt,
                  "updatedAt": products.updatedAt
                });
                offer_products_model.add(offer_products);
              }
            }

            print("offer_productsRequest_success  "+response.message!);

          } else {
            EasyLoading.dismiss();

            showErrorMessage(response.message!,context);

            print("offer_productsRequest_error "+response.message!);

          }
        });
      } else {
        showErrorMessage(LocalizationString.noInternet, context);
      }
    });
  }
  void getOfferRandomProducts(BuildContext context) {
    AppUtil.checkInternet().then((value) {
      if (value) {
        EasyLoading.show(status: LocalizationString.loading);
        ApiController().getOfferRandomProduct().then((response) async {
          if (response != null) {

            EasyLoading.dismiss();

            // showSuccessMessage(response.message!,context);
            // Clear the existing data in the list
            random_products_model.clear();

            if (response.data != null) {

              // discountUpto.value =response.upto!;

              for (var products in response.data!) {
                print("random_product_name"+products.name!+"   random_product_image:-  "+NetworkConstantsUtil.cat_img_path+products.image1!);
                // categories.add(Category(category.name, "https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png"));
                RandomProductsModel random_products = RandomProductsModel.fromJson({
                  "id": products.id,
                  "category_id": products.categoryId,
                  "sub_category_id": products.subCategoryId,
                  "shop_id": products.shopId,
                  "name": products.name,
                  "price": products.price,
                  "offer_price": products.offerPrice,
                  "offer_percentage": products.offerPercentage,
                  "stock_quantity": products.stockQuantity,
                  "description": products.description,
                  "shipping_policy":products.shippingPolicy ,
                  "refund_policy": products.refundPolicy,
                  "is_cancel_enabled": products.isCancelEnabled,
                  "is_return_enabled": products.isReturnEnabled,
                  "is_exchange_enabled": products.isCancelEnabled,
                  "image_1": products.image1,
                  "image_2": products.image2,
                  "image_3": products.image3,
                  "createdAt": products.createdAt,
                  "updatedAt": products.updatedAt
                });
                random_products_model.add(random_products);
              }
            }

            print("random_productsRequest_success  "+response.message!);

          } else {
            EasyLoading.dismiss();

            showErrorMessage(response.message!,context);

            print("random_productsRequest_error "+response.message!);

          }
        });
      } else {
        showErrorMessage(LocalizationString.noInternet, context);
      }
    });
  }



  void getBannerRequest(BuildContext context) {
      AppUtil.checkInternet().then((value) {
        if (value) {
          EasyLoading.show(status: LocalizationString.loading);
          ApiController().getHomeMainBanners().then((response) async {
            if (response.success!) {
              EasyLoading.dismiss();

              // showSuccessMessage(response.message!,context);

              if (response.data != null) {
                for (var banner in response.data!) {
                  print("banner_title"+banner.title!+"   banner_image:-  "+NetworkConstantsUtil.home_banner_img_path+banner.bannerImage!);
                  HomeSliderMainModel sliders = HomeSliderMainModel.fromJson({
                    'data': [banner.toJson()], // Wrap the Data object in a list
                    'message': response.message,
                    'success': response.success,
                  });
                  home_slider.add(sliders);                }
              }

              print("checkPhoneRequest_success  "+response.message!);

            } else {
              EasyLoading.dismiss();

              showErrorMessage(response.message!,context);

              print("checkPhoneRequest_error "+response.message!);

            }
          });
        } else {
          showErrorMessage(LocalizationString.noInternet, context);
        }
      });
  }


  void getAdsBannerRequest(BuildContext context) {
    AppUtil.checkInternet().then((value) {
      if (value) {
        EasyLoading.show(status: LocalizationString.loading);
        ApiController().getAdsBanners().then((response) async {
          if (response.success!) {
            EasyLoading.dismiss();

            // showSuccessMessage("success",context);

            if (response.data != null) {
              for (var banner in response.data!) {
                // print("banner_title"+banner.bannerTitle!+"   banner_image:-  "+NetworkConstantsUtil.home_banner_img_path+banner.bannerImage!);
                AdsBannerModel ads_banner = AdsBannerModel.fromJson({
                  'data': [banner.toJson()], // Wrap the Data object in a list
                  'success': response.success,
                });
                home_ads_slider.add(ads_banner);                }
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

  // List<StoreCategory> storeCategories = [
  //   StoreCategory('Daily Need',
  //       'http://www.eplaza.in/wp-content/uploads/2022/12/c94df51e52985b4e79b74a63f9780441-1-150x150.jpg'),
  //   StoreCategory('Kirana',
  //       'http://www.eplaza.in/wp-content/uploads/2022/07/photo-1604719312566-8912e9227c6a-300x300.jpg'),
  //   StoreCategory('Fast Food', 'http://www.eplaza.in/wp-content/uploads/2022/12/ff-2-300x300.jpg'),
  //   StoreCategory('Fashion',
  //       'http://www.eplaza.in/wp-content/uploads/2022/12/a4016739adede59c5d67cb39b2ecbbf7-300x300.jpg'),
  //   StoreCategory('Medical',
  //       'http://www.eplaza.in/wp-content/uploads/2022/12/af093a28f0e430d4bb57c7e75d974bc5-150x150.jpg'),
  //   StoreCategory('Kirana',
  //       'http://www.eplaza.in/wp-content/uploads/2022/07/photo-1604719312566-8912e9227c6a-300x300.jpg'),
  //   StoreCategory('Furniture',
  //       'http://www.eplaza.in/wp-content/uploads/2022/12/24d2f207d099930d69d5379b884c40cc-150x150.jpg'),
  //   StoreCategory('Mobile', 'http://www.eplaza.in/wp-content/uploads/2022/06/COMPUTER.jpg'),
  //   StoreCategory('Gift Store',
  //       'http://www.eplaza.in/wp-content/uploads/2022/07/Waste-management-in-beauty-can-be-improved-if-brands-add-value-and-step-up-communication-says-Certified-Sustainable-300x300.jpg'),
  //   StoreCategory('Medical',
  //       'http://www.eplaza.in/wp-content/uploads/2022/12/af093a28f0e430d4bb57c7e75d974bc5-150x150.jpg'),
  // ];

  // List<StoreCategory> garamMartCategories = [
  //   StoreCategory('Furniture',
  //       'http://www.eplaza.in/wp-content/uploads/2022/12/24d2f207d099930d69d5379b884c40cc-150x150.jpg'),
  //   StoreCategory('Mobile', 'http://www.eplaza.in/wp-content/uploads/2022/06/COMPUTER.jpg'),
  //   StoreCategory('Gift Store',
  //       'http://www.eplaza.in/wp-content/uploads/2022/07/Waste-management-in-beauty-can-be-improved-if-brands-add-value-and-step-up-communication-says-Certified-Sustainable-300x300.jpg'),
  //   StoreCategory('Medical',
  //       'http://www.eplaza.in/wp-content/uploads/2022/12/af093a28f0e430d4bb57c7e75d974bc5-150x150.jpg'),
  //   StoreCategory('Gift Store',
  //       'http://www.eplaza.in/wp-content/uploads/2022/07/Waste-management-in-beauty-can-be-improved-if-brands-add-value-and-step-up-communication-says-Certified-Sustainable-300x300.jpg'),
  // ];

  // List<Slide> slides = [
  //   Slide(
  //       'title', 'https://www.slideteam.net/wp/wp-content/uploads/2020/03/Banner-20-1001x436.png'),
  //   Slide('title',
  //       'https://imgscf.slidemembers.com/docs/1/1/214/italian_food_-_free_presentation_template_213726.jpg'),
  //   Slide('title',
  //       'https://www.googleslidesthemes.com/images/f/o/o/d/-/food-burger-recipe-menu-google-slides-theme-slide-01-41a76612.webp'),
  // ];

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
