import 'package:e_plaza/widgets/custom_bottom_nav_bar_static.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/const.dart';
import '../../utils/helper.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/normal_text_field.dart';
import '../../widgets/primary_button.dart';
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
                              // Helper.spaceVertical(2.h),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  color: Colors.white,
                                  child: Stack(
                                      fit: StackFit.loose,
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(7),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Obx(
                                              () => _controller.user.value.profilePic ==
                                                      Status.PROGRESS
                                                  ? const CircularProgressIndicator(strokeWidth: 3)
                                                  : MyNetworkImage(
                                                      path: Const.config.value.profileImagePath,
                                                      imageName: _controller
                                                          .user.value.profilePic.nullSafe,
                                                      width: imgSize,
                                                      height: imgSize,
                                                      open: true,
                                                      errorWidget: assetImage(
                                                          'assets/icons/profile_placeholder_primary.png',
                                                          width: imgSize,
                                                          height: imgSize,
                                                          color: ThemeColors.colorPrimary,
                                                          fit: BoxFit.contain),
                                                    ),
                                            ),
                                          ),
                                        ),
                                        FloatingActionButton(
                                          onPressed: () {},
                                          heroTag: 'camera',
                                          shape: const CircleBorder(),
                                          elevation: 1,
                                          mini: true,
                                          child: const Icon(Icons.camera_alt,
                                              color: Colors.white, size: 20),
                                        ),
                                      ]),
                                ),
                              ),
                              Helper.spaceVertical(6.h),
                              NormalTextField(
                                label: 'First Name',
                                controller: _controller.fNameController,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Last Name',
                                controller: _controller.lNameController,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Email',
                                controller: _controller.emailController,
                                inputType: TextInputType.emailAddress,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Password',
                                controller: _controller.passwordController,
                                obSecure: true,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Cell No',
                                controller: _controller.cellNoController,
                                inputType: TextInputType.phone,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Zip Code',
                                controller: _controller.zipCodeController,
                                inputType: TextInputType.number,
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
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(4),
    );
  }
}
