// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:e_plaza_vendor/utils/helper.dart';

class NotificationModel {
  int? id;
  String? senderId;
  String? receiverId;
  String? senderName;
  String? receiverName;
  String? notificationType;
  String? title;
  String? body;
  String? image;
  String? data;
  String? readStatus;
  String? createdAt;
  String? updatedAt;

  NotificationModel();

  NotificationModel.fromJson(dynamic json) {
    id = json['id'];
    senderId = json['sender_id'].toString();
    receiverId = json['receiver_id'].toString();
    senderName = json['sender_name'];
    receiverName = json['receiver_name'];
    notificationType = json['notification_type'];
    title = json['title'];
    body = json['body'];
    image = json['image'];
    data = json['data'];
    readStatus = json['read_status'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // NotificationModel.fromRemoteMessage(RemoteMessage json) {
  //   id = 0;
  //   senderId = json.data['sender_id'];
  //   receiverId = json.data['receiver_id'];
  //   senderName = json.data['sender_name'];
  //   receiverName = json.data['receiver_name'];
  //   notificationType = json.data['notification_type'];
  //   title = json.notification.title;
  //   body = json.notification.body;
  //   image = json.data['image'];
  //   data = json.data['data'];
  //   readStatus = '0';
  //   createdAt = Helper.getCurrentDate(Helper.DATE_FORMAT_2);
  //   updatedAt = Helper.getCurrentDate(Helper.DATE_FORMAT_2);
  // }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sender_id'] = senderId;
    map['receiver_id'] = receiverId;
    map['sender_name'] = senderName;
    map['receiver_name'] = receiverName;
    map['notification_type'] = notificationType;
    map['title'] = title;
    map['body'] = body;
    map['image'] = image;
    map['data'] = data;
    map['read_status'] = readStatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class NotificationType {
  static const String NORMAL = 'NORMAL';
  static const String SMALL_IMAGE = 'SMALL_IMAGE';
  static const String BIG_IMAGE = 'BIG_IMAGE';
  static const String BIG_TEXT = 'BIG_TEXT';
  static const String OPEN_URL = 'OPEN_URL';
  static const String SUPPORT = 'SUPPORT';
  static const String CHAT_MESSAGE = 'CHAT_MESSAGE';
  static const String CONTEST_RESULT = 'CONTEST_RESULT';
  static const String UPGRADE_PLAN = 'UPGRADE_PLAN';
}
