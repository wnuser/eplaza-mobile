import 'package:e_plaza/utils/const.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;

  String ENTERED_OTP = '';
  void Function()? onVerified;

  Controller();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Const.packageName = packageInfo.packageName;
    Const.versionCode = packageInfo.buildNumber;
    Const.versionName = packageInfo.version;
  }

  void verifyOtp() {
    onVerified?.call();
  }
}
