class SpecificProductDetails {
  List<ProductData>? data;
  String? message;
  bool? success;

  SpecificProductDetails({this.data, this.message, this.success});

  SpecificProductDetails.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(new ProductData.fromJson(v));
      });
    }
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class ProductData {
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
  

  ProductData(
      {this.id,
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
      });

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    shopId = json['shop_id'];
    name = json['name'];
    price = json['price'];
    offerPrice = json['offer_price'];
    offerPercentage = json['offer_percentage'];
    stockQuantity = json['stock_quantity'];
    description = json['description'];
    shippingPolicy = json['shipping_policy'];
    refundPolicy = json['refund_policy'];
    isCancelEnabled = json['is_cancel_enabled'];
    isReturnEnabled = json['is_return_enabled'];
    isExchangeEnabled = json['is_exchange_enabled'];
    image1 = json['image_1'];
    image2 = json['image_2'];
    image3 = json['image_3'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['shop_id'] = this.shopId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['offer_price'] = this.offerPrice;
    data['offer_percentage'] = this.offerPercentage;
    data['stock_quantity'] = this.stockQuantity;
    data['description'] = this.description;
    data['shipping_policy'] = this.shippingPolicy;
    data['refund_policy'] = this.refundPolicy;
    data['is_cancel_enabled'] = this.isCancelEnabled;
    data['is_return_enabled'] = this.isReturnEnabled;
    data['is_exchange_enabled'] = this.isExchangeEnabled;
    data['image_1'] = this.image1;
    data['image_2'] = this.image2;
    data['image_3'] = this.image3;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
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

  Category(
      {this.id,
      this.name,
      this.mainBanner,
      this.productPreviewBanner,
      this.description,
      this.status,
      this.isGrammart,
      this.createdAt,
      this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mainBanner = json['main_banner'];
    productPreviewBanner = json['product_preview_banner'];
    description = json['description'];
    status = json['status'];
    isGrammart = json['is_grammart'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['main_banner'] = this.mainBanner;
    data['product_preview_banner'] = this.productPreviewBanner;
    data['description'] = this.description;
    data['status'] = this.status;
    data['is_grammart'] = this.isGrammart;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
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
  int? category_Id;

  SubCategory(
      {this.id,
      this.category_Id,
      this.name,
      this.image,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.categoryId});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category_Id = json['category_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['categoryId'] = this.categoryId;
    return data;
  }
}

class GlobalDeliveryTime {
  int? id;
  int? minTime;
  int? maxTime;
  int? timeFormat;
  String? createdAt;
  String? updatedAt;

  GlobalDeliveryTime(
      {this.id,
      this.minTime,
      this.maxTime,
      this.timeFormat,
      this.createdAt,
      this.updatedAt});

  GlobalDeliveryTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    minTime = json['min_time'];
    maxTime = json['max_time'];
    timeFormat = json['time_format'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['min_time'] = this.minTime;
    data['max_time'] = this.maxTime;
    data['time_format'] = this.timeFormat;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class ShopDetail {
  int? id;
  int? vendorId;
  String? shopName;
  Null? shopDescription;
  String? city;
  String? address;
  String? image1;
  String? image2;
  String? aadharCardNumber;
  String? aadharImage;
  String? businessType;
  String? turnOver;
  int? isGrahudhyog;
  int? isPopular;
  String? createdAt;
  String? updatedAt;

  ShopDetail(
      {this.id,
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
      this.updatedAt});

  ShopDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    shopName = json['shop_name'];
    shopDescription = json['shop_description'];
    city = json['city'];
    address = json['address'];
    image1 = json['image_1'];
    image2 = json['image_2'];
    aadharCardNumber = json['aadhar_card_number'];
    aadharImage = json['aadhar_image'];
    businessType = json['business_type'];
    turnOver = json['turn_over'];
    isGrahudhyog = json['is_grahudhyog'];
    isPopular = json['is_popular'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['shop_name'] = this.shopName;
    data['shop_description'] = this.shopDescription;
    data['city'] = this.city;
    data['address'] = this.address;
    data['image_1'] = this.image1;
    data['image_2'] = this.image2;
    data['aadhar_card_number'] = this.aadharCardNumber;
    data['aadhar_image'] = this.aadharImage;
    data['business_type'] = this.businessType;
    data['turn_over'] = this.turnOver;
    data['is_grahudhyog'] = this.isGrahudhyog;
    data['is_popular'] = this.isPopular;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
