class SubCategory {
  String? id;
  String? categoryId;
  String? name;
  String? image;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;

  SubCategory();

  SubCategory.fromJson(dynamic json) {
    id = json['id'].toString();
    categoryId = json['category_id'].toString();
    name = json['name'];
    image = json['image'];
    description = json['description'];
    status = json['status'].toString();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
