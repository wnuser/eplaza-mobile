import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:e_plaza_vendor/dialogs/alert_dialog.dart';
import 'package:e_plaza_vendor/modals/notification_model.dart' as no;
import 'package:e_plaza_vendor/modals/notification_model.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/preference.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../screens/login/login.dart';
import '../values/theme_colors.dart';
import 'logger.dart';

typedef RefreshCallback = void Function();

class Helper {
  static const String DATE_FORMAT_1 = "yyyy_MM_dd_HH_mm_ss";
  static const String DATE_FORMAT_2 = "yyyy-MM-dd HH:mm:ss";
  static const String DATE_FORMAT_3 = "dd MMM yyyy, hh:mm a";
  static const String DATE_FORMAT_4 = "dd MMM yyyy";
  static const String DATE_FORMAT_5 = "EEE, dd MMM yyyy, hh:mm a";
  static const String DATE_FORMAT_6 = "EEE, dd MMM yy";
  static const String DATE_FORMAT_7 = "EEE, dd MMM, hh:mm a";
  static const String DATE_FORMAT_8 = "EEE, dd MMM, yyyy";
  static const String TIME_FORMAT_1 = "hh:mm a";
  static const String TIME_FORMAT_2 = "hh:mm:ss";
  static Map<String, RefreshCallback> fastRefreshCallbacks = <String, RefreshCallback>{};
  static Map<String, RefreshCallback> refreshCallbacks = <String, RefreshCallback>{};
  static Timer? _timer;
  static double buttonWidth = 70.w;

  static final RxBool networkAvailable = true.obs;
  static final RxString errorTitle = ''.obs;
  static final RxString errorMessage = ''.obs;

  static setError(String title, String message) {
    errorTitle.value = title;
    errorMessage.value = message;
  }

  static clearError() {
    errorTitle.value = '';
    errorMessage.value = '';
  }

  static bool get isDeveloper => kDebugMode;

  static const List<String> validImageExtensions = ['png', 'jpg', 'jpeg', 'webp'];

  static void initAutoRefreshTimer({int delayInSeconds = 4}) {
    // if (Const.isDeveloper) return; //TODO

    if (_timer != null) {
      _timer?.cancel();
    }

    _timer = Timer.periodic(Duration(seconds: delayInSeconds), (timer) {
      if (Const.lifecycleState == AppLifecycleState.resumed) {
        fastRefreshCallbacks.forEach((key, value) => value.call());

        if (timer.tick.isOdd) {
          refreshCallbacks.forEach((key, value) => value.call());
        }
      }
    });
  }

  static void addRefreshCallback(String key, VoidCallback callback, {bool fastRefresh = false}) {
    if (fastRefresh) {
      if (!fastRefreshCallbacks.containsKey(key)) {
        fastRefreshCallbacks.putIfAbsent(key, () => callback);
      } /* else {
        Logger.m(tag: '!!!!!!!!!! Callback already exist !!!!!!!!!!', value: key);
      }*/
    } else {
      if (!refreshCallbacks.containsKey(key)) {
        refreshCallbacks.putIfAbsent(key, () => callback);
      } /* else {
        Logger.m(tag: '!!!!!!!!!! Callback already exist !!!!!!!!!!', value: key);
      }*/
    }
  }

  static void removeAutoRefreshCallback(String key) {
    if (fastRefreshCallbacks.containsKey(key)) fastRefreshCallbacks.remove(key);
    if (fastRefreshCallbacks.containsKey(key)) refreshCallbacks.remove(key);
    Logger.m(tag: 'Removed From Refresh Callback', value: key);
  }

  static int parseInt(dynamic value) {
    if (value == null || value.toString().empty) {
      Logger.m(tag: 'INTEGER PARSE ERROR', value: 'NULL VALUE');
      return 0;
    }

    if (value is int) {
      return value;
    }

    if (value is String) {
      try {
        return value != null && value.isNotEmpty ? int.parse(value) : 0;
      } catch (e) {
        Logger.m(tag: 'INTEGER PARSE ERROR', value: e);
      }
    }

    if (value is double) {
      return value.toInt();
    }

    return 0;
  }

