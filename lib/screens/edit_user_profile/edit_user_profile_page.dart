import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/widgets/app_bar.dart';
import 'package:e_plaza_vendor/widgets/primary_button.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../utils/const.dart';
import '../../widgets/normal_text_field.dart';
import '../manage_stores/manage_stores.dart';
import '../update_shop_details_screen/update_shop_details_screen.dart';
import 'controller.dart';

class EditUserProfilePage extends StatefulWidget {
  final void Function()? backCallback;

  const EditUserProfilePage({this.backCallback, Key? key}) : super(key: key);

  @override
  _EditUserProfilePageState createState() => _EditUserProfilePageState();
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {
  late Controller _controller;

  @override
  void initState() {
    _controller = Get.put<Controller>(Controller(), tag: 'ProfileProfile');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double imgSize = 100;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            MyAppBar('Profile', backCallBack: widget.backCallback),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10.w),
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: [
                              Helper.spaceVertical(2.h),
                              assetImage('assets/icons/logo.png',
                                  width: 60.w, fit: BoxFit.fitWidth),
                              Helper.spaceVertical(6.h),
                              NormalTextField(
                                label: 'Name',
                                controller: _controller.nameController,
                                inputType: TextInputType.text,
                                enable: false,
                                contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                              ),
                              Helper.spaceVertical(12),
                              NormalTextField(
                                label: 'Email',
                                controller: _controller.emailController,
                                inputType: TextInputType.emailAddress,
                                enable: false,
                                contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                              ),
                              Helper.spaceVertical(12),
                              NormalTextField(
                                label: 'Mobile',
                                controller: _controller.contactController,
                                inputType: TextInputType.phone,
                                enable: false,
                                contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                              ),
                              Helper.spaceVertical(12),
                              NormalTextField(
                                label: 'Address',
                                controller: _controller.addressController,
                                inputType: TextInputType.text,
                                enable: false,
                                contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                minLines: 2,
                              ),
                              Helper.spaceVertical(12),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(() => progressLayout(enable: _controller.status.value == Status.PROGRESS)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      // width: Helper.buttonWidth,
                      height: 40,
                      borderRadius: 4,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, color: Colors.white, size: 16),
                          Helper.spaceHorizontal(6),
                          Text(
                            'Edit Profile',
                            style: MyTextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Helper.spaceHorizontal(12),
                  Expanded(
                    child: PrimaryButton(
                      // width: Helper.buttonWidth,
                      height: 40,
                      borderRadius: 4,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.phonelink_setup_rounded, color: Colors.white, size: 16),
                          Helper.spaceHorizontal(6),
                          Text(
                            'Manage Store',
                            style: MyTextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Get.to(() => ManageStoresScreen());
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
