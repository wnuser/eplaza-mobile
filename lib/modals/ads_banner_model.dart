class AdsBannerModel {
  List<Data>? data;
  bool? success;

  AdsBannerModel({this.data, this.success});

  AdsBannerModel.fromJson(Map<String, dynamic> json) {
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
  String? bannerTitle;
  String? bannerType;
  String? bannerLocation;
  String? bannerImage;
  int? status;
  String? city;
  int? clicks;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.bannerTitle,
        this.bannerType,
        this.bannerLocation,
        this.bannerImage,
        this.status,
        this.city,
        this.clicks,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerTitle = json['banner_title'];
    bannerType = json['banner_type'];
    bannerLocation = json['banner_location'];
    bannerImage = json['banner_image'];
    status = json['status'];
    city = json['city'];
    clicks = json['clicks'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['banner_title'] = this.bannerTitle;
    data['banner_type'] = this.bannerType;
    data['banner_location'] = this.bannerLocation;
    data['banner_image'] = this.bannerImage;
    data['status'] = this.status;
    data['city'] = this.city;
    data['clicks'] = this.clicks;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}