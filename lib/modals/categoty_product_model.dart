class CatAllProductDetailsModel {
  List<Data>? data;
  bool? success;

  CatAllProductDetailsModel({this.data, this.success});

  factory CatAllProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return CatAllProductDetailsModel(
      data: (json['data'] as List<dynamic>)
          .map((item) => Data.fromJson(item))
          .toList(),
      success: json['success'],
    );
  }
}

class Data {
  int? id;
  int? categoryId;
  int? subCategoryId;
  int? shopId;
  String? name;
  int? price;
  int? offerPrice;
  int? offerPercentage;
  int? stockQuantity;
  String? description;
  int? shippingPolicy;
  String? refundPolicy;
  int? isCancelEnabled;
  int? isReturnEnabled;
  int? isExchangeEnabled;
  String? image1;
  String? image2;
  String? image3;
  String? createdAt;
  String? updatedAt;
  Category? category;
  SubCategory? subCategory;
  GlobalDeliveryTime? globalDeliveryTime;

  Data({
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.shopId,
    this.name,
    this.price,
    this.offerPrice,
    this.offerPercentage,
    this.stockQuantity,
    this.description,
    this.shippingPolicy,
    this.refundPolicy,
    this.isCancelEnabled,
    this.isReturnEnabled,
    this.isExchangeEnabled,
    this.image1,
    this.image2,
    this.image3,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.subCategory,
    this.globalDeliveryTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      categoryId: json['category_id'],
      subCategoryId: json['sub_category_id'],
      shopId: json['shop_id'],
      name: json['name'],
      price: json['price'],
      offerPrice: json['offer_price'],
      offerPercentage: json['offer_percentage'],
      stockQuantity: json['stock_quantity'],
      description: json['description'],
      shippingPolicy: json['shipping_policy'],
      refundPolicy: json['refund_policy'],
      isCancelEnabled: json['is_cancel_enabled'],
      isReturnEnabled: json['is_return_enabled'],
      isExchangeEnabled: json['is_exchange_enabled'],
      image1: json['image_1'],
      image2: json['image_2'],
      image3: json['image_3'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      category: Category.fromJson(json['category']),
      subCategory: SubCategory.fromJson(json['sub_category']),
      globalDeliveryTime: GlobalDeliveryTime.fromJson(json['global_delivery_time']),
    );
  }
}

class Category {
  int? id;
  String? name;
  String? mainBanner;
  String? productPreviewBanner;
  String? description;
  int? status;
  int? isGrammart;
  String? createdAt;
  String? updatedAt;

  Category({
    this.id,
    this.name,
    this.mainBanner,
    this.productPreviewBanner,
    this.description,
    this.status,
    this.isGrammart,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      mainBanner: json['main_banner'],
      productPreviewBanner: json['product_preview_banner'],
      description: json['description'],
      status: json['status'],
      isGrammart: json['is_grammart'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class SubCategory {
  int? id;
  int? categoryId;
  String? name;
  String? image;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? subcategoryId;

  SubCategory({
    this.id,
    this.categoryId,
    this.name,
    this.image,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.subcategoryId,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      subcategoryId: json['categoryId'],
    );
  }
}

class GlobalDeliveryTime {
  int? id;
  int? minTime;
  int? maxTime;
  int? timeFormat;
  String? createdAt;
  String? updatedAt;

  GlobalDeliveryTime({
    this.id,
    this.minTime,
    this.maxTime,
    this.timeFormat,
    this.createdAt,
    this.updatedAt,
  });

  factory GlobalDeliveryTime.fromJson(Map<String, dynamic> json) {
    return GlobalDeliveryTime(
      id: json['id'],
      minTime: json['min_time'],
      maxTime: json['max_time'],
      timeFormat: json['time_format'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
