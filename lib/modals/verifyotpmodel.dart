class VerifyOtpModel {
  Data? data;
  String? message;
  bool? success;
  String? jsontoken;

  VerifyOtpModel({this.data, this.message, this.success, this.jsontoken});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    success = json['success'];
    jsontoken = json['jsontoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    data['jsontoken'] = this.jsontoken;
    return data;
  }
}

class Data {
  String? userId;
  String? otp;

  Data({this.userId, this.otp});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['otp'] = this.otp;
    return data;
  }
}