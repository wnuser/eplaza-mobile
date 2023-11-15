import 'dart:convert';
import 'package:e_plaza/modals/ads_banner_model.dart';
import 'package:e_plaza/modals/category_shop_model.dart';
import 'package:e_plaza/modals/gmart_cat_model.dart';
import 'package:e_plaza/modals/latest%20_product_model.dart';
import 'package:e_plaza/modals/login_model.dart';
import 'package:e_plaza/modals/offer_discount_product_model.dart';
import 'package:e_plaza/modals/offer_random_products_model.dart';
import 'package:e_plaza/modals/signup_model.dart';
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
    String city="/dehradun";
    var url = NetworkConstantsUtil.catshops+cat_id.toString()+city;
    print("catshopsapiurl" + url);
    return http
        .get(Uri.parse(url))
        .then((http.Response response) async {
      return CategoryShopModel.fromJson(json.decode(response.body));
    });
  }



}
