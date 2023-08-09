class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? mobile;
  String? userType;
  String? zipCode;
  String? socialId;
  String? registerOtp;
  String? updatedAt;
  String? createdAt;

  User();

  User.fromJson(dynamic json) {
    id = json['id'].toString();
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    userType = json['user_type'].toString();
    zipCode = json['zip_code'].toString();
    socialId = json['social_id'].toString();
    registerOtp = json['register_otp'].toString();
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['password'] = password;
    map['mobile'] = mobile;
    map['user_type'] = userType;
    map['zip_code'] = zipCode;
    map['social_id'] = socialId;
    map['register_otp'] = registerOtp;
    map['updatedAt'] = updatedAt;
    map['createdAt'] = createdAt;
    return map;
  }
}
