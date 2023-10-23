class Category {
  String? id;
  String? name;
  String? image;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;

  Category();

  Category.fromJson(dynamic json) {
    id = json['id'].toString();
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
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  @override
  String toString() {
    return 'Category{id: $id, name: $name, image: $image, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
