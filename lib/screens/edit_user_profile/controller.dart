import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:e_plaza_vendor/modals/city.dart';
import 'package:e_plaza_vendor/modals/country2.dart';
import 'package:e_plaza_vendor/modals/result.dart';
import 'package:e_plaza_vendor/modals/state.dart' as state;
import 'package:e_plaza_vendor/modals/user.dart';
import 'package:e_plaza_vendor/utils/data/cities.dart';
import 'package:e_plaza_vendor/utils/data/country2.dart';
import 'package:e_plaza_vendor/utils/data/states.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/logger.dart';
import 'package:e_plaza_vendor/utils/preference.dart';
import 'package:e_plaza_vendor/utils/toasty.dart';
import 'package:e_plaza_vendor/values/strings.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';

import '../../../data_provider/repository.dart';
import '../../../utils/const.dart';

class Controller extends GetxController {
  final RxString status = Status.NORMAL.obs;
  final Rx<User> user = User().obs;
  final ImagePicker _picker = ImagePicker();

  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController contactController = TextEditingController();

  // List<Country> countriesList = <Country>[];
  RxList<state.State> statesList = <state.State>[].obs;
  RxList<City> citiesList = <City>[].obs;

  final Rx<Country2> country = Country2('', '', '', '', 0).obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Controller() {
    nameController.text = Preference.user.firstName.nullSafe + ' ' + Preference.user.lastName.nullSafe;
    emailController.text = Preference.user.email.nullSafe;
    contactController.text = Preference.user.mobile.nullSafe;
    addressController.text = 'Dehradun, Uttarakhand';
  }

  void getStates(int countryId) {
    // stateController.clear();
    // cityController.clear();
    statesList.clear();
    statesList.addAll(states.where((element) => countryId == element.countryId));
    statesList.refresh();
  }

  void getCities(int stateId) {
    // cityController.clear();
    citiesList.clear();
    citiesList.addAll(cities.where((element) => stateId == element.stateId));
    citiesList.refresh();
  }

  String get validate {
    if (Helper.isEmpty(nameController.text)) {
      return Strings.get('pleaseEnterCompanyName');
    }

    // if (Helper.isEmpty(emailController.text)) {
    //   return Strings.get('pleaseEnterEmail');
    // }

    /*else if (Helper.isEmpty(contactController.text)) {
      return Strings.get('pleaseEnterContact');
    }

    if (Helper.isEmpty(addressController.text)) {
      return Strings.get('pleaseEnterContact');
    } */

    /*else if (Helper.isEmpty(confirmPasswordController.text)) {
      return Strings.get('pleaseEnterConfirmPassword');
    }

    if (passwordController.text != confirmPasswordController.text) {
      return Strings.get('bothPasswordsNotMatch');
    } */

    if (Helper.isEmpty(country.value.country)) {
      return Strings.get('pleaseSelectCountry');
    }

    // if (Helper.isEmpty(contactController.text)) {
    //   return 'Please enter contact no.';
    // }

    // if (!Helper.isValidPhoneNumber(contactController.text)) {
    //   return 'Please enter valid contact no.';
    // }

    return '';
  }

  Country2 getCountry(String country) {
    if (country.notEmpty) {
      for (int i = 0; i < countriesWithFlags.length; i++) {
        if (country.toLowerCase() == countriesWithFlags[i].country.toLowerCase()) {
          getStates(countriesWithFlags[i].id);
          return countriesWithFlags[i];
        }
      }
    }
    return Country2("IN", "India", "+91", "assets/flags/flag_in.png", 101);
  }
}