  static double parseDouble(dynamic value) {
    if (value == null) {
      return 0.0;
    }

    if (value is int) {
      return value.toDouble();
    }

    if (value is String) {
      try {
        return value.isNotEmpty ? double.parse(value) : 0;
      } catch (e) {
        return 0.0;
      }
    }

    if (value is double) {
      return value;
    }

    return 0.0;
  }

  static String parseString(dynamic value) {
    if (value == null) {
      return '';
    }

    if (value is String) {
      return value;
    }

    return value.toString();
  }

  static String checkNull(String value, {String defaultValue = ''}) {
    if (!isEmpty(value)) {
      return value;
    }
    return defaultValue.nullSafe;
  }

  static bool isEmpty(String? value) {
    return value == null || value == '' || value.isEmpty || value == 'null';
  }

  static bool isEmptyAny(List<String>? values) {
    if (values == null) {
      return true;
    }

    for (int i = 0; i < values.length; i++) {
      if (isEmpty(values[i])) {
        return true;
      }
    }
    return false;
  }

  static String? emptyValidator(String? string) {
    if (string == null || string.isEmpty) {
      return 'Please fill this field!';
    }
    return null;
  }

  static String? passwordValidator(String? string) {
    if (string == null || string.isEmpty) {
      return 'Please fill this field!';
    }

    if (string.length < 8) {
      return 'Password should have a minimum length of 8 characters';
    }

    if (!string.containsUppercase) {
      return 'Password should have a minimum of 1 uppercase letter';
    }

    List<String> chars = string.split('');

    int digitCount = 0;

    chars.forEach((element) {
      if (['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'].contains(element)) {
        digitCount++;
      }
    });

    if (digitCount < 2) {
      return 'Password should contain a minimum of 1 digit';
    }

    return null;
  }

  static Future<bool> requestPermission(Permission p) async {
    var permission = await p.request();

    if (permission != PermissionStatus.granted) {
      permission = await p.request();
    }

    return permission == PermissionStatus.granted;
  }

  static bool isValidUrl(String path,
      {String imageName = '',
      List<String> validExtensions = const ['png', 'jpg', 'jpeg', 'webp', 'pdf', 'doc', 'docx']}) {
    if (isEmpty(path)) {
      return false;
    }

    path = path + imageName.nullSafe;

    String ext = path.split('.').last;

    if (path.startsWith('http') && validExtensions.contains(ext)) {
      return true;
    }

    return false;
  }

  static Widget spaceVertical([double space = 5]) => SizedBox(width: 0, height: space);

  static Widget spaceHorizontal(double space) => Container(width: space, height: 0);

