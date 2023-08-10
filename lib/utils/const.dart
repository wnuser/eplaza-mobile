import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_plaza/modals/config.dart';

import '../data_provider/api_keys.dart';

class Const {
  // ignore: constant_identifier_names
  static const EMAIL_VERIFICATION_LINK = ApiKeys.baseUrl +
      "57fe55ac900525062fd0760984d0578b?s=";

  static final RxInt notificationCount = 0.obs;
  static const razorPayKey = 'rzp_test_lOilWsb6wjCV3t';
  static AppLifecycleState lifecycleState = AppLifecycleState.resumed;

  static final Rx<Config> config = Config().obs;
  static RxString name = ''.obs;
  static RxString email = ''.obs;
  static RxString profilePic = ''.obs;
  static bool isDeveloper = false;
  static double loaderSize = 80;
  static int temp = 0;

  static String currencySymbol = '₹';
  static List<int> templateAmounts = [10, 20, 30, 40, 50, 60];

  static String timeZone = '';
  static String packageName = '';
  static String versionCode = '0';
  static String versionName = '0';

  static String dots = '• • •';

  static final testDeviceIds = ['7ed51f79947ea050', '7804d9f813b8dd79'];

  static const alphabets = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M'
  ];
}

class Status {
  // ignore: constant_identifier_names
  static const NORMAL = 'normal';

  // ignore: constant_identifier_names
  static const PROGRESS = 'progress';

  // ignore: constant_identifier_names
  static const EMPTY = 'empty';

  // ignore: constant_identifier_names
  static const ERROR = 'error';

  // ignore: constant_identifier_names
  static const COMPLETED = 'completed';
}

class PaymentStatus {
  static const String CREDIT = 'CREDIT';
  static const String DEBIT = 'DEBIT';
  static const String WITHDRAW = 'WITHDRAW';
}

class PaymentType {
  static const String NEW_ORDER = 'NEW ORDER';
  static const String TIP = 'TIP';
  static const String REFUND = 'REFUND';
  static const String WITHDRAW = 'WITHDRAW';
}

class PaymentMethod {
  static const String PAYPAL = 'PAYPAL';
  static const String STRIPE = 'STRIPE';
  static const String RAZOR_PAY = 'RAZOR PAY';
}

class ContestType {
  static const String UPCOMING = 'UPCOMING';
  static const String LIVE = 'LIVE';
  static const String COMPLETED = 'COMPLETED';
  static const String FULL = 'FULL';
  static const String PLAYED = 'PLAYED';
}

class FileUploadType {
  static const PROFILE_IMG = 'PROFILE_IMG';
  static const FILE = 'FILE';
  static const SMS_IMG = 'SMS_IMG';
}

class Sort {
  static const int NEWEST = 0;
  static const int OLDEST = 1;
  static const int A_TO_Z = 2;
  static const int Z_TO_A = 3;
  static const int RATING_HIGH_TO_LOW = 4;
  static const int RATING_LOW_TO_HIGH = 5;
}
