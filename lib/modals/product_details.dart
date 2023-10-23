import 'category.dart';
import 'delivery_time.dart';
import 'sub_category.dart';

class ProductDetails {
  String? id;
  String? categoryId;
  String? subCategoryId;
  String? shopId;
  String? name;
  String? price;
  String? offerPrice;
  String? offerPercentage;
  String? stockQuantity;
  String? description;
  String? shippingPolicy;
  String? refundPolicy;
  String? isCancelEnabled;
  String? isReturnEnabled;
  String? isExchangeEnabled;
  String? image1;
  String? image2;
  String? image3;
  String? createdAt;
  String? updatedAt;
  late Category category;
  late SubCategory subCategory;
  late DeliveryTime globalDeliveryTime;
  ShopDetail? shopDetail;

  ProductDetails();

  ProductDetails.fromJson(dynamic json) {
    id = json['id'].toString();
    categoryId = json['category_id'].toString();
    subCategoryId = json['sub_category_id'].toString();
    shopId = json['shop_id'].toString();
    name = json['name'].toString();
    price = json['price'].toString();
    offerPrice = json['offer_price'].toString();
    offerPercentage = json['offer_percentage'].toString();
    stockQuantity = json['stock_quantity'].toString();
    description = json['description'].toString();
    shippingPolicy = json['shipping_policy'].toString();
    refundPolicy = json['refund_policy'].toString();
    isCancelEnabled = json['is_cancel_enabled'].toString();
    isReturnEnabled = json['is_return_enabled'].toString();
    isExchangeEnabled = json['is_exchange_enabled'].toString();
    image1 = json['image_1'].toString();
    image2 = json['image_2'].toString();
    image3 = json['image_3'].toString();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    category = json['category'] != null ? Category.fromJson(json['category']) : Category();
    subCategory = json['sub_category'] != null ? SubCategory.fromJson(json['sub_category']) : SubCategory();
    globalDeliveryTime = json['global_delivery_time'] != null
        ? DeliveryTime.fromJson(json['global_delivery_time'])
        : DeliveryTime();
    shopDetail = json['shop_detail'] != null ? ShopDetail.fromJson(json['shop_detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['sub_category_id'] = subCategoryId;
    map['shop_id'] = shopId;
    map['name'] = name;
    map['price'] = price;
    map['offer_price'] = offerPrice;
    map['offer_percentage'] = offerPercentage;
    map['stock_quantity'] = stockQuantity;
    map['description'] = description;
    map['shipping_policy'] = shippingPolicy;
    map['refund_policy'] = refundPolicy;
    map['is_cancel_enabled'] = isCancelEnabled;
    map['is_return_enabled'] = isReturnEnabled;
    map['is_exchange_enabled'] = isExchangeEnabled;
    map['image_1'] = image1;
    map['image_2'] = image2;
    map['image_3'] = image3;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (subCategory != null) {
      map['sub_category'] = subCategory?.toJson();
    }
    if (globalDeliveryTime != null) {
      map['global_delivery_time'] = globalDeliveryTime?.toJson();
    }
    if (shopDetail != null) {
      map['shop_detail'] = shopDetail?.toJson();
    }
    return map;
  }
}

class ShopDetail {
  ShopDetail({
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
  });

  ShopDetail.fromJson(dynamic json) {
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
  }

  String? id;
  String? vendorId;
  String? shopName;
  dynamic shopDescription;
  String? city;
  String? address;
  String? image1;
  String? image2;
  String? aadharCardNumber;
  dynamic aadharImage;
  String? businessType;
  String? turnOver;
  String? isGrahudhyog;
  String? isPopular;
  String? createdAt;
  String? updatedAt;

  ShopDetail copyWith({
    String? id,
    String? vendorId,
    String? shopName,
    dynamic shopDescription,
    String? city,
    String? address,
    String? image1,
    String? image2,
    String? aadharCardNumber,
    dynamic aadharImage,
    String? businessType,
    String? turnOver,
    String? isGrahudhyog,
    String? isPopular,
    String? createdAt,
    String? updatedAt,
  }) =>
      ShopDetail(
        id: id ?? this.id,
        vendorId: vendorId ?? this.vendorId,
        shopName: shopName ?? this.shopName,
        shopDescription: shopDescription ?? this.shopDescription,
        city: city ?? this.city,
        address: address ?? this.address,
        image1: image1 ?? this.image1,
        image2: image2 ?? this.image2,
        aadharCardNumber: aadharCardNumber ?? this.aadharCardNumber,
        aadharImage: aadharImage ?? this.aadharImage,
        businessType: businessType ?? this.businessType,
        turnOver: turnOver ?? this.turnOver,
        isGrahudhyog: isGrahudhyog ?? this.isGrahudhyog,
        isPopular: isPopular ?? this.isPopular,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['vendor_id'] = vendorId;
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
    return map;
  }
}