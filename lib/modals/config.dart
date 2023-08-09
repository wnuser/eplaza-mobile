import 'package:e_plaza_vendor/utils/helper.dart';

class Config {
  bool? _success;

  String? _ids;
  String? _subscriptionIds;
  String? _wss;
  String? _keys;

  String? _profileImagePath;
  String? _filePath;
  String? _categoryImagePath;
  String? _publicPath;

  String? _termsOfService;
  String? _privacyPolicy;
  String? _faq;

  List<dynamic>? _quizInstructions;

  Config();

  Config.fromJson(dynamic json) {
    _success = json['success'];
    _wss = json['wss'];
    _keys = json['keys'];
    _profileImagePath = json['profileImagePath'];
    _filePath = json['filePath'];
    _categoryImagePath = json['categoryImagePath'];
    _publicPath = json['publicPath'];
    _termsOfService = json['termsOfService'];
    _privacyPolicy = json['privacyPolicy'];
    _faq = json['faq'];
    _quizInstructions = json['quizInstructions'];
  }

  bool get success => _success ?? false;

  String get ids => _ids.nullSafe;

  String get subscriptionIds => _subscriptionIds.nullSafe;

  String get wss => _wss.nullSafe;

  String get keys => _keys.nullSafe;

  String get profileImagePath => _profileImagePath.nullSafe;

  String get filePath => _filePath.nullSafe;

  String get categoryImagePath => _categoryImagePath.nullSafe;

  String get publicPath => _publicPath.nullSafe;

  String get faq => _faq.nullSafe;

  String get privacyPolicy => _privacyPolicy.nullSafe;

  String get termsOfService => _termsOfService.nullSafe;

  List<dynamic> get quizInstructions => _quizInstructions ?? [];
}
