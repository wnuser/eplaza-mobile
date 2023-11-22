import 'dart:convert';
import 'package:e_plaza/modals/ads_banner_model.dart';
import 'package:e_plaza/modals/category_shop_model.dart';
import 'package:e_plaza/modals/gmart_cat_model.dart';
import 'package:e_plaza/modals/latest%20_product_model.dart';
import 'package:e_plaza/modals/login_model.dart';
import 'package:e_plaza/modals/offer_discount_product_model.dart';
import 'package:e_plaza/modals/offer_random_products_model.dart';
import 'package:e_plaza/modals/signup_model.dart';
import 'package:e_plaza/modals/specific_product_details_model.dart';
import 'package:e_plaza/modals/specific_store_products_model.dart';
import 'package:e_plaza/modals/subcatmodel.dart';
import 'package:e_plaza/modals/verifyotpmodel.dart';
import 'package:http/http.dart' as http;
import '../modals/category.dart';
import '../modals/categoty_product_model.dart';
import '../modals/home_slider_model.dart';
import '../modals/home_main_category_model.dart';
import 'api_param_model.dart';
import 'network_constant.dart';



class ApiController {
  final JsonDecoder _decoder = const JsonDecoder();


  Future<Login_Model>loginRequest(String email,String password) async {
    var url = NetworkConstantsUtil.login;
    print("loginApiUrl"+url);
    dynamic param = await ApiParamModel().loginRequestParams(email,password);

    return http
        .post(Uri.parse(url), body: param)
        .then((http.Response response) async {
      return Login_Model.fromJson(json.decode(response.body));

    });
  }



  Future<SignUp_Model>signUpRequest(String fname,String lname,String email,String password,String phone,String zipcode) async {
    var url = NetworkConstantsUtil.signup;
    print("signUpApiUrl"+url);
    dynamic param = await ApiParamModel().signUpRequestParams(fname,lname,email,password,phone,"3",zipcode);

    return http
        .post(Uri.parse(url), body: param)
        .then((http.Response response) async {
      return SignUp_Model.fromJson(json.decode(response.body));

    });
  }

  Future<VerifyOtpModel>otpVerifyRequest(int id,String otp) async {
    var url = NetworkConstantsUtil.otpverify;
    print("otpverifyApiUrl"+url);
    dynamic param = await ApiParamModel().otpVerifyRequestParams(id,otp);

    return http
        .post(Uri.parse(url), body: param)
        .then((http.Response response) async {
      return VerifyOtpModel.fromJson(json.decode(response.body));

    });
  }

  // Future<HomeMainCategoriesModel>getAllCategories() async {
  //   var url = NetworkConstantsUtil.allcategories;
  //   print("all_category_url"+url);
  //
  //   dynamic param = await ApiParamModel().getAllCategoryParams();
  //
  //   return http
  //       .post(Uri.parse(url), body: param)
  //       .then((http.Response response) async {
  //     return HomeMainCategoriesModel.fromJson(json.decode(response.body));
  //
  //   });
  // }

  Future<HomeMainCategoriesModel> getHomeCategories() async {
    var url = NetworkConstantsUtil.allcategories;
    print("allcategoriesurl:- " + url);
    return http
        .get(Uri.parse(url))
        .then((http.Response response) async {
      return HomeMainCategoriesModel.fromJson(json.decode(response.body));
    });
  }



  Future<GmartCatModel> getHomeGmartCategories() async {
    var url = NetworkConstantsUtil.gmartcategories;
    print("allgmartcategoriesurl:- " + url);
    return http
        .get(Uri.parse(url))
        .then((http.Response response) async {
      return GmartCatModel.fromJson(json.decode(response.body));
    });
  }

  Future<LatestProductModel> getHomeLatestProducts() async {
    var url = NetworkConstantsUtil.getlatestproduct;
    print("getlatestproducturl:- " + url);
    return http
        .get(Uri.parse(url))
        .then((http.Response response) async {
      return LatestProductModel.fromJson(json.decode(response.body));
    });
  }


  Future<OfferDiscountProductModel> getOfferDiscounntProduct() async {
    var url = NetworkConstantsUtil.gethomeofferroduct;
    print("getOfferDiscounntProducturl:- " + url);
    return http
        .get(Uri.parse(url))
        .then((http.Response response) async {
      return OfferDiscountProductModel.fromJson(json.decode(response.body));
    });
  }

  Future<OfferRandomProductsModel> getOfferRandomProduct() async {
    var url = NetworkConstantsUtil.gethomeofferrandomroduct;
    print("getOfferRandomProducturl:- " + url);
    return http
        .get(Uri.parse(url))
        .then((http.Response response) async {
      return OfferRandomProductsModel.fromJson(json.decode(response.body));
    });
  }


  Future<HomeSliderMainModel> getHomeMainBanners() async {
    var url = NetworkConstantsUtil.homemainbanners;
    print("homebannerapiurl" + url);
    return http
        .get(Uri.parse(url))
        .then((http.Response response) async {
      return HomeSliderMainModel.fromJson(json.decode(response.body));
    });
  }