  static BoxDecoration get dialogBoxDecoration =>
      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3))
      ]);

  static String getEveryFirstDigit(String? name) {
    if (Helper.isEmpty(name)) {
      return '?';
    }

    List<String> li = name!.trim().split(' ');

    String str = '';

    if (li.length == 1 && li[0].length >= 2) {
      return li[0].substring(0, 2).toUpperCase();
    }

    li.forEach((element) => str += element.substring(0, 1));

    return str.toUpperCase();
  }

  // static String formatDays(String days) {
  //   if (isEmpty(days)) {
  //     return '';
  //   }
  //
  //   if (days == 'Mon,Tue,Wed,Thu,Fri,Sat,Sun') {
  //     return Strings.get('allDays');
  //   }
  //
  //   if (days == 'Mon,Tue,Wed,Thu,Fri,Sat') {
  //     return Strings.get('monday') + ' - ' + Strings.get('saturday');
  //   }
  //
  //   if (days == 'Mon,Tue,Wed,Thu,Fri') {
  //     return Strings.get('monday') + ' - ' + Strings.get('friday');
  //   }
  //
  //   if (days == 'Mon,Tue,Wed,Thu') {
  //     return Strings.get('monday') + ' - ' + Strings.get('thursday');
  //   }
  //
  //   if (days == 'Mon,Tue,Wed') {
  //     return Strings.get('monday') + ' - ' + Strings.get('wednesday');
  //   }
  //
  //   if (days == 'Mon,Tue') {
  //     return Strings.get('monday') + ' - ' + Strings.get('tuesday');
  //   }
  //
  //   if (days == 'Mon') {
  //     return Strings.get('monday');
  //   }
  //
  //   return days;
  // }

  static void openUrl(String url,
      {bool includeHttp = false,
      void Function()? success,
      void Function(String s)? onError,
      LaunchMode launchMode = LaunchMode.inAppWebView}) async {
    if (url.notEmpty) {
      try {
        if (includeHttp && !url.startsWith('https://')) {
          url = 'https://' + url;
        }
        await launchUrlString(url, mode: launchMode);
        if (success != null) success.call();
      } catch (e) {
        Logger.m(tag: 'openUrl', value: "'$url' Can\'t be launch! $e");
        onError?.call(e.toString());
      }
    } else {
      onError?.call("Can't launch url!");
    }
  }

  static String getTimeAgo(dynamic time) {
    if (time == null) {
      return '';
    }

    try {
      Duration diff;

      if (time.toString().isNumeric) {
        diff =
            DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(time.toString().toInt));
      } else {
        diff = DateTime.now().difference(DateTime.parse(time));
      }

      if (diff.inDays > 365)
        return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
      if (diff.inDays > 30)
        return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
      if (diff.inDays > 7)
        return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
      if (diff.inDays > 0) return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
      if (diff.inHours > 0) return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
      if (diff.inMinutes > 0)
        return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
      return "Just now";
    } catch (e) {
      Logger.ex(tag: 'GET TIME AGO', value: e);
      return time;
    }
  }

  static double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    if (lat1 <= 0.0 || lat2 <= 0 || lon1 <= 0 || lon2 <= 0) {
      return -1;
    }

    var p = 0.017453292519943295;
    var c = cos;
    var a =
        0.5 - c((lat2 - lat1) * p) / 2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static void pickImage(
    void Function(File file) success,
    void Function(String error) error, {
    List<CropAspectRatioPreset> ratio = const [
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    ImageSource source = ImageSource.gallery,
  }) async {
    bool permission = await Helper.requestPermission(Permission.storage);
    if (permission) {
      final ImagePicker _picker = ImagePicker();
      final pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null && pickedFile.path.notEmpty) {
        CroppedFile? file = await cropImageFile(pickedFile.path, ratio: ratio);

        if (file != null) {
          success(File(file.path));
        } else {
          error('noImageSelected'.t);
        }
      } else {
        error('noImageSelected'.t);
      }
    } else {
      error('Please grant storage permission and try again');
    }
  }

  static Future<CroppedFile?> cropImageFile(String path,
      {List<CropAspectRatioPreset> ratio = const []}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: ratio,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: Strings.get('crop'),
            toolbarColor: ThemeColors.colorPrimary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true),
        IOSUiSettings(
          title: Strings.get('crop'),
          minimumAspectRatio: 1.0,
          aspectRatioLockEnabled: true,
        ),
      ],
    );
    return croppedFile;
  }

  static int get currentMillis => DateTime.now().microsecondsSinceEpoch;

  static String getCurrentDate(String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(DateTime.now());
  }

  static String formatDate(DateTime dateTime, String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(dateTime);
  }

  static String formatMilliseconds(int milli, String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(DateTime.fromMillisecondsSinceEpoch(milli));
  }

  static String format(String dateTime, String format) {
    try {
      final DateFormat formatter = DateFormat(format);
      return formatter.format(DateTime.parse(dateTime.trim()));
    } catch (e) {
      Logger.e(tag: "DATE FORMAT : ", value: e.toString());
      return dateTime.nullSafe;
    }
  }

  static DateTime formatDateTime(String dateTime) {
    try {
      return DateTime.parse(dateTime);
    } catch (e) {
      Logger.e(tag: "DATE FORMAT : ", value: e.toString());
      return DateTime(1990);
    }
  }

  static int convertToMillis(String dateTime) {
    try {
      return DateTime.parse(dateTime).millisecondsSinceEpoch;
    } catch (e) {
      Logger.e(tag: "DATE FORMAT : ", value: e.toString());
      return DateTime(1990).millisecondsSinceEpoch;
    }
  }

  static String getDay(String dateTime) {
    try {
      final DateFormat formatter = DateFormat('d');
      return formatter.format(DateTime.parse(dateTime));
    } catch (e) {
      Logger.e(tag: "DATE FORMAT : ", value: e.toString());
      return '';
    }
  }

  static String createGroupId(String first, String second) {
    if (first.hashCode > second.hashCode) {
      return first + '__' + second;
    } else {
      return second + '__' + first;
    }
  }

  static bool isContainKeyword(String keyword, List<String> values) {
    if (!Helper.isEmpty(keyword) && values != null && values.length != 0) {
      for (int i = 0; i < values.length; i++) {
        if (!Helper.isEmpty(values[i]) && values[i].toLowerCase().contains(keyword.toLowerCase())) {
          return true;
        }
      }
    }
    return false;
  }

  static void shareApp() =>
      Share.share('Please download App From here https://play.google.com/store/apps/details?id=' +
          Const.packageName);

  // static Future<String> createImage(GlobalKey _key) async {
  //   //Wrap Widget in RepaintBoundary first
  //   RenderRepaintBoundary boundary = _key.currentContext.findRenderObject();
  //   ui.Image image = await boundary.toImage();
  //   ByteData data = await image.toByteData(format: ui.ImageByteFormat.png);
  //
  //   Directory dir = await getExternalStorageDirectory();
  //   var filePath = dir.path + '/' + DateTime.now().millisecondsSinceEpoch.toString() + '.png';
  //
  //   Uint8List pngBytes = data.buffer.asUint8List();
  //
  //   File file = await File(filePath).writeAsBytes(pngBytes);
  //
  //   return file.path;
  // }

  static int get generateNumber => Random().nextInt(900000) + 100000;

  // static Future<String> getDeviceInfo() async {
  //   Map<String, dynamic> _map = {};
  //
  //   // double pixelRatio = Get.pixelRatio.nullSafe;
  //
  //   if (PlatformType.isMobile) {
  //     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //
  //     if (Platform.isAndroid) {
  //       AndroidDeviceInfo build = await deviceInfo.androidInfo;
  //
  //       _map = {
  //         'OS TYPE': 'Android',
  //         'screenWidth': screenWidth,
  //         'screenHeight': screenHeight,
  //         // 'pixelRatio': pixelRatio,
  //         'version.securityPatch': build.version.securityPatch,
  //         'version.sdk': build.version.sdkInt,
  //         'version.release': build.version.release,
  //         'version.previewSdk': build.version.previewSdkInt,
  //         'version.incremental': build.version.incremental,
  //         'version.codename': build.version.codename,
  //         'version.baseOS': build.version.baseOS,
  //         'board': build.board,
  //         'bootloader': build.bootloader,
  //         'brand': build.brand,
  //         'display': build.display,
  //         'device': build.device,
  //         'fingerprint': build.fingerprint,
  //         'hardware': build.hardware,
  //         'host': build.host,
  //         'id': build.id,
  //         'manufacturer': build.manufacturer,
  //         'model': build.model,
  //         'product': build.product,
  //         'supported32BitAbis': build.supported32BitAbis,
  //         'supported64BitAbis': build.supported64BitAbis,
  //         'supportedAbis': build.supportedAbis,
  //         'tags': build.tags,
  //         'type': build.type,
  //         'isPhysicalDevice': build.isPhysicalDevice,
  //         'androidId': build.androidId,
  //         // 'systemFeatures': build.systemFeatures,
  //       };
  //     } else if (Platform.isIOS) {
  //       IosDeviceInfo data = await deviceInfo.iosInfo;
  //
  //       _map = {
  //         'OS TYPE': 'IOS',
  //         'screenWidth': screenWidth,
  //         'screenHeight': screenHeight,
  //         // 'pixelRatio': pixelRatio,
  //         'name': data.name,
  //         'systemName': data.systemName,
  //         'systemVersion': data.systemVersion,
  //         'model': data.model,
  //         'localizedModel': data.localizedModel,
  //         'identifierForVendor': data.identifierForVendor,
  //         'isPhysicalDevice': data.isPhysicalDevice,
  //         'utsname.sysname:': data.utsname.sysname,
  //         'utsname.nodename:': data.utsname.nodename,
  //         'utsname.release:': data.utsname.release,
  //         'utsname.version:': data.utsname.version,
  //         'utsname.machine:': data.utsname.machine,
  //       };
  //     }
  //   } else if (PlatformType.isWeb) {
  //     _map = {
  //       'OS TYPE': 'WEB',
  //       'screenWidth': screenWidth,
  //       'screenHeight': screenHeight,
  //       // 'pixelRatio': pixelRatio,
  //     };
  //   } else {
  //     _map = {'OS TYPE': PlatformType.platformType};
  //   }
  //   return jsonEncode(_map);
  // }
  //
  // static String encrypt(String value) {
  //   // return value;
  //   if (Helper.isEmpty(value)) {
  //     return '';
  //   }
  //
  //   final key = enc.Key.fromUtf8('jobbers_58542367');
  //   final iv = enc.IV.fromUtf8('jobbers_32145678');
  //
  //   final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
  //
  //   return encrypter.encrypt(value, iv: iv).base16;
  // }
  //
  // static String decrypt(String value) {
  //   // return value;
  //   if (Helper.isEmpty(value)) {
  //     return '';
  //   }
  //
  //   final key = enc.Key.fromUtf8('jobbers_58542367');
  //   final iv = enc.IV.fromUtf8('jobbers_32145678');
  //
  //   final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc, padding: null));
  //
  //   return encrypter.decrypt16(value, iv: iv);
  // }

  static List<String> toList(String? s, {String sap = ','}) {
    if (isEmpty(s)) {
      return <String>[];
    }

    List<String> li = s!.split(sap);
    return li.where((element) => !isEmpty(element)).toList();
  }

  static String formatResponseTime(int minutes) {
    Duration duration = Duration(minutes: minutes);
    int twoDigits(int n) => n.toString().padLeft(2, '0').toInt;
    int twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    // int twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    String time;
    if (minutes >= 60) {
      time = twoDigits(duration.inHours).toString() + 'h ';
    } else {
      time = '';
    }

    if (twoDigitMinutes > 0) {
      time += twoDigitMinutes.toString() + 'min';
    }

    return time;
  }

  // static void currencyFormatter(String value, TextEditingController controller) {
  //   int dotCount = value.charCount('.');
  //   int allowedDigitBeforeDot = 8;
  //   int allowedDigitAfterDot = 4;
  //
  //   if (dotCount > 1) {
  //     var v = value.split('.');
  //
  //     value = v[0] + '.' + v[1];
  //
  //     controller.value = TextEditingValue(text: value, selection: TextSelection.collapsed(offset: value.length));
  //   }
  //
  //   if (dotCount > 0) {
  //     var v = value.split('.');
  //
  //     if (v[0].length > allowedDigitBeforeDot) {
  //       v[0] = v[0].substring(0, allowedDigitBeforeDot);
  //     }
  //
  //     if (v[1].length > allowedDigitAfterDot) {
  //       v[1] = v[1].substring(0, allowedDigitAfterDot);
  //     }
  //
  //     value = v[0] + '.' + v[1];
  //
  //     controller.value = TextEditingValue(text: value, selection: TextSelection.collapsed(offset: value.length));
  //   } else if (value.length > allowedDigitBeforeDot) {
  //     value = value.substring(0, allowedDigitBeforeDot);
  //     controller.value = TextEditingValue(text: value, selection: TextSelection.collapsed(offset: value.length));
  //   }
  // }

  static void logOut() {
    MyAlertDialog()
        .setDefaultIcon()
        .setButtonAlignment(Alignment.bottomCenter)
        .setTitleAlignment(Alignment.bottomCenter)
        .setMessageAlignment(Alignment.bottomCenter)
        .setFirstSpacing(30)
        .setSecondSpacing(15)
        .setTitle(Strings.get('logout') + '?')
        .setMessage(Strings.get('youWantToLogOut'))
        .setPositiveButton('yes'.t, () {
          logOutWithoutAlert();
        })
        .setNegativeButton('no'.t, null)
        .show();
  }

  static void logOutWithoutAlert() {
    Preference.clear();
    Get.back();
    Get.deleteAll();
    Helper.refreshCallbacks.clear();
    Helper.fastRefreshCallbacks.clear();
    Const.name.value = '';
    Const.email.value = '';
    Const.profilePic.value = '';
    Get.offAll(() => LoginScreen());
  }

  static void exitAlert() {
    MyAlertDialog()
        .setDefaultIcon()
        .setButtonAlignment(Alignment.bottomCenter)
        .setTitleAlignment(Alignment.bottomCenter)
        .setMessageAlignment(Alignment.bottomCenter)
        .setFirstSpacing(30)
        .setSecondSpacing(15)
        .setTitle(Strings.get('exit'))
        .setMessage(Strings.get('youWantToExitFromApp'))
        .setPositiveButton('yes'.t, () {
          SystemNavigator.pop();
          return;
        })
        .setNegativeButton('no'.t, null)
        .show();
  }

  static void openNotification(no.NotificationModel model) {
    Logger.m(tag: 'TYPE', value: model.notificationType);
    // if (model.notificationType == NotificationType.SUPPORT) {
    //   Get.to(() => SupportChatScreen());
    //   return;
    // }
    //
    // if (model.notificationType == NotificationType.CHAT_MESSAGE) {
    //   try {
    //     var deco = jsonDecode(model.data) as Map<String, dynamic>;
    //     if (deco.containsKey('number')) {
    //       String number = deco['number'];
    //       String id = deco.containsKey('message_id') ? deco['message_id'].toString() : '';
    //       if (number.isNotEmpty && number.isNumeric && number.length > 7 && number.length < 16) {
    //         Get.to(() => ChatScreen(number, scrollTo: id));
    //         return;
    //       }
    //     }
    //   } catch (e) {
    //     Logger.ex(tag: 'OPEN NOTIFICATION', value: e);
    //   }
    //
    //   Get.to(() => MessagesGroupScreen());
    //   return;
    // }

    if (model.notificationType == NotificationType.OPEN_URL) {
      Helper.openUrl(model.data ?? '');
      return;
    }

    MyAlertDialog()
        .setIcon(model.image ?? '')
        .setTitle(model.title ?? '')
        .setMessage(model.body ?? '')
        .setPositiveButton('close'.t, Get.back)
        .show();
  }

  static String numberToString(int number) {
    switch (number) {
      case 0:
        return 'First';
      case 1:
        return 'Second';
      case 2:
        return 'Third';
      default:
        return (number + 1).toString() + "th";
    }
  }

  static formatNumber(String? s, {bool withPlus = false}) {
    if (s.empty) {
      return '';
    }

    for (String c in [' ', '+', '-', '(', ')']) {
      s = s!.replaceAll(c, '');
    }

    return (withPlus ? '+' : '') + s!;
  }

  static String getFileNamePrefix(String pathType) {
    switch (pathType) {
      case FileUploadType.FILE:
        return 'FILE_';
      case FileUploadType.PROFILE_IMG:
        return 'PROFILE_';
      case FileUploadType.SMS_IMG:
        return 'SMS_IMG_';
    }
    return 'UNKNOWN_';
  }

  static String starred(String? str, int count) {
    if (str.empty) return '';

    if (str!.length < count) return str;

    return str.substring(0, count) +
        List.generate(min(str.length - count, 20), (index) => '*').join('');
  }

