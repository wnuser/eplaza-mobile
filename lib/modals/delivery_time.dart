class DeliveryTime {
  num? id;
  num? minTime;
  num? maxTime;
  num? timeFormat;
  String? createdAt;
  String? updatedAt;

  String get txt {
    if (minTime == null || maxTime == null || timeFormat == null) return '';

    return minTime.toString() +
        ' - ' +
        maxTime.toString() +
        (timeFormat == 1
            ? ' minutes'
            : (timeFormat == 2 ? ' hours' : (timeFormat == 3 ? ' days' : '')));
  }


  DeliveryTime.test(
      this.id, this.minTime, this.maxTime, this.timeFormat, this.createdAt, this.updatedAt);

  DeliveryTime();

  DeliveryTime.fromJson(dynamic json) {
    id = json['id'];
    minTime = json['min_time'];
    maxTime = json['max_time'];
    timeFormat = json['time_format'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['min_time'] = minTime;
    map['max_time'] = maxTime;
    map['time_format'] = timeFormat;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
