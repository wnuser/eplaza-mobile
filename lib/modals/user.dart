class User {
  String? id;
  String? authType;
  String? authToken;
  String? fcmToken;
  String? name;
  String? email;
  String? contact;
  String? password;
  String? gender;
  String? profilePic;
  String? country;
  String? state;
  String? city;
  String? activated;
  String? deactivationReason;
  String? emailVerified;
  String? timeZone;
  String? createdAt;
  String? updatedAt;
  bool? success;

  User();

  User.fromJson(dynamic json) {
    id = json['id'].toString();
    authType = json['auth_type'];
    authToken = json['auth_token'];
    fcmToken = json['fcm_token'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    password = json['password'];
    gender = json['gender'];
    profilePic = json['profile_pic'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    activated = json['activated'].toString();
    deactivationReason = json['deactivation_reason'];
    emailVerified = json['email_verified'].toString();
    timeZone = json['time_zone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['auth_type'] = authType;
    map['auth_token'] = authToken;
    map['fcm_token'] = fcmToken;
    map['name'] = name;
    map['email'] = email;
    map['contact'] = contact;
    map['password'] = password;
    map['gender'] = gender;
    map['profile_pic'] = profilePic;
    map['country'] = country;
    map['state'] = state;
    map['city'] = city;
    map['activated'] = activated;
    map['email_verified'] = emailVerified;
    map['time_zone'] = timeZone;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['success'] = success;
    return map;
  }

  @override
  String toString() {
    return 'User{id: $id, authType: $authType, authToken: $authToken, fcmToken: $fcmToken, name: $name, email: $email, contact: $contact, password: $password, gender: $gender, profilePic: $profilePic, country: $country, state: $state, city: $city, activated: $activated, deactivationReason: $deactivationReason, emailVerified: $emailVerified, timeZone: $timeZone, createdAt: $createdAt, updatedAt: $updatedAt, success: $success}';
  }
}