// static bool isValidPhoneNumber(String value) {
//   if (isEmpty(value)) {
//     return false;
//   }
//
//   if (value.length < 6 || value.length > 15) {
//     return false;
//   }

// String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
// RegExp regExp = new RegExp(pattern);
// if (!regExp.hasMatch(value)) {
//   return false;
// }
//   return true;
// }

  static String readableSeconds(int value) {
    Duration d = Duration(seconds: value);
    var seconds = d.inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    List<String> li = [];

    if (seconds > 0) {
      li.add(twoDigit(seconds));
      // timeUnit.value = 'Seconds Left';
    }

    if (minutes > 0) {
      li.add(twoDigit(minutes));
      // timeUnit.value = 'Minutes Left';
    }

    if (hours > 0) {
      li.add(twoDigit(hours));
      // timeUnit.value = 'Hours Left';
    }

    if (days > 0) {
      li.add(twoDigit(days));
      // timeUnit.value = 'Days Left';
    }

    // timeUnit.value = 'Left';
    return li.reversed.join(':');
  }

  static String twoDigit(int v) => v.toString().length < 2 ? '0' + v.toString() : v.toString();
}

extension StringExtension on String? {
  String get inCaps => this.notEmpty && this!.length > 0
      ? '${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}'
      : '';

  String get capitalizeFirstOfEach =>
      this!.replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.inCaps).join(' ');

  String get everyFirstDigit => Helper.getEveryFirstDigit(this);

  // String get nullSafe => Helper.checkNull(this);
  String get nullSafe => this ?? '';

  String placeholder(String def) => this.notEmpty ? this! : def.nullSafe;

  String get nullStr => this ?? '------';

  bool get notEmpty => !Helper.isEmpty(this);

  bool get empty => Helper.isEmpty(this);

  int get toInt => Helper.parseInt(this);

  double get toDouble => Helper.parseDouble(this);

  void get copy => Clipboard.setData(ClipboardData(text: this.nullSafe));

  List<String> get toList => Helper.toList(this);

  String get t => Strings.get(this);

  bool get isNumeric => this.notEmpty && double.tryParse(this ?? '0') != null;

  String get formatNumber => Helper.formatNumber(this);

  String get formatNumberWithPlus => Helper.formatNumber(this, withPlus: true);

  String get starred => Helper.starred(this, 6);

  bool get containsUppercase => nullSafe.contains(RegExp(r'[A-Z]'));

  bool get containsLowercase => nullSafe.contains(RegExp(r'[a-z]'));

