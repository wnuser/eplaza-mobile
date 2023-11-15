class Login_Model {
  Data? data;
  bool? success;
  String? message;
  String? token;

  Login_Model({this.data, this.success, this.message, this.token});

  Login_Model.fromJson(Map<String, dynamic> json) {
    data = json['data'] is Map<String, dynamic>
        ? Data.fromJson(json['data'])
        : null;
    success = json['success'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? mobile;
  int? userType;
  int? status;
  Null? zipCode;
  String? socialId;
  String? registerOtp;
  Null? isVerified;
  Null? city;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.mobile,
        this.userType,
        this.status,
        this.zipCode,
        this.socialId,
        this.registerOtp,
        this.isVerified,
        this.city,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    userType = json['user_type'];
    status = json['status'];
    zipCode = json['zip_code'];
    socialId = json['social_id'];
    registerOtp = json['register_otp'];
    isVerified = json['is_verified'];
    city = json['city'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['user_type'] = this.userType;
    data['status'] = this.status;
    data['zip_code'] = this.zipCode;
    data['social_id'] = this.socialId;
    data['register_otp'] = this.registerOtp;
    data['is_verified'] = this.isVerified;
    data['city'] = this.city;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}