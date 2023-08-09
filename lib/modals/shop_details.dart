import 'package:e_plaza_vendor/modals/product.dart';

import 'category.dart';

class ShopDetails {
  num? id;
  num? vendorId;
  String? shopName;
  String? city;
  String? address;
  String? image1;
  String? image2;
  num? aadharCardNumber;
  String? aadharImage;
  String? businessType;
  String? turnOver;
  num? categoryId;
  num? isGrahudhyog;
  String? createdAt;
  String? updatedAt;
  late Category category;

  ShopDetails();

  ShopDetails.fromJson(dynamic json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    shopName = json['shop_name'];
    city = json['city'];
    address = json['address'];
    image1 = json['image_1'];
    image2 = json['image_2'];
    aadharCardNumber = json['aadhar_card_number'];
    aadharImage = json['aadhar_image'];
    businessType = json['business_type'];
    turnOver = json['turn_over'];
    categoryId = json['category_id'];
    isGrahudhyog = json['is_grahudhyog'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null ? Category.fromJson(json['category']) : Category();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['vendor_id'] = vendorId;
    map['shop_name'] = shopName;
    map['city'] = city;
    map['address'] = address;
    map['image_1'] = image1;
    map['image_2'] = image2;
    map['aadhar_card_number'] = aadharCardNumber;
    map['aadhar_image'] = aadharImage;
    map['business_type'] = businessType;
    map['turn_over'] = turnOver;
    map['category_id'] = categoryId;
    map['is_grahudhyog'] = isGrahudhyog;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
