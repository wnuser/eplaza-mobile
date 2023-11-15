class CategoryShopModel {
    List<Data>? data;
    bool? success;

    CategoryShopModel({this.data, this.success});

    CategoryShopModel.fromJson(Map<String, dynamic> json) {
        if (json['data'] != null) {
            data = <Data>[];
            json['data'].forEach((v) {
                data!.add(new Data.fromJson(v));
            });
        }
        success = json['success'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['data'] = this.data!.map((v) => v.toJson()).toList();
        }
        data['success'] = this.success;
        return data;
    }
}

class Data {
    int? id;
    int? vendorId;
    String? shopName;
    Null? shopDescription;
    String? city;
    String? address;
    String? image1;
    String? image2;
    String? aadharCardNumber;
    Null? aadharImage;
    String? businessType;
    String? turnOver;
    int? isGrahudhyog;
    int? isPopular;
    String? createdAt;
    String? updatedAt;

    Data(
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

    Data.fromJson(Map<String, dynamic> json) {
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