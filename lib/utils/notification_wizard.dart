// import 'dart:convert';
//
// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:e_plaza/data_provider/repository.dart';
// import 'package:e_plaza/modals/notification_model.dart';
// import 'package:e_plaza/utils/helper.dart';
// import 'package:e_plaza/utils/logger.dart';
// import 'package:e_plaza/utils/notification_viewer.dart';
//
// class NotificationWizard {
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   static late NotificationViewer _notificationViewer;
//
//   static void setUp() {
//     _notificationViewer = NotificationViewer((payload) {
//       Logger.m(tag: 'Notification Payload', value: payload);
//       openNotification(payload);
//       return Future.delayed(const Duration(milliseconds: 1));
//     });
//
//     _initFcmNotification();
//   }
//
//   static void openNotification(String? payload) {
//     // Get.to(() => NotificationsScreen());
//     NotificationModel model = NotificationModel.fromJson(jsonDecode(payload));
//
//     Logger.m(tag: "NOTIFICATION", value: model.notificationType);
//
//     Helper.openNotification(model);
//   }
//
//   static void _initFcmNotification() async {
//     // if (Platform.isIOS) {
//     //   await _messaging.requestNotificationPermissions(
//     //       IosNotificationSettings(alert: true, badge: true, provisional: false, sound: true));
//     // }
//
//     _messaging.getToken().then((fcmToken) {
//       Logger.m(tag: "FCM TOKE ", value: fcmToken);
//       Repository.instance!.updateCredentials(fcmToken: fcmToken);
//     });
//
//     _messaging.getInitialMessage().then((RemoteMessage message) {
//       if (message != null) {
//         NotificationModel model = NotificationModel.fromRemoteMessage(message);
//         _notificationViewer.showNotification(model);
//       }
//     });
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification notification = message.notification;
//       AndroidNotification android = message.notification?.android;
//
//       if (notification != null && android != null) {
//         NotificationModel model = NotificationModel.fromRemoteMessage(message);
//         _notificationViewer.showNotification(model);
//       }
//     });
//
//     // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     //   Notification model = Notification.fromRemoteMessage(message);
//     //   _notificationViewer.showNotification(model);
//     // });
//   }
// }
