class SubCategoryModel {
  List<Data>? data;
  String? message;
  bool? success;

  SubCategoryModel({this.data, this.message, this.success});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
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
  int? categoryId;
  String? name;
  String? image;
  String? description;
  int? status;


  Data(
      {this.id,
        this.categoryId,
        this.name,
        this.image,
        this.description,
        this.status,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}