import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:e_plaza_vendor/dialogs/image_pick_option_dialog.dart';
import 'package:e_plaza_vendor/modals/result.dart';
import 'package:e_plaza_vendor/screens/home/home_page_w.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/data/cities.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/preference.dart';
import 'package:e_plaza_vendor/utils/toasty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:package_info_plus/package_info_plus.dart';

import '../../../data_provider/repository.dart';
import '../../data_provider/location_controller.dart';
import '../../modals/category.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxList<Category> categories = <Category>[].obs;
  final RxList<Category> selectedCategories = <Category>[].obs;
  final Rx<Result> loginResult = Result().obs;
  final RxBool obSecureText = true.obs;
  final Rx<File> aadharCard = File('').obs;
  final RxList<File> images = <File>[File(''), File('')].obs;

  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController aadharCardController = TextEditingController();
  final TextEditingController businessTypeController = TextEditingController();
  final TextEditingController turnOverController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController isShopController = TextEditingController();
  final TextEditingController aadharNoController = TextEditingController();
  String countryName = '';
  List<int> selectedCategoryIds = <int>[];
  bool _locationFetched = false;

  // FacebookLogin facebookLogin = FacebookLogin();

  Controller();

  Future<void> init() async {
    getCategories();

    locController.currentLocation.listen((p) {
      if (!_locationFetched) {
        _locationFetched = true;

        for (var city in cities) {
          if (city.name.toLowerCase() == p.locality) {
            cityController.text = city.name;
            break;
          }
        }
      }
    });

    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // Const.packageName = packageInfo.packageName;
    // Const.versionCode = packageInfo.buildNumber;
    // Const.versionName = packageInfo.version;

    // Repository.instance.getConfig();

    // if (Helper.isDeveloper) {
    //   shopNameController.text = 'Test Shop';
    //   cityController.text = 'Dehradun';
    //   addressController.text = 'Test Address';
    //   aadharCardController.text = '12345678901234567890';
    //   businessTypeController.text = 'Test';
    //   turnOverController.text = '99';
    //   categoryController.text = 'Daily Needs';
    //   isShopController.text = 'Shop';
    //   aadharNoController.text = '12345678901234567890';
    // }
  }

  Future pickAadharCard() async {
    ImagePickOptionDialog(
      onSelected: (source) {
        Get.back();
        Helper.pickImage((file) {
          this.aadharCard.value = file;
          aadharCardController.text = 'Selected';
        }, (error) {
          Toasty.failed(error);
        }, source: source);
      },
    );
  }

  Future pickShopImage() async {
    ImagePickOptionDialog(
      onSelected: (source) {
        Get.back();
        Helper.pickImage((file) {
          for (int i = 0; i < images.length; i++) {
            if (images[i].path.isEmpty) {
              images[i] = file;
              break;
            }
          }
        }, (error) {
          Toasty.failed(error);
        }, source: source);
      },
    );
  }

  void getCategories() async {
    var data = await Repository.instance.getCategories();

    categories.clear();
    if (data.isNotEmpty) {
      data.forEach((element) => categories.add(Category.fromJson(element)));
    }
    status.value = Status.NORMAL;
  }

  void addShop() async {
    if (formKey.currentState!.validate()) {
      for (int i = 0; i < images.length; i++) {
        if (images[i].path.isEmpty) {
          Toasty.failed('Please select all images');
          return;
        }
      }

      // if (aadharCard.value.path.empty) {
      //   Toasty.failed('Please select aadhar card!');
      //   return;
      // }
      status.value = Status.PROGRESS;

      dio.MultipartFile? aadharCardMulti = null;
      dio.MultipartFile? shopImage1 = null;
      dio.MultipartFile? shopImage2 = null;

      if (aadharCard.value.path.notEmpty && !aadharCard.value.path.startsWith('http')) {
        // print(aadharCard.value.path);
        aadharCardMulti = await dio.MultipartFile.fromFile(aadharCard.value.path);
      }

      if (images.length > 0 && !images[0].path.startsWith('http')) {
        shopImage1 = await dio.MultipartFile.fromFile(images[0].path);
      }

      if (images.length > 1 && !images[1].path.startsWith('http')) {
        shopImage2 = await dio.MultipartFile.fromFile(images[1].path);
      }

      // print('IMAGE 1 : ' + aadharCardMulti!.filename.nullSafe + " : " + aadharCardMulti.length.toString());
      // print('IMAGE 2 : ' + shopImage1!.filename.nullSafe + " : " + shopImage1.length.toString());
      // print('IMAGE 3 : ' + shopImage2!.filename.nullSafe + " : " + shopImage2.length.toString());
      // return;

      var response = await Repository.instance.addShop(
        vendorId: Preference.user.id.nullSafe,
        shopName: shopNameController.text,
        city: cityController.text,
        address: addressController.text,
        image1: shopImage1,
        image2: shopImage2,
        aadharCardNumber: aadharNoController.text,
        businessType: businessTypeController.text,
        turnOver: turnOverController.text,
        categoryId: selectedCategoryIds,
        isGrahudhyog: isShopController.text,
        aadharImage: aadharCardMulti,
      );

      status.value = Status.NORMAL;

      if (response['success']) {
        Toasty.success(response['message'].toString().placeholder('somethingWentWrong'.t));
        Get.offAll(() => HomeScreenWithBottomMenu());
      } else {
        Toasty.failed(response['message'].toString().placeholder('somethingWentWrong'.t));
      }
    }
  }
}
