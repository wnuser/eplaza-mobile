import 'category.dart';
import 'delivery_time.dart';
import 'sub_category.dart';

class Product {
  num? id;
  num? categoryId;
  num? subCategoryId;
  num? vendorId;
  String? name;
  num? price;
  num? offerPrice;
  num? stockQuantity;
  String? description;
  String? shippingPolicy;
  String? refundPolicy;
  num? isCancelEnabled;
  num? isReturnEnabled;
  num? isExchangeEnabled;
  String? image_1;
  String? image_2;
  String? image_3;
  String? createdAt;
  String? updatedAt;
  late Category category;
  late SubCategory subCategory;
  DeliveryTime? globalDeliveryTime;

  Product();

  Product.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    vendorId = json['vendor_id'];
    name = json['name'];
    price = json['price'];
    offerPrice = json['offer_price'];
    stockQuantity = json['stock_quantity'];
    description = json['description'];
    shippingPolicy = json['shipping_policy'];
    refundPolicy = json['refund_policy'];
    isCancelEnabled = json['is_cancel_enabled'];
    isReturnEnabled = json['is_return_enabled'];
    isExchangeEnabled = json['is_exchange_enabled'];
    image_1 = json['image_1'];
    image_2 = json['image_2'];
    image_3 = json['image_3'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null ? Category.fromJson(json['category']) : Category();
    subCategory = json['sub_category'] != null ? SubCategory.fromJson(json['sub_category']) : SubCategory();
    globalDeliveryTime = json['global_delivery_time'] != null
        ? DeliveryTime.fromJson(json['global_delivery_time'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['sub_category_id'] = subCategoryId;
    map['vendor_id'] = vendorId;
    map['name'] = name;
    map['price'] = price;
    map['offer_price'] = offerPrice;
    map['stock_quantity'] = stockQuantity;
    map['description'] = description;
    map['shipping_policy'] = shippingPolicy;
    map['refund_policy'] = refundPolicy;
    map['is_cancel_enabled'] = isCancelEnabled;
    map['is_return_enabled'] = isReturnEnabled;
    map['is_exchange_enabled'] = isExchangeEnabled;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['category'] = category.toJson();
      map['sub_category'] = subCategory.toJson();
    if (globalDeliveryTime != null) {
      map['global_delivery_time'] = globalDeliveryTime?.toJson();
    }
    return map;
  }
}