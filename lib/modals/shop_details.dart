import 'category.dart';

class ShopDetails {

  String? id;
  String? vendorId;
  String? shopName;
  String? shopDescription;
  String? city;
  String? address;
  String? image1;
  String? image2;
  String? aadharCardNumber;
  String? aadharImage;
  String? businessType;
  String? turnOver;
  String? isGrahudhyog;
  String? isPopular;
  String? createdAt;
  String? updatedAt;
  List<ShopCategories>? shopCategories;

  ShopDetails({
    this.id,
    this.vendorId,
    this.shopName,
    this.shopDescription,
    this.city,
    this.address,
    this.image1,
    this.image2,
    this.aadharCardNumber,
    this.aadharImage,
    this.businessType,
    this.turnOver,
    this.isGrahudhyog,
    this.isPopular,
    this.createdAt,
    this.updatedAt,
    this.shopCategories,
  });

  ShopDetails.fromJson(dynamic json) {
    id = json['id'].toString();
    vendorId = json['vendor_id'].toString();
    shopName = json['shop_name'].toString();
    shopDescription = json['shop_description'].toString();
    city = json['city'].toString();
    address = json['address'].toString();
    image1 = json['image_1'].toString();
    image2 = json['image_2'].toString();
    aadharCardNumber = json['aadhar_card_number'].toString();
    aadharImage = json['aadhar_image'].toString();
    businessType = json['business_type'].toString();
    turnOver = json['turn_over'].toString();
    isGrahudhyog = json['is_grahudhyog'].toString();
    isPopular = json['is_popular'].toString();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    if (json['shop_categories'] != null) {
      shopCategories = [];
      json['shop_categories'].forEach((v) {
        shopCategories?.add(ShopCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id.toString();
    map['vendor_id'] = vendorId.toString();
    map['shop_name'] = shopName;
    map['shop_description'] = shopDescription;
    map['city'] = city;
    map['address'] = address;
    map['image_1'] = image1;
    map['image_2'] = image2;
    map['aadhar_card_number'] = aadharCardNumber;
    map['aadhar_image'] = aadharImage;
    map['business_type'] = businessType;
    map['turn_over'] = turnOver;
    map['is_grahudhyog'] = isGrahudhyog;
    map['is_popular'] = isPopular;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (shopCategories != null) {
      map['shop_categories'] = shopCategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ShopCategories {
  ShopCategories({
    this.id,
    this.shopId,
    this.categoryId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  ShopCategories.fromJson(dynamic json) {
    id = json['id'];
    shopId = json['shop_id'];
    categoryId = json['category_id'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  num? id;
  num? shopId;
  num? categoryId;
  num? status;
  String? createdAt;
  String? updatedAt;
  Category? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['shop_id'] = shopId;
    map['category_id'] = categoryId;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }
}
