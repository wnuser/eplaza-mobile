import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:e_plaza_vendor/dialogs/image_pick_option_dialog.dart';
import 'package:e_plaza_vendor/modals/result.dart';
import 'package:e_plaza_vendor/modals/shop_details.dart';
import 'package:e_plaza_vendor/screens/home/home_page_w.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/data/cities.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/preference.dart';
import 'package:e_plaza_vendor/utils/toasty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:package_info_plus/package_info_plus.dart';

import '../../../data_provider/repository.dart';
import '../../data_provider/location_controller.dart';
import '../../modals/category.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxList<Category> categories = <Category>[].obs;
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
  String categoryId = '';
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

      if (aadharCard.value.path.empty) {
        Toasty.failed('Please select aadhar card!');
        return;
      }
      status.value = Status.PROGRESS;

      dio.MultipartFile aadharCardMulti = await dio.MultipartFile.fromFile(
        aadharCard.value.path,
      );

      dio.MultipartFile? shopImage1 =
          images.length > 0 ? await dio.MultipartFile.fromFile(images[0].path) : null;

      dio.MultipartFile? shopImage2 =
          images.length > 1 ? await dio.MultipartFile.fromFile(images[1].path) : null;

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
        categoryId: categoryId,
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