// bool get isInt => this.notNull && int.tryParse(this) != null;
//
// bool get isDouble => this.notNull && double.tryParse(this) != null;
//
// String capitalize() {
//   if (isEmpty) {
//     return this;
//   }
//   return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
// }
//
// int countWords() {
//   if (isEmpty) {
//     return 0;
//   }
//   var words = trim().split(RegExp(r'(\s+)'));
//   return words.length;
// }
//
// String removeNumbers() {
//   if (isEmpty) {
//     return this;
//   }
//   var regex = RegExp(r'(\d+)');
//   return replaceAll(regex, '');
// }
//
// String onlyLetters() {
//   if (isEmpty) {
//     return this;
//   }
//   // ignore: unnecessary_raw_strings
//   var regex = RegExp(r'([^a-zA-Z]+)');
//   return replaceAll(regex, '');
// }
//
// bool isIpv4() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(
//       r'((?:^|\s)([a-z]{3,6}(?=://))?(://)?((?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?))(?::(\d{2,5}))?(?:\s|$))');
//   return regex.hasMatch(this);
// }
//
// bool isIpv6() {
//   if (isEmpty) {
//     return false;
//   }
//
//   substring(0, 1);
//   var regex = RegExp(
//       r'(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))');
//   return regex.hasMatch(this);
// }
//
// bool isUrl() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(
//       r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)');
//   return regex.hasMatch(this);
// }
//
// bool isDate() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(
//       r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$');
//   if (regex.hasMatch(this)) {
//     return true;
//   }
//   try {
//     DateTime.parse(this);
//     return true;
//   } on FormatException {
//     return false;
//   }
// }
//
// bool isMail() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(r"(^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)");
//   return regex.hasMatch(this);
// }
//
// bool isNumber() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(r'^\d+$');
//   return regex.hasMatch(this);
// }
//
// bool isStrongPassword() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex =
//       RegExp(r'^(?=.*([A-Z]){1,})(?=.*[!@#$&*]{1,})(?=.*[0-9]{1,})(?=.*[a-z]{1,}).{8,100}$');
//   return regex.hasMatch(this);
// }
//
// bool isGuid() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(
//       r'^(\{{0,1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}\}{0,1})$');
//   return regex.hasMatch(this);
// }
//
// String toCamelCase() {
//   if (isEmpty) {
//     return this;
//   }
//   var words = trim().split(RegExp(r'(\s+)'));
//   var result = words[0].toLowerCase();
//   for (var i = 1; i < words.length; i++) {
//     result += words[i].substring(0, 1).toUpperCase() + words[i].substring(1).toLowerCase();
//   }
//   return result;
// }
//
// String onlyNumbers() {
//   if (isEmpty) {
//     return this;
//   }
//   // ignore: unnecessary_raw_strings
//   var regex = RegExp(r'([^0-9]+)');
//   return replaceAll(regex, '');
// }
//
// String removeLetters() {
//   if (isEmpty) {
//     return this;
//   }
//   // ignore: unnecessary_raw_strings
//   var regex = RegExp(r'([a-zA-Z]+)');
//   return replaceAll(regex, '');
// }
//
// List<Map<String, int>> charOccurences() {
//   if (isEmpty) {
//     return [];
//   }
//   // ignore: omit_local_variable_types
//   List<Map<String, int>> occurences = [];
//   var letters = split('')..sort();
//   var checkingLetter = letters[0];
//   var count = 0;
//   for (var i = 0; i < letters.length; i++) {
//     if (letters[i] == checkingLetter) {
//       count++;
//       if (i == letters.length - 1) {
//         occurences.add({checkingLetter: count});
//         checkingLetter = letters[i];
//       }
//     } else {
//       occurences.add({checkingLetter: count});
//       checkingLetter = letters[i];
//       count = 1;
//     }
//   }
//   return occurences;
// }

