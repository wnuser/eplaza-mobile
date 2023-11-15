class SignUp_Model {
  String? message;
  Data? data;
  bool? success;

  SignUp_Model({this.message, this.data, this.success});

  SignUp_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int? status;
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? mobile;
  int? userType;
  String? socialId;
  String? registerOtp;
  bool? is_verified;
  String? updatedAt;
  String? createdAt;

  Data(
      {this.status,
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.mobile,
        this.userType,
        this.socialId,
        this.registerOtp,
        this.is_verified,
        this.updatedAt,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    userType = json['user_type'];
    socialId = json['social_id'];
    registerOtp = json['register_otp'];
    is_verified= json['is_verified'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['user_type'] = this.userType;
    data['social_id'] = this.socialId;
    data['register_otp'] = this.registerOtp;
    data['is_verified'] = this.is_verified;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}