class Result {
  bool success = false;
  String message = '';
  String value = '';

  Result({this.success = false, this.message = '', this.value = ''});

  Result.fromJson(dynamic json) {
    success = json["success"];
    message = json["message"].toString();
    value = json["value"].toString();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = success;
    map["message"] = message;
    map["value"] = value;
    return map;
  }

  @override
  String toString() {
    return 'Result{success: $success, message: $message, value: $value}';
  }
}