// String take(int length) {
//   if (this.notEmpty && this?.length! > length) {
//     return (this?.substring(0, length))! + '...';
//   }
//   return this.nullSafe;
// }

// String reverse() {
//   if (isEmpty) {
//     return this;
//   }
//   var letters = split('').toList().reversed;
//   return letters.reduce((current, next) => current + next);
// }
//
// String first({int n = 1}) {
//   if (isEmpty) {
//     return this;
//   }
//   if (length < n) {
//     return this;
//   }
//   return substring(0, n);
// }
//
// String last({int n = 1}) {
//   if (isEmpty) {
//     return this;
//   }
//   if (length < n) {
//     return this;
//   }
//   return substring(length - n, length);
// }
//
// List<String> toArray() {
//   if (isEmpty) {
//     return [];
//   }
//   return split('');
// }
//
// String stripHtml() {
//   if (isEmpty) {
//     return this;
//   }
//   // ignore: unnecessary_raw_strings
//   var regex = RegExp(r'<[^>]*>');
//   return replaceAll(regex, '');
// }
//
// String ifEmpty(Function act) {
//   return isEmpty ? act() : this;
// }
//
// String repeat(int count) {
//   if (isEmpty || count <= 0) {
//     return this;
//   }
//   var repeated = this;
//   for (var i = 0; i < count - 1; i++) {
//     repeated += this;
//   }
//   return repeated;
// }
//
// String squeeze(String char) {
//   var sb = '';
//   for (var i = 0; i < length; i++) {
//     if (i == 0 || this[i - 1] != this[i] || (this[i - 1] == this[i] && this[i] != char)) {
//       sb += this[i];
//     }
//   }
//   return sb;
// }
//
// bool hasSameCharacters() {
//   if (length > 1) {
//     var b = this[0].toLowerCase();
//     for (var i = 1; i < length; i++) {
//       var c = this[i].toLowerCase();
//       if (c != b) {
//         return false;
//       }
//     }
//   }
//   return true;
// }
//
// String shuffle() {
//   var stringArray = toArray();
//   stringArray.shuffle();
//   return stringArray.join();
// }
//
// bool get asBool => this.toLowerCase() == 'true';
//
// bool hasMatch(String value, String pattern) {
//   return (value == null) ? false : RegExp(pattern).hasMatch(value);
// }
//
// /// Checks if string is Currency.
// bool isCurrency(String s) => hasMatch(s,
//     r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');
//
// /// Checks if string is phone number.
// bool isPhoneNumber(String s) {
//   if (s.length > 16 || s.length < 9) return false;
//   return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
// }
//
// /// Checks if string is email.
// bool isEmail(String s) => hasMatch(s,
//     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//
// /// Checks if string is an html file.
// bool isHTML(String filePath) {
//   return filePath.toLowerCase().endsWith(".html");
// }
//
// bool validateEmail() {
//   if (this == null) return false;
//   return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//       .hasMatch(this);
// }
//
// String removeAllWhiteSpace() => this.notNull ? this.replaceAll(RegExp(r"\s+\b|\b\s"), "") : null;
}
