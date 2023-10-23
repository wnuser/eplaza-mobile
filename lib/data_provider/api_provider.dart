import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:e_plaza_vendor/modals/result.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/logger.dart';
import 'package:e_plaza_vendor/utils/preference.dart';

import 'api_keys.dart';

late Dio _dio;

class ApiProvider {
  final bool enableResponseLogs;
  final bool enableParamsLogs;
  final String endPoint;
  final String method;
  Map<String, dynamic> parameters;

  ApiProvider(
    this.endPoint, {
    this.enableParamsLogs = true,
    this.enableResponseLogs = true,
    this.parameters = const {},
    this.method = 'post',
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiKeys.baseUrl,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        sendTimeout: Duration(seconds: 30),
        // responseType: ResponseType.json,
        // contentType: 'application/json',
        validateStatus: (status) => status! < 500,
        // validateStatus: (status) => [200, 201, 202, 401, 400].contains(status),
      ),
    );

    if (!ApiKeys.baseUrl.startsWith('https')) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }

    // if (parameters != null && parameters.isNotEmpty) {
    //   this.parameters = Encryption.instance.encMap(parameters);
    // }
  }

  Options get _options {
    return Options(headers: {
      'Authorization': (Preference.isLogin ? 'Bearer ' + Preference.token : ""),
      // 'time_zone': Const.timeZone,
      'pn': Const.packageName,
      'vc': Const.versionCode,
      'vn': Const.versionName,
    });
  }

  Future<List<dynamic>> getList() async {
    if (enableParamsLogs) Logger.m(tag: 'API $endPoint Params', value: (parameters));
    if (enableParamsLogs) Logger.m(tag: 'API $endPoint Headers', value: _options.headers);

    try {
      return (method == 'post'
              ? _dio.post(endPoint, data: FormData.fromMap(parameters), options: _options)
              : _dio.get(endPoint, options: _options))
          .then((value) {
        if (enableResponseLogs) Logger.r(tag: 'API $endPoint', value: value);
        // handleMessage(endPoint, value.statusCode, value.statusMessage);
        if (value.data['success'] == true) {
          return value.data['data'] as List;
        }
        return [];
      }).catchError((e) {
        Logger.e(tag: 'API $endPoint', value: e);
        return [];
      });
    } catch (e) {
      Logger.ex(baseName: runtimeType, tag: 'API PROVIDER ERROR', value: e);
      return [];
    }
  }

  Future<Result> getResult() async {
    if (enableParamsLogs) Logger.m(tag: 'API $endPoint Params', value: (parameters));
    if (enableParamsLogs) Logger.m(tag: 'API $endPoint Headers', value: _options.headers);

    try {
      return (method == 'post'
              ? _dio.post(endPoint, data: FormData.fromMap(parameters), options: _options)
              : _dio.get(endPoint, options: _options))
          .then((value) {
        if (enableResponseLogs) Logger.r(tag: 'API $endPoint', value: value);
        // handleMessage(endPoint, value.statusCode, value.statusMessage);
        return Result.fromJson(value.data);
      }).catchError((e) {
        Logger.e(tag: 'API $endPoint', value: e);
        return Result(message: 'somethingWentWrong'.t);
      });
    } catch (e) {
      Logger.e(tag: 'API $endPoint', value: e);
      return Result(message: 'somethingWentWrong'.t);
    }
  }

  Future<dynamic> getDynamic() async {
    if (enableParamsLogs) Logger.m(tag: 'API $endPoint Params', value: (parameters));
    if (enableParamsLogs) Logger.m(tag: 'API $endPoint Headers', value: _options.headers);

    try {
      return (method == 'post'
              ? _dio.post(endPoint, data: FormData.fromMap(parameters), options: _options)
              : _dio.get(endPoint, options: _options))
          .then((value) {
        if (enableResponseLogs) Logger.r(tag: 'API $endPoint', value: value);
        // handleMessage(endPoint, value.statusCode, value.statusMessage);
        return value.data;
      }).catchError((e) {
        Logger.e(tag: 'API $endPoint', value: e);
        return {'success': false};
      });
    } catch (e) {
      Logger.ex(baseName: runtimeType, tag: 'API PROVIDER ERROR', value: e);
      return {'success': false};
    }
  }

  Future<int> getInt() async {
    if (enableParamsLogs) Logger.m(tag: 'API $endPoint Params', value: (parameters));
    if (enableParamsLogs) Logger.m(tag: 'API $endPoint Headers', value: _options.headers);

    try {
      return (method == 'post'
              ? _dio.post(endPoint, data: FormData.fromMap(parameters), options: _options)
              : _dio.get(endPoint, options: _options))
          .then((value) {
        if (enableResponseLogs) Logger.r(tag: 'API $endPoint', value: value);
        // handleMessage(endPoint, value.statusCode, value.statusMessage);
        return Helper.parseInt(value.data);
      }).catchError((e) {
        Logger.e(tag: 'API $endPoint', value: e);
        return 0;
      });
    } catch (e) {
      Logger.ex(baseName: runtimeType, tag: 'API PROVIDER ERROR', value: e);
      return 0;
    }
  }

  Future<List<int>?> getImage(String url) async {
    return _dio
        .get<List<int>>(url, options: Options(responseType: ResponseType.bytes))
        .then((value) => value.data)
        .catchError((e) => <int>[]);
  }

  // void handleMessage(String endpoint, int? code, String? message) {
  //   if (code == 401) {
  //     Logger.e(
  //         tag: endpoint + " => !!!!!! STATUS MESSAGE !!!!!!",
  //         value: code.toString() + ' :: ' + message!);
  //     Helper.logOutWithoutAlert();
  //   }
  // }

  void saveLogToServer({dynamic log = ''}) {
    var data = FormData.fromMap({'userId': Preference.user.id, 'log': log.toString()});
    _dio.post('saveLogToServer', data: data);
  }
}
