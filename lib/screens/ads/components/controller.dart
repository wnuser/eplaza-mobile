import 'dart:io';

import 'package:e_plaza_vendor/modals/ad.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/const.dart';

class Controller extends GetxController {
  final RxString status = Status.PROGRESS.obs;
  RxList<Ad> ads = <Ad>[].obs;
  Rx<File> file = File('').obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController infoController = TextEditingController();

  @override
  void onInit() {
    fetchLeadGroups();
    super.onInit();
  }

  void fetchLeadGroups() async {
    status.value = Status.PROGRESS;
    // var list = await Repository.instance.getLeadGroups();
    // ads.clear();
    // if (list.isNotEmpty) {
    //   list.forEach((element) => ads.add(LeadGroup.fromJson(element)));
    //   status.value = Status.NORMAL;
    // } else {
    //   status.value = Status.EMPTY;
    // }

    ads.add(Ad(title: 'Test Ad 1', info: "Ad for First Banner", link: "https://hello.com"));
    ads.add(Ad(title: 'Test Ad 2', info: "Ad for Second Banner", link: "https://hello.com"));
    status.value = Status.NORMAL;
  }

  Future<void> pickFile() async {
    FilePickerResult? pickerResult = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['csv', 'xls', 'xlsx']);
    if (pickerResult != null) {
      file.value = File(pickerResult.files.single.path.nullSafe);
    }
  }
}
