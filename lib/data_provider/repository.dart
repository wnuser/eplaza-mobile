import 'dart:async';

import 'package:dio/dio.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/preference.dart';

import '../modals/config.dart';
import '../modals/result.dart';
import 'api_provider.dart';

class Repository {
  static Repository? _instance;

  static Repository get instance {
    _instance ??= Repository._init();
    return _instance!;
  }

  Repository._init();

  Future<bool> getConfig() async {
    var data = await ApiProvider('getConfig').getDynamic();
    if (data['success'] == true) {
      Const.config.value = Config.fromJson(data);
      // Encryption.setNull();
    }
    return true;
  }

  Future<dynamic> login(String email, String password) async {
    return ApiProvider('login', parameters: {'email': email, 'password': password}).getDynamic();
  }

  Future<dynamic> register(String first_name, String last_name, String email, String password,
      String mobile, String user_type, String Zip_code, String social_id) async {
    return ApiProvider('register', parameters: {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'mobile': mobile,
      'user_type': user_type,
      'Zip_code': Zip_code,
      'social_id': social_id,
    }).getDynamic();
  }

  Future<dynamic> verifyOtp(String userId, String otp) {
    return ApiProvider('check/otp', parameters: {'user_id': userId, 'otp': otp}).getDynamic();
  }

  // Future<Result?> uploadFile(File file, String pathType) async {
  //   String ext = file.path.split('.').last;
  //   String fileName = Helper.getFileNamePrefix(pathType) + DateTime.now().millisecondsSinceEpoch.toString() + '.' + ext;
  //
  //   Map<String, dynamic> parameters = {
  //     "pathType": pathType,
  //     "file": await MultipartFile.fromFile(file.path, filename: fileName)
  //   };
  //
  //   return super.getResult('uploadFile', parameters: parameters);
  // }

  Future<List<dynamic>> getCategories() {
    return ApiProvider('get/categories', method: 'get').getList();
  }

  Future<List<dynamic>> getSubCategories(String categoryId) {
    return ApiProvider('get/subcategories/' + categoryId, method: 'get').getList();
  }

  Future<List<dynamic>> getDeliveryTimes() {
    return ApiProvider('all/delivery/times', method: 'get').getList();
  }

  Future<List<dynamic>> getPlans() {
    return ApiProvider('plans', method: 'get').getList();
  }

  Future<dynamic> addShop({
    required String vendorId,
    required String shopName,
    required String city,
    required String address,
    required MultipartFile? image1,
    required MultipartFile? image2,
    required String aadharCardNumber,
    required String businessType,
    required String turnOver,
    required List<int> categoryId,
    required String isGrahudhyog,
    required MultipartFile? aadharImage,
  }) async {
    // print({
    //   'vendor_id': vendorId,
    //   'shop_name': shopName,
    //   'city': city,
    //   'address': address,
    //   'image_1': image1,
    //   'image_2': image2,
    //   'aadhar_card_number': aadharCardNumber,
    //   'business_type': businessType,
    //   'turn_over': turnOver,
    //   'category_id': '[' + categoryId.join(',') + ']',
    //   'is_grahudhyog': isGrahudhyog,
    //   'aadhar_image': aadharImage,
    // });
    // return {'success': false, 'message': 'Test'};

    return ApiProvider('update/shop', parameters: {
      'vendor_id': vendorId,
      'shop_name': shopName,
      'city': city,
      'address': address,
      'image_1': image1,
      'image_2': image2,
      'aadhar_card_number': aadharCardNumber,
      'business_type': businessType,
      'turn_over': turnOver,
      'category_id': '[' + categoryId.join(',') + ']',
      'is_grahudhyog': isGrahudhyog,
      'aadhar_image': aadharImage,
    }).getDynamic();
  }

  Future<dynamic> purchasePlan({
    required String vendor_id,
    required String plan_id,
    required String plan_price,
    required String discount_price,
    required double total_billing_amount,
    required String duration,
  }) async {
    return ApiProvider('purchase/plan', parameters: {
      'vendor_id': vendor_id,
      'plan_id': plan_id,
      'plan_price': plan_price,
      'discount_price': discount_price,
      'total_billing_amount': total_billing_amount,
      'duration': duration,
    }).getDynamic();
  }

  Future<List<dynamic>> getSubscription(String uid) {
    return ApiProvider('subscrioption/' + uid, method: 'get').getList();
  }

  Future<List<dynamic>> getShopDetails() {
    return ApiProvider('shop/details/' + Preference.user.id.nullSafe, method: 'get').getList();
  }

  Future<dynamic> addProduct({
    required String productId,
    required String shop_id,
    required String category_id,
    required String sub_category_id,
    required String vendor_id,
    required String name,
    required String price,
    required String offer_price,
    required String stock_quantity,
    required String description,
    required String shipping_policy,
    required String refund_policy,
    required String is_cancel_enabled,
    required String is_return_enabled,
    required String is_exchange_enabled,
    required MultipartFile? image_1,
    required MultipartFile? image_2,
    required MultipartFile? image_3,
  }) async {
    return ApiProvider(productId.notEmpty ? 'update/product' : 'add/product', parameters: {
      'id': productId,
      'productId': productId,
      'shop_id': shop_id,
      'category_id': category_id,
      'sub_category_id': sub_category_id,
      'vendor_id': vendor_id,
      'name': name,
      'price': price,
      'offer_price': offer_price,
      'stock_quantity': stock_quantity,
      'description': description,
      'shipping_policy': shipping_policy,
      'refund_policy': refund_policy,
      'is_cancel_enabled': is_cancel_enabled,
      'is_return_enabled': is_return_enabled,
      'is_exchange_enabled': is_exchange_enabled,
      'image_1': image_1,
      'image_2': image_2,
      'image_3': image_3,
    }).getDynamic();
  }

  // Future<dynamic> updateProduct({
  //   required String shop_id,
  //   required String category_id,
  //   required String sub_category_id,
  //   required String vendor_id,
  //   required String name,
  //   required String price,
  //   required String offer_price,
  //   required String stock_quantity,
  //   required String description,
  //   required String shipping_policy,
  //   required String refund_policy,
  //   required String is_cancel_enabled,
  //   required String is_return_enabled,
  //   required String is_exchange_enabled,
  //   required MultipartFile? image_1,
  //   required MultipartFile? image_2,
  //   required MultipartFile? image_3,
  // }) async {
  //   return ApiProvider('update/product', parameters: {
  //     'shop_id': shop_id,
  //     'category_id': category_id,
  //     'sub_category_id': sub_category_id,
  //     'vendor_id': vendor_id,
  //     'name': name,
  //     'price': price,
  //     'offer_price': offer_price,
  //     'stock_quantity': stock_quantity,
  //     'description': description,
  //     'shipping_policy': shipping_policy,
  //     'refund_policy': refund_policy,
  //     'is_cancel_enabled': is_cancel_enabled,
  //     'is_return_enabled': is_return_enabled,
  //     'is_exchange_enabled': is_exchange_enabled,
  //     'image_1': image_1,
  //     'image_2': image_2,
  //     'image_3': image_3,
  //   }).getDynamic();
  // }

  Future<List<dynamic>> getProducts() {
    return ApiProvider('products/' + Preference.shopId.nullSafe, method: 'get').getList();
  }

  Future<Result> deleteProduct(String? id) async {
    return ApiProvider('product/delete/' + id.toString(), method: 'get').getResult();
  }

  Future<dynamic> getProductDetails(String? id) async {
    return ApiProvider('product/' + id.toString(), method: 'get').getDynamic();
  }
}
