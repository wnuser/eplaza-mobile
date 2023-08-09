import 'package:get/get.dart';

import '../../utils/const.dart';

class Controller extends GetxController{
  RxString status = Status.PROGRESS.obs;

  Controller();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {

  }
}