  Future<AdsBannerModel> getAdsBanners() async {
    var url = NetworkConstantsUtil.homeadsbanners;
    print("homeadsbannerapiurl" + url);
    return http
        .get(Uri.parse(url))
        .then((http.Response response) async {
      return AdsBannerModel.fromJson(json.decode(response.body));
    });
  }

  Future<SubCategoryModel> getSubCategories(int cat_id) async {
    var url = NetworkConstantsUtil.subcat+cat_id.toString();
    print("subcatapiurl" + url);
    return http
        .get(Uri.parse(url))
        .then((http.Response response) async {
      return SubCategoryModel.fromJson(json.decode(response.body));
    });
  }

  Future<CatAllProductDetailsModel> getCategoryProducts(int cat_id) async {
    var url = NetworkConstantsUtil.catproducts+cat_id.toString();
    print("catproductapiurl" + url);
    return http
        .get(Uri.parse(url))
        .then((http.Response response) async {
      return CatAllProductDetailsModel.fromJson(json.decode(response.body));
    });
  }

  Future<CategoryShopModel> getCategoryShops(int cat_id) async {
    print('init get catagory shopssss');
    String city="/dehradun";
    var url = NetworkConstantsUtil.catshops+cat_id.toString()+city;
    print("catshopsapiurl" + url);
    return await http
        .get(Uri.parse(url))
        .then((http.Response response) async {
          print('uri response is here');
      return CategoryShopModel.fromJson(json.decode(response.body));
    });
  }

 //abdulrehman   work starts here
  Future<SpecificStoreProducts> getSpecificStoreProducts(int store_id) async {
    print('init get shop products');
    var url = NetworkConstantsUtil.specificShopPRoducts+store_id.toString();
    // print("catshopsapiurl : " + url);
    return await http
        .get(Uri.parse(url))
        .then((http.Response response) async {
          print('data length is :');
          print(await json.decode(response.body)['data'].length);
      return await SpecificStoreProducts.fromJson(json.decode(response.body));
    });
  }



//   Future<SpecificStoreProducts> getSearchedProductsOfSpecificStore(int store_id, String searchedInput) async {
//   print('init get searched products');
//   var url = NetworkConstantsUtil.specificShopPRoducts + store_id.toString();

//   try {
//     var response = await http.post(
//       Uri.parse(url),
//       headers: {
//         "Content-Type": "application/json",
//         "Accept": "application/json",
//       },
//       body: jsonEncode({
//         "shopId": 2,
//         "searchInput": searchedInput,
//       }),
//     );

//     print('Response status code: ${response.statusCode}');
//     print('Response body: ${response.body}');

//     if (response.statusCode == 200) {
//       // Successful response, parse and return data
//       return SpecificStoreProducts.fromJson(json.decode(utf8.decode(response.bodyBytes)));
//     } else {
//       // Handle non-200 status code (e.g., server error)
//       throw Exception('Failed to get data. Status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     // Handle exceptions during the HTTP request
//     print('Error during HTTP request: $e');
//     throw e; // Propagate the exception
//   }
// }



  Future<SpecificStoreProducts> getSearchedProductsOfSpecificStore(int store_id,String searchedInput) async {
    print('init get searched products');
    var url = NetworkConstantsUtil.searchedProducts.toString();
    // print("catshopsapiurl : " + url);
    return await http
        .post(
          Uri.parse(url),
          headers: {
            "Content-Type" : "application/json",
            // "Accept" : "application/json"
          },
          body: jsonEncode(
            {
              "shopId" : store_id,
              "searchInput" : searchedInput
            }
          ),
        )
        .then((http.Response response) async {
          print('data length is :');
          print(await jsonDecode(response.body)['data'].length);
      return await SpecificStoreProducts.fromJson(json.decode(utf8.decoder.convert(response.bodyBytes)));
    });
  }



  Future<SpecificProductDetails> getSpecificProductDetails(int product_id) async {
    print('init get product details');
    var url = NetworkConstantsUtil.specificProductDetails+product_id.toString();
    print(url);
    return await http
        .get(Uri.parse(url))
        .then((http.Response response) async {
          print('data length is :');
          print(await json.decode(response.body)['data'].length);
      return await SpecificProductDetails.fromJson(json.decode(response.body));
    });
  }




//test for getting image from server
  // Future getSpecificStoreImage() async {
  //   print('init get catagory shopssss');
  //   String city="/dehradun";
  //   var url = 'https://api.eplaza.in/images/category/1696872192851-electronic-356056.jpg';
  //   print("catshopsapiurl" + url);
  //   await http
  //       .get(Uri.parse(url))
  //       .then((http.Response response) async {
  //         print(await json.decode(response.body));
  //     // return CategoryShopModel.fromJson(json.decode(response.body));
  //   });
  // }



}
