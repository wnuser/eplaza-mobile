class HomeSliderMainModel {
  List<Data>? data;
  String? message;
  bool? success;

  HomeSliderMainModel({this.data, this.message, this.success});

  HomeSliderMainModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? bannerImage;
  String? title;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.bannerImage,
        this.title,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerImage = json['banner_image'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['banner_image'] = this.bannerImage;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}