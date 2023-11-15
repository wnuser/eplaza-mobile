class RandomProductsModel {
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

  RandomProductsModel(
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
        this.updatedAt});

  RandomProductsModel.fromJson(Map<String, dynamic> json) {
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