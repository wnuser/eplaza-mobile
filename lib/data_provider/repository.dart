import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_plaza/modals/notification_model.dart' as my;
import 'package:e_plaza/modals/result.dart';
import 'package:e_plaza/modals/user.dart';
import 'package:e_plaza/utils/const.dart';

import '../modals/config.dart';
import '../utils/helper.dart';
import 'api_provider.dart';

class Repository {
  static Repository? _instance;

  static Repository get instance {
    _instance ??= Repository._init();
    return _instance!;
  }

  Repository._init();

  Future<bool> getConfig() async {
    var data = await ApiProvider('getConfig').getDynamic();
    if (data['success'] == true) {
      Const.config.value = Config.fromJson(data);
      // Encryption.setNull();
    }
    return true;
  }

  Future<dynamic> login(String username, String password) async {
    return ApiProvider('login', parameters: {'username': username, 'password': password}).getDynamic();
  }

  Future<Result> verifyEmail(String email, String otp) {
    return ApiProvider('verifyEmail', parameters: {'email': email, 'otp': otp}).getResult();
  }

  Future<Result> sendVerificationOtp(String email) {
    return ApiProvider('sendVerificationOtp', parameters: {'email': email}).getResult();
  }
}
