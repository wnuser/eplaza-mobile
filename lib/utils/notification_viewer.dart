// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:e_plaza/modals/notification_model.dart';
// import 'package:e_plaza/utils/helper.dart';
// import 'package:e_plaza/utils/logger.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:path_provider/path_provider.dart';
//
// class NotificationViewer {
//   late NotificationModel _notificationModel;
//   static String _CHANNEL_ID = 'appName'.t;
//   static String _CHANNEL_NAME = 'appName'.t;
//   static String _CHANNEL_DESCRIPTION = 'appName'.t;
//
//   late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
//   var _generalNotificationDetails;
//
//   SelectNotificationCallback? _onSelectNotification;
//
//   NotificationViewer(this._onSelectNotification) {
//     var android = new AndroidInitializationSettings('@drawable/app_icon');
//     var ios = new IOSInitializationSettings();
//     var mac = new MacOSInitializationSettings();
//     var settings = new InitializationSettings(android: android, iOS: ios, macOS: mac);
//     _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//     _flutterLocalNotificationsPlugin.initialize(settings,
//         onSelectNotification: this._onSelectNotification);
//
//     var androidDetails = AndroidNotificationDetails(
//         _CHANNEL_ID, _CHANNEL_NAME, _CHANNEL_DESCRIPTION,
//         importance: Importance.max, priority: Priority.high, ticker: 'ticker');
//     var iSODetails = new IOSNotificationDetails();
//     var macOsDetails = new MacOSNotificationDetails();
//     _generalNotificationDetails =
//         NotificationDetails(android: androidDetails, iOS: iSODetails, macOS: macOsDetails);
//   }
//
//   // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   void showNotification(NotificationModel model) {
//     this._notificationModel = model;
//
//     if (_notificationModel.image.notEmpty) {
//       _showBigPictureNotification();
//     } else if (_notificationModel.body.nullSafe.length > 100) {
//       _showBigTextNotification();
//     } else {
//       _showNotification();
//     }
//
//     // switch (_notificationModel.notificationType) {
//     //   case NotificationType.BIG_TEXT:
//     //     _showBigTextNotification();
//     //     break;
//     //   case NotificationType.SMALL_IMAGE:
//     //     _showBigPictureNotificationHiddenLargeIcon();
//     //     break;
//     //   case NotificationType.BIG_IMAGE:
//     //     _showBigPictureNotification();
//     //     break;
//     //   default:
//     //     _showNotification();
//     //     break;
//     // }
//   }
//
//   Future<void> _showNotification() async {
//     await _flutterLocalNotificationsPlugin.show(
//         0, _notificationModel.title, _notificationModel.body, _generalNotificationDetails,
//         payload: jsonEncode(_notificationModel.toJson()));
//   }
//
//   // Future<void> _cancelNotification() async {
//   //   await _flutterLocalNotificationsPlugin.cancel(0);
//   // }
//   //
//   // Future<void> _cancelNotificationWithTag() async {
//   //   await _flutterLocalNotificationsPlugin.cancel(0, tag: 'tag');
//   // }
//   //
//   // Future<void> _showNotificationCustomSound() async {
//   //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//   //     _CHANNEL_ID,
//   //     _CHANNEL_NAME,
//   //     _CHANNEL_DESCRIPTION,
//   //     sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//   //   );
//   //   const IOSNotificationDetails iOSPlatformChannelSpecifics =
//   //       IOSNotificationDetails(sound: 'slow_spring_board.aiff');
//   //   const MacOSNotificationDetails macOSPlatformChannelSpecifics =
//   //       MacOSNotificationDetails(sound: 'slow_spring_board.aiff');
//   //   const NotificationDetails platformChannelSpecifics = NotificationDetails(
//   //       android: androidPlatformChannelSpecifics,
//   //       iOS: iOSPlatformChannelSpecifics,
//   //       macOS: macOSPlatformChannelSpecifics);
//   //   await _flutterLocalNotificationsPlugin.show(0, 'custom sound notification title',
//   //       'custom sound notification body', platformChannelSpecifics);
//   // }
//   //
//   // Future<void> _showNotificationCustomVibrationIconLed() async {
//   //   final Int64List vibrationPattern = Int64List(4);
//   //   vibrationPattern[0] = 0;
//   //   vibrationPattern[1] = 1000;
//   //   vibrationPattern[2] = 5000;
//   //   vibrationPattern[3] = 2000;
//   //
//   //   final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//   //       'other custom channel id', 'other custom channel name', 'other custom channel description',
//   //       icon: 'secondary_icon',
//   //       largeIcon: const DrawableResourceAndroidBitmap('sample_large_icon'),
//   //       vibrationPattern: vibrationPattern,
//   //       enableLights: true,
//   //       color: const Color.fromARGB(255, 255, 0, 0),
//   //       ledColor: const Color.fromARGB(255, 255, 0, 0),
//   //       ledOnMs: 1000,
//   //       ledOffMs: 500);
//   //
//   //   final NotificationDetails platformChannelSpecifics =
//   //       NotificationDetails(android: androidPlatformChannelSpecifics);
//   //   await _flutterLocalNotificationsPlugin.show(
//   //       0,
//   //       'title of notification with custom vibration pattern, LED and icon',
//   //       'body of notification with custom vibration pattern, LED and icon',
//   //       platformChannelSpecifics);
//   // }
//   //
//   // Future<void> _zonedScheduleNotification() async {
//   //   await flutterLocalNotificationsPlugin.zonedSchedule(
//   //       0,
//   //       'scheduled title',
//   //       'scheduled body',
//   //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
//   //       const NotificationDetails(
//   //           android: AndroidNotificationDetails(_CHANNEL_ID,
//   //               _CHANNEL_NAME, _CHANNEL_DESCRIPTION)),
//   //       androidAllowWhileIdle: true,
//   //       uiLocalNotificationDateInterpretation:
//   //       UILocalNotificationDateInterpretation.absoluteTime);
//   // }
//   //
//   // Future<void> _showNotificationWithNoSound() async {
//   //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//   //       'silent channel id', 'silent channel name', 'silent channel description',
//   //       playSound: false, styleInformation: DefaultStyleInformation(true, true));
//   //   const IOSNotificationDetails iOSPlatformChannelSpecifics =
//   //       IOSNotificationDetails(presentSound: false);
//   //   const MacOSNotificationDetails macOSPlatformChannelSpecifics =
//   //       MacOSNotificationDetails(presentSound: false);
//   //   const NotificationDetails platformChannelSpecifics = NotificationDetails(
//   //       android: androidPlatformChannelSpecifics,
//   //       iOS: iOSPlatformChannelSpecifics,
//   //       macOS: macOSPlatformChannelSpecifics);
//   //   await _flutterLocalNotificationsPlugin.show(
//   //       0, '<b>silent</b> title', '<b>silent</b> body', platformChannelSpecifics);
//   // }
//   //
//   // Future<void> _showTimeoutNotification() async {
//   //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//   //       'silent channel id', 'silent channel name', 'silent channel description',
//   //       timeoutAfter: 3000, styleInformation: DefaultStyleInformation(true, true));
//   //   const NotificationDetails platformChannelSpecifics =
//   //       NotificationDetails(android: androidPlatformChannelSpecifics);
//   //   await _flutterLocalNotificationsPlugin.show(
//   //       0, 'timeout notification', 'Times out after 3 seconds', platformChannelSpecifics);
//   // }
//   //
//   // Future<void> _showInsistentNotification() async {
//   //   // This value is from: https://developer.android.com/reference/android/app/Notification.html#FLAG_INSISTENT
//   //   const int insistentFlag = 4;
//   //   final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//   //       _CHANNEL_ID, _CHANNEL_NAME, _CHANNEL_DESCRIPTION,
//   //       importance: Importance.max,
//   //       priority: Priority.high,
//   //       ticker: 'ticker',
//   //       additionalFlags: Int32List.fromList(<int>[insistentFlag]));
//   //   final NotificationDetails platformChannelSpecifics =
//   //       NotificationDetails(android: androidPlatformChannelSpecifics);
//   //   await _flutterLocalNotificationsPlugin
//   //       .show(0, 'insistent title', 'insistent body', platformChannelSpecifics, payload: 'item x');
//   // }
//
//   Future<String> _downloadAndSaveFile(String url, String fileName) async {
//     Logger.m(tag: 'IMAGE URL', value: url);
//     final Directory directory = await getApplicationDocumentsDirectory();
//     final String filePath = '${directory.path}/$fileName';
//     Response response = await Dio().get(
//       url,
//       options: Options(
//         responseType: ResponseType.bytes,
//         followRedirects: false,
//         /*validateStatus: (status) {
//             return status < 500;
//           }*/
//       ),
//     );
//     final File file = File(filePath);
//     await file.writeAsBytes(response.data);
//     return filePath;
//   }
//
//   Future<void> _showBigPictureNotification() async {
//     // final String largeIconPath = await _downloadAndSaveFile('https://via.placeholder.com/48x48', 'largeIcon');
//     final String bigPicturePath =
//         await _downloadAndSaveFile(_notificationModel.image.nullSafe, 'bigPicture');
//     final BigPictureStyleInformation bigPictureStyleInformation =
//         BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
//             // largeIcon: FilePathAndroidBitmap(bigPicturePath),
//             contentTitle: _notificationModel.title,
//             summaryText: _notificationModel.body);
//     final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         _CHANNEL_ID, _CHANNEL_NAME, _CHANNEL_DESCRIPTION,
//         styleInformation: bigPictureStyleInformation);
//     final NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await _flutterLocalNotificationsPlugin.show(
//         0, _notificationModel.title, _notificationModel.body, platformChannelSpecifics,
//         payload: jsonEncode(_notificationModel.toJson()));
//   }
//
//   Future<void> _showBigPictureNotificationHiddenLargeIcon() async {
//     final String largeIconPath =
//         await _downloadAndSaveFile(_notificationModel.image.nullSafe, 'largeIcon');
//     final String bigPicturePath =
//         await _downloadAndSaveFile(_notificationModel.image.nullSafe, 'bigPicture');
//     final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
//       FilePathAndroidBitmap(bigPicturePath),
//       largeIcon: FilePathAndroidBitmap(bigPicturePath),
//       hideExpandedLargeIcon: true,
//       contentTitle: _notificationModel.title,
//       summaryText: _notificationModel.body,
//     );
//
//     final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         _CHANNEL_ID, _CHANNEL_NAME, _CHANNEL_DESCRIPTION,
//         largeIcon: FilePathAndroidBitmap(largeIconPath),
//         styleInformation: bigPictureStyleInformation);
//     final NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await _flutterLocalNotificationsPlugin.show(
//         0, 'big text title', 'silent body', platformChannelSpecifics,
//         payload: jsonEncode(_notificationModel.toJson()));
//   }
//
//   // Future<void> _showNotificationMediaStyle() async {
//   //   final String largeIconPath = await _downloadAndSaveFile(
//   //       'https://via.placeholder.com/128x128/00FF00/000000', 'largeIcon');
//   //   final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//   //     'media channel id',
//   //     'media channel name',
//   //     'media channel description',
//   //     largeIcon: FilePathAndroidBitmap(largeIconPath),
//   //     styleInformation: const MediaStyleInformation(),
//   //   );
//   //   final NotificationDetails platformChannelSpecifics =
//   //       NotificationDetails(android: androidPlatformChannelSpecifics);
//   //   await _flutterLocalNotificationsPlugin.show(
//   //       0, 'notification title', 'notification body', platformChannelSpecifics);
//   // }
//
//   Future<void> _showBigTextNotification() async {
//     BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
//       _notificationModel.body.nullSafe,
//       htmlFormatBigText: true,
//       contentTitle: _notificationModel.title,
//       htmlFormatContentTitle: true,
//       summaryText: '<i>Notification</i>',
//       htmlFormatSummaryText: true,
//     );
//     AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         _CHANNEL_ID, _CHANNEL_NAME, _CHANNEL_DESCRIPTION,
//         styleInformation: bigTextStyleInformation);
//     IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
//     NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);
//     await _flutterLocalNotificationsPlugin.show(
//         0, _notificationModel.title, _notificationModel.body, platformChannelSpecifics,
//         payload: jsonEncode(_notificationModel.toJson()));
//   }
//
// // Future<void> _showInboxNotification() async {
// //   final List<String> lines = <String>['line <b>1</b>', 'line <i>2</i>'];
// //   final InboxStyleInformation inboxStyleInformation = InboxStyleInformation(lines,
// //       htmlFormatLines: true,
// //       contentTitle: 'overridden <b>inbox</b> context title',
// //       htmlFormatContentTitle: true,
// //       summaryText: 'summary <i>text</i>',
// //       htmlFormatSummaryText: true);
// //   final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //       'inbox channel id', 'inboxchannel name', 'inbox channel description',
// //       styleInformation: inboxStyleInformation);
// //   final NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(
// //       0, 'inbox title', 'inbox body', platformChannelSpecifics);
// // }
// //
// // Future<void> _showGroupedNotifications() async {
// //   const String groupKey = 'com.android.example.WORK_EMAIL';
// //   const String groupChannelId = 'grouped channel id';
// //   const String groupChannelName = 'grouped channel name';
// //   const String groupChannelDescription = 'grouped channel description';
// //   // example based on https://developer.android.com/training/notify-user/group.html
// //   const AndroidNotificationDetails firstNotificationAndroidSpecifics = AndroidNotificationDetails(
// //       groupChannelId, groupChannelName, groupChannelDescription,
// //       importance: Importance.max, priority: Priority.high, groupKey: groupKey);
// //   const NotificationDetails firstNotificationPlatformSpecifics =
// //       NotificationDetails(android: firstNotificationAndroidSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(
// //       1, 'Alex Faarborg', 'You will not believe...', firstNotificationPlatformSpecifics);
// //   const AndroidNotificationDetails secondNotificationAndroidSpecifics =
// //       AndroidNotificationDetails(groupChannelId, groupChannelName, groupChannelDescription,
// //           importance: Importance.max, priority: Priority.high, groupKey: groupKey);
// //   const NotificationDetails secondNotificationPlatformSpecifics =
// //       NotificationDetails(android: secondNotificationAndroidSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(
// //       2, 'Jeff Chang', 'Please join us to celebrate the...', secondNotificationPlatformSpecifics);
// //
// //   // Create the summary notification to support older devices that pre-date
// //   /// Android 7.0 (API level 24).
// //   ///
// //   /// Recommended to create this regardless as the behaviour may vary as
// //   /// mentioned in https://developer.android.com/training/notify-user/group
// //   const List<String> lines = <String>[
// //     'Alex Faarborg  Check this out',
// //     'Jeff Chang    Launch Party'
// //   ];
// //   const InboxStyleInformation inboxStyleInformation = InboxStyleInformation(lines,
// //       contentTitle: '2 messages', summaryText: 'janedoe@example.com');
// //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //       groupChannelId, groupChannelName, groupChannelDescription,
// //       styleInformation: inboxStyleInformation, groupKey: groupKey, setAsGroupSummary: true);
// //   const NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(
// //       3, 'Attention', 'Two messages', platformChannelSpecifics);
// // }
// //
// // Future<void> _showNotificationWithTag() async {
// //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //       _CHANNEL_ID, _CHANNEL_NAME, _CHANNEL_DESCRIPTION,
// //       importance: Importance.max, priority: Priority.high, tag: 'tag');
// //   const NotificationDetails platformChannelSpecifics = NotificationDetails(
// //     android: androidPlatformChannelSpecifics,
// //   );
// //   await _flutterLocalNotificationsPlugin.show(
// //       0, 'first notification', null, platformChannelSpecifics);
// // }
// //
// // Future<void> _checkPendingNotificationRequests() async {
// //   final List<PendingNotificationRequest> pendingNotificationRequests =
// //       await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
// //   return showDialog<void>(
// //     context: _context,
// //     builder: (BuildContext context) => AlertDialog(
// //       content: Text('${pendingNotificationRequests.length} pending notification '
// //           'requests'),
// //       actions: <Widget>[
// //         TextButton(
// //           onPressed: () {
// //             Navigator.of(context).pop();
// //           },
// //           child: const Text('OK'),
// //         ),
// //       ],
// //     ),
// //   );
// // }
// //
// // Future<void> _cancelAllNotifications() async {
// //   await _flutterLocalNotificationsPlugin.cancelAll();
// // }
// //
// // Future<void> _showOngoingNotification() async {
// //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //       _CHANNEL_ID, _CHANNEL_NAME, _CHANNEL_DESCRIPTION,
// //       importance: Importance.max, priority: Priority.high, ongoing: true, autoCancel: false);
// //   const NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(
// //       0, 'ongoing notification title', 'ongoing notification body', platformChannelSpecifics);
// // }
// //
// // Future<void> _repeatNotification() async {
// //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //       'repeating channel id', 'repeating channel name', 'repeating description');
// //   const NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title', 'repeating body',
// //       RepeatInterval.everyMinute, platformChannelSpecifics,
// //       androidAllowWhileIdle: true);
// // }
// //
// // Future<void> _scheduleDailyTenAMNotification() async {
// //   await flutterLocalNotificationsPlugin.zonedSchedule(
// //       0,
// //       'daily scheduled notification title',
// //       'daily scheduled notification body',
// //       _nextInstanceOfTenAM(),
// //       const NotificationDetails(
// //         android: AndroidNotificationDetails(
// //             'daily notification channel id',
// //             'daily notification channel name',
// //             'daily notification description'),
// //       ),
// //       androidAllowWhileIdle: true,
// //       uiLocalNotificationDateInterpretation:
// //       UILocalNotificationDateInterpretation.absoluteTime,
// //       matchDateTimeComponents: DateTimeComponents.time);
// // }
// //
// // /// To test we don't validate past dates when using `matchDateTimeComponents`
// // Future<void> _scheduleDailyTenAMLastYearNotification() async {
// //   await flutterLocalNotificationsPlugin.zonedSchedule(
// //       0,
// //       'daily scheduled notification title',
// //       'daily scheduled notification body',
// //       _nextInstanceOfTenAMLastYear(),
// //       const NotificationDetails(
// //         android: AndroidNotificationDetails(
// //             'daily notification channel id',
// //             'daily notification channel name',
// //             'daily notification description'),
// //       ),
// //       androidAllowWhileIdle: true,
// //       uiLocalNotificationDateInterpretation:
// //       UILocalNotificationDateInterpretation.absoluteTime,
// //       matchDateTimeComponents: DateTimeComponents.time);
// // }
// //
// // Future<void> _scheduleWeeklyTenAMNotification() async {
// //   await flutterLocalNotificationsPlugin.zonedSchedule(
// //       0,
// //       'weekly scheduled notification title',
// //       'weekly scheduled notification body',
// //       _nextInstanceOfTenAM(),
// //       const NotificationDetails(
// //         android: AndroidNotificationDetails(
// //             'weekly notification channel id',
// //             'weekly notification channel name',
// //             'weekly notificationdescription'),
// //       ),
// //       androidAllowWhileIdle: true,
// //       uiLocalNotificationDateInterpretation:
// //       UILocalNotificationDateInterpretation.absoluteTime,
// //       matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
// // }
// //
// // Future<void> _scheduleWeeklyMondayTenAMNotification() async {
// //   await flutterLocalNotificationsPlugin.zonedSchedule(
// //       0,
// //       'weekly scheduled notification title',
// //       'weekly scheduled notification body',
// //       _nextInstanceOfMondayTenAM(),
// //       const NotificationDetails(
// //         android: AndroidNotificationDetails(
// //             'weekly notification channel id',
// //             'weekly notification channel name',
// //             'weekly notificationdescription'),
// //       ),
// //       androidAllowWhileIdle: true,
// //       uiLocalNotificationDateInterpretation:
// //       UILocalNotificationDateInterpretation.absoluteTime,
// //       matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
// // }
// //
// // tz.TZDateTime _nextInstanceOfTenAM() {
// //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
// //   tz.TZDateTime scheduledDate =
// //   tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
// //   if (scheduledDate.isBefore(now)) {
// //     scheduledDate = scheduledDate.add(const Duration(days: 1));
// //   }
// //   return scheduledDate;
// // }
// //
// // tz.TZDateTime _nextInstanceOfTenAMLastYear() {
// //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
// //   return tz.TZDateTime(tz.local, now.year - 1, now.month, now.day, 10);
// // }
// //
// // tz.TZDateTime _nextInstanceOfMondayTenAM() {
// //   tz.TZDateTime scheduledDate = _nextInstanceOfTenAM();
// //   while (scheduledDate.weekday != DateTime.monday) {
// //     scheduledDate = scheduledDate.add(const Duration(days: 1));
// //   }
// //   return scheduledDate;
// // }
// //
// // Future<void> _showNotificationWithNoBadge() async {
// //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //       'no badge channel', 'no badge name', 'no badge description',
// //       channelShowBadge: false,
// //       importance: Importance.max,
// //       priority: Priority.high,
// //       onlyAlertOnce: true);
// //   const NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin
// //       .show(0, 'no badge title', 'no badge body', platformChannelSpecifics, payload: 'item x');
// // }
// //
// // Future<void> _showProgressNotification() async {
// //   const int maxProgress = 5;
// //   for (int i = 0; i <= maxProgress; i++) {
// //     await Future<void>.delayed(const Duration(seconds: 1), () async {
// //       final AndroidNotificationDetails androidPlatformChannelSpecifics =
// //           AndroidNotificationDetails(
// //               'progress channel', 'progress channel', 'progress channel description',
// //               channelShowBadge: false,
// //               importance: Importance.max,
// //               priority: Priority.high,
// //               onlyAlertOnce: true,
// //               showProgress: true,
// //               maxProgress: maxProgress,
// //               progress: i);
// //       final NotificationDetails platformChannelSpecifics =
// //           NotificationDetails(android: androidPlatformChannelSpecifics);
// //       await _flutterLocalNotificationsPlugin.show(0, 'progress notification title',
// //           'progress notification body', platformChannelSpecifics,
// //           payload: 'item x');
// //     });
// //   }
// // }
// //
// // Future<void> _showIndeterminateProgressNotification() async {
// //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //       'indeterminate progress channel',
// //       'indeterminate progress channel',
// //       'indeterminate progress channel description',
// //       channelShowBadge: false,
// //       importance: Importance.max,
// //       priority: Priority.high,
// //       onlyAlertOnce: true,
// //       showProgress: true,
// //       indeterminate: true);
// //   const NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(0, 'indeterminate progress notification title',
// //       'indeterminate progress notification body', platformChannelSpecifics,
// //       payload: 'item x');
// // }
// //
// // Future<void> _showNotificationUpdateChannelDescription() async {
// //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //       _CHANNEL_ID, _CHANNEL_NAME, 'your updated channel description',
// //       importance: Importance.max,
// //       priority: Priority.high,
// //       channelAction: AndroidNotificationChannelAction.update);
// //   const NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(0, 'updated notification channel',
// //       'check settings to see updated channel description', platformChannelSpecifics,
// //       payload: 'item x');
// // }
// //
// // Future<void> _showPublicNotification() async {
// //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //       _CHANNEL_ID, _CHANNEL_NAME, _CHANNEL_DESCRIPTION,
// //       importance: Importance.max,
// //       priority: Priority.high,
// //       ticker: 'ticker',
// //       visibility: NotificationVisibility.public);
// //   const NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(
// //       0, 'public notification title', 'public notification body', platformChannelSpecifics,
// //       payload: 'item x');
// // }
// //
// // Future<void> _showNotificationWithSubtitle() async {
// //   const IOSNotificationDetails iOSPlatformChannelSpecifics =
// //       IOSNotificationDetails(subtitle: 'the subtitle');
// //   const MacOSNotificationDetails macOSPlatformChannelSpecifics =
// //       MacOSNotificationDetails(subtitle: 'the subtitle');
// //   const NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(iOS: iOSPlatformChannelSpecifics, macOS: macOSPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(0, 'title of notification with a subtitle',
// //       'body of notification with a subtitle', platformChannelSpecifics,
// //       payload: 'item x');
// // }
// //
// // Future<void> _showNotificationWithIconBadge() async {
// //   const IOSNotificationDetails iOSPlatformChannelSpecifics =
// //       IOSNotificationDetails(badgeNumber: 1);
// //   const MacOSNotificationDetails macOSPlatformChannelSpecifics =
// //       MacOSNotificationDetails(badgeNumber: 1);
// //   const NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(iOS: iOSPlatformChannelSpecifics, macOS: macOSPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(
// //       0, 'icon badge title', 'icon badge body', platformChannelSpecifics,
// //       payload: 'item x');
// // }
// //
// // Future<void> _showNotificationsWithThreadIdentifier() async {
// //   NotificationDetails buildNotificationDetailsForThread(
// //     String threadIdentifier,
// //   ) {
// //     final IOSNotificationDetails iOSPlatformChannelSpecifics =
// //         IOSNotificationDetails(threadIdentifier: threadIdentifier);
// //     final MacOSNotificationDetails macOSPlatformChannelSpecifics =
// //         MacOSNotificationDetails(threadIdentifier: threadIdentifier);
// //     return NotificationDetails(
// //         iOS: iOSPlatformChannelSpecifics, macOS: macOSPlatformChannelSpecifics);
// //   }
// //
// //   final NotificationDetails thread1PlatformChannelSpecifics =
// //       buildNotificationDetailsForThread('thread1');
// //   final NotificationDetails thread2PlatformChannelSpecifics =
// //       buildNotificationDetailsForThread('thread2');
// //
// //   await _flutterLocalNotificationsPlugin.show(
// //       0, 'thread 1', 'first notification', thread1PlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(
// //       1, 'thread 1', 'second notification', thread1PlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(
// //       2, 'thread 1', 'third notification', thread1PlatformChannelSpecifics);
// //
// //   await _flutterLocalNotificationsPlugin.show(
// //       3, 'thread 2', 'first notification', thread2PlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(
// //       4, 'thread 2', 'second notification', thread2PlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(
// //       5, 'thread 2', 'third notification', thread2PlatformChannelSpecifics);
// // }
// //
// // Future<void> _showNotificationWithoutTimestamp() async {
// //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //       _CHANNEL_ID, _CHANNEL_NAME, _CHANNEL_DESCRIPTION,
// //       importance: Importance.max, priority: Priority.high, showWhen: false);
// //   const NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin
// //       .show(0, 'plain title', 'plain body', platformChannelSpecifics, payload: 'item x');
// // }
// //
// // Future<void> _showNotificationWithCustomTimestamp() async {
// //   final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //     _CHANNEL_ID,
// //     _CHANNEL_NAME,
// //     _CHANNEL_DESCRIPTION,
// //     importance: Importance.max,
// //     priority: Priority.high,
// //     when: DateTime.now().millisecondsSinceEpoch - 120 * 1000,
// //   );
// //   final NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin
// //       .show(0, 'plain title', 'plain body', platformChannelSpecifics, payload: 'item x');
// // }
// //
// // Future<void> _showNotificationWithCustomSubText() async {
// //   const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //     _CHANNEL_ID,
// //     _CHANNEL_NAME,
// //     _CHANNEL_DESCRIPTION,
// //     importance: Importance.max,
// //     priority: Priority.high,
// //     showWhen: false,
// //     subText: 'custom subtext',
// //   );
// //   const NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin
// //       .show(0, 'plain title', 'plain body', platformChannelSpecifics, payload: 'item x');
// // }
// //
// // Future<void> _showNotificationWithChronometer() async {
// //   final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
// //     _CHANNEL_ID,
// //     _CHANNEL_NAME,
// //     _CHANNEL_DESCRIPTION,
// //     importance: Importance.max,
// //     priority: Priority.high,
// //     when: DateTime.now().millisecondsSinceEpoch - 120 * 1000,
// //     usesChronometer: true,
// //   );
// //   final NotificationDetails platformChannelSpecifics =
// //       NotificationDetails(android: androidPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin
// //       .show(0, 'plain title', 'plain body', platformChannelSpecifics, payload: 'item x');
// // }
// //
// // Future<void> _showNotificationWithAttachment() async {
// //   final String bigPicturePath =
// //       await _downloadAndSaveFile('https://via.placeholder.com/600x200', 'bigPicture.jpg');
// //   final IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails(
// //       attachments: <IOSNotificationAttachment>[IOSNotificationAttachment(bigPicturePath)]);
// //   final MacOSNotificationDetails macOSPlatformChannelSpecifics = MacOSNotificationDetails(
// //       attachments: <MacOSNotificationAttachment>[MacOSNotificationAttachment(bigPicturePath)]);
// //   final NotificationDetails notificationDetails =
// //       NotificationDetails(iOS: iOSPlatformChannelSpecifics, macOS: macOSPlatformChannelSpecifics);
// //   await _flutterLocalNotificationsPlugin.show(0, 'notification with attachment title',
// //       'notification with attachment body', notificationDetails);
// // }
// //
// // Future<void> _createNotificationChannelGroup() async {
// //   const String channelGroupId = 'your channel group id';
// //   // create the group first
// //   const AndroidNotificationChannelGroup androidNotificationChannelGroup =
// //       AndroidNotificationChannelGroup(channelGroupId, 'your channel group name',
// //           description: 'your channel group description');
// //   await _flutterLocalNotificationsPlugin
// //       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
// //       .createNotificationChannelGroup(androidNotificationChannelGroup);
// //
// //   // create channels associated with the group
// //   await _flutterLocalNotificationsPlugin
// //       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
// //       .createNotificationChannel(const AndroidNotificationChannel(
// //           'grouped channel id 1', 'grouped channel name 1', 'grouped channel description 1',
// //           groupId: channelGroupId));
// //
// //   await _flutterLocalNotificationsPlugin
// //       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
// //       .createNotificationChannel(const AndroidNotificationChannel(
// //           'grouped channel id 2', 'grouped channel name 2', 'grouped channel description 2',
// //           groupId: channelGroupId));
// //
// //   await showDialog<void>(
// //       context: _context,
// //       builder: (BuildContext context) => AlertDialog(
// //             content: Text('Channel group with name '
// //                 '${androidNotificationChannelGroup.name} created'),
// //             actions: <Widget>[
// //               TextButton(
// //                 onPressed: () {
// //                   Navigator.of(context).pop();
// //                 },
// //                 child: const Text('OK'),
// //               ),
// //             ],
// //           ));
// // }
// //
// // Future<void> _deleteNotificationChannelGroup() async {
// //   const String channelGroupId = 'your channel group id';
// //   await _flutterLocalNotificationsPlugin
// //       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
// //       ?.deleteNotificationChannelGroup(channelGroupId);
// //
// //   await showDialog<void>(
// //     context: _context,
// //     builder: (BuildContext context) => AlertDialog(
// //       content: const Text('Channel group with id $channelGroupId deleted'),
// //       actions: <Widget>[
// //         TextButton(
// //           onPressed: () {
// //             Navigator.of(context).pop();
// //           },
// //           child: const Text('OK'),
// //         ),
// //       ],
// //     ),
// //   );
// // }
// //
// // Future<void> _createNotificationChannel() async {
// //   const AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
// //     'your channel id 2',
// //     'your channel name 2',
// //     'your channel description 2',
// //   );
// //   await _flutterLocalNotificationsPlugin
// //       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
// //       ?.createNotificationChannel(androidNotificationChannel);
// //
// //   await showDialog<void>(
// //       context: _context,
// //       builder: (BuildContext context) => AlertDialog(
// //             content: Text('Channel with name ${androidNotificationChannel.name} '
// //                 'created'),
// //             actions: <Widget>[
// //               TextButton(
// //                 onPressed: () {
// //                   Navigator.of(context).pop();
// //                 },
// //                 child: const Text('OK'),
// //               ),
// //             ],
// //           ));
// // }
// //
// // Future<void> _deleteNotificationChannel() async {
// //   const String channelId = 'your channel id 2';
// //   await _flutterLocalNotificationsPlugin
// //       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
// //       ?.deleteNotificationChannel(channelId);
// //
// //   await showDialog<void>(
// //     context: _context,
// //     builder: (BuildContext context) => AlertDialog(
// //       content: const Text('Channel with id $channelId deleted'),
// //       actions: <Widget>[
// //         TextButton(
// //           onPressed: () {
// //             Navigator.of(context).pop();
// //           },
// //           child: const Text('OK'),
// //         ),
// //       ],
// //     ),
// //   );
// // }
// //
// // Future<void> _getActiveNotifications() async {
// //   final Widget activeNotificationsDialogContent = await _getActiveNotificationsDialogContent();
// //   await showDialog<void>(
// //     context: context,
// //     builder: (BuildContext context) => AlertDialog(
// //       content: activeNotificationsDialogContent,
// //       actions: <Widget>[
// //         TextButton(
// //           onPressed: () {
// //             Navigator.of(context).pop();
// //           },
// //           child: const Text('OK'),
// //         ),
// //       ],
// //     ),
// //   );
// // }
//
// // Future<Widget> _getActiveNotificationsDialogContent() async {
// //   final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
// //   final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
// //   if (!(androidInfo.version.sdkInt >= 23)) {
// //     return const Text(
// //       '"getActiveNotifications" is available only for Android 6.0 or newer',
// //     );
// //   }
// //
// //   try {
// //     final List<ActiveNotification> activeNotifications = await flutterLocalNotificationsPlugin
// //         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
// //         .getActiveNotifications();
// //
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       mainAxisSize: MainAxisSize.min,
// //       children: <Widget>[
// //         const Text(
// //           'Active Notifications',
// //           style: MyTextStyle(fontWeight: FontWeight.bold),
// //         ),
// //         const Divider(color: Colors.black),
// //         if (activeNotifications.isEmpty) const Text('No active notifications'),
// //         if (activeNotifications.isNotEmpty)
// //           for (ActiveNotification activeNotification in activeNotifications)
// //             Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: <Widget>[
// //                 Text(
// //                   'id: ${activeNotification.id}\n'
// //                   'channelId: ${activeNotification.channelId}\n'
// //                   'title: ${activeNotification.title}\n'
// //                   'body: ${activeNotification.body}',
// //                 ),
// //                 const Divider(color: Colors.black),
// //               ],
// //             ),
// //       ],
// //     );
// //   } on PlatformException catch (error) {
// //     return Text(
// //       'Error calling "getActiveNotifications"\n'
// //       'code: ${error.code}\n'
// //       'message: ${error.message}',
// //     );
// //   }
// // }
// //
// // Future<void> _getNotificationChannels() async {
// //   final Widget notificationChannelsDialogContent = await _getNotificationChannelsDialogContent();
// //   await showDialog<void>(
// //     context: _context,
// //     builder: (BuildContext context) => AlertDialog(
// //       content: notificationChannelsDialogContent,
// //       actions: <Widget>[
// //         TextButton(
// //           onPressed: () {
// //             Navigator.of(context).pop();
// //           },
// //           child: const Text('OK'),
// //         ),
// //       ],
// //     ),
// //   );
// // }
// //
// // Future<Widget> _getNotificationChannelsDialogContent() async {
// //   try {
// //     final List<AndroidNotificationChannel> channels = await _flutterLocalNotificationsPlugin
// //         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
// //         .getNotificationChannels();
// //
// //     return Container(
// //       width: double.maxFinite,
// //       child: ListView(
// //         children: <Widget>[
// //           const Text(
// //             'Notifications Channels',
// //             style: MyTextStyle(fontWeight: FontWeight.bold),
// //           ),
// //           const Divider(color: Colors.black),
// //           if (channels?.isEmpty ?? true)
// //             const Text('No notification channels')
// //           else
// //             for (AndroidNotificationChannel channel in channels)
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: <Widget>[
// //                   Text('id: ${channel.id}\n'
// //                       'name: ${channel.name}\n'
// //                       'description: ${channel.description}\n'
// //                       'groupId: ${channel.groupId}\n'
// //                       'importance: ${channel.importance.value}\n'
// //                       'playSound: ${channel.playSound}\n'
// //                       'sound: ${channel.sound?.sound}\n'
// //                       'enableVibration: ${channel.enableVibration}\n'
// //                       'vibrationPattern: ${channel.vibrationPattern}\n'
// //                       'showBadge: ${channel.showBadge}\n'
// //                       'enableLights: ${channel.enableLights}\n'
// //                       'ledColor: ${channel.ledColor}\n'),
// //                   const Divider(color: Colors.black),
// //                 ],
// //               ),
// //         ],
// //       ),
// //     );
// //   } on PlatformException catch (error) {
// //     return Text(
// //       'Error calling "getNotificationChannels"\n'
// //       'code: ${error.code}\n'
// //       'message: ${error.message}',
// //     );
// //   }
// // }
// }
