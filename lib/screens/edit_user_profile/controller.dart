import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data_provider/repository.dart';
import '../../../utils/const.dart';
import '../../modals/user.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;
  final Rx<User> user = User().obs;
  final ImagePicker _picker = ImagePicker();

  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController contactController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cellNoController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
}
