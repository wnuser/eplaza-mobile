import 'package:e_plaza/modals/home_main_category_model.dart';

class GmartCatModel {
  List<Data>? data;
  String? message;
  bool? success;

  GmartCatModel({this.data, this.message, this.success});

  GmartCatModel.fromJson(Map<String, dynamic> json) {
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

// class Data {
//   int? id;
//   String? name;
//   String? mainBanner;
//   String? productPreviewBanner;
//   String? description;
//   int? status;
//   int? isGrammart;
//   String? createdAt;
//   String? updatedAt;

//   Data(
//       {this.id,
//         this.name,
//         this.mainBanner,
//         this.productPreviewBanner,
//         this.description,
//         this.status,
//         this.isGrammart,
//         this.createdAt,
//         this.updatedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     mainBanner = json['main_banner'];
//     productPreviewBanner = json['product_preview_banner'];
//     description = json['description'];
//     status = json['status'];
//     isGrammart = json['is_grammart'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['main_banner'] = this.mainBanner;
//     data['product_preview_banner'] = this.productPreviewBanner;
//     data['description'] = this.description;
//     data['status'] = this.status;
//     data['is_grammart'] = this.isGrammart;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }