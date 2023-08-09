class Ad {
  String? title;
  String? image;
  String? link;
  String? info;

  Ad({
    this.title,
    this.image,
    this.link,
    this.info,
  });

  Ad.fromJson(dynamic json) {
    title = json['title'];
    image = json['image'];
    link = json['link'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['image'] = image;
    map['link'] = link;
    map['info'] = info;
    return map;
  }
}
