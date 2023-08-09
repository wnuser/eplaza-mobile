import 'dart:io';

import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/widgets/app_bar.dart';
import 'package:e_plaza_vendor/widgets/primary_button.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/const.dart';
import '../../modals/category.dart';
import '../../modals/city.dart';
import '../../utils/data/cities.dart';
import '../../values/dimen.dart';
import '../../values/theme_colors.dart';
import '../../widgets/normal_text_field.dart';
import 'controller.dart';

class UpdateShopDetailsScreen extends StatefulWidget {
  const UpdateShopDetailsScreen({Key? key}) : super(key: key);

  @override
  _UpdateShopDetailsScreenState createState() => _UpdateShopDetailsScreenState();
}

class _UpdateShopDetailsScreenState extends State<UpdateShopDetailsScreen> {
  late Controller _controller;

  final cp = 8.0;
  final imgSize = 20.w;

  @override
  void initState() {
    _controller = Get.put<Controller>(Controller(), tag: 'ManageShopScreen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            MyAppBar('Update Shop Details'),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 6.w),
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  height: imgSize,
                                  child: /*ListView(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Obx(() => _controller.images.length < 2
                                          ? _pickFileWidget(null)
                                          : empty()),*/
                                      Obx(
                                    () => _controller.images.isNotEmpty
                                        ? Center(
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemCount: _controller.images.length,
                                              itemBuilder: _pickFileWidget,
                                              // children: _controller.images.map(_pickFileWidget).toList(),
                                            ),
                                          )
                                        : empty(),
                                    //   )
                                    // ],
                                  ),
                                ),
                              ),
                              Helper.spaceVertical(3.h),
                              NormalTextField(
                                label: 'Shop Name',
                                controller: _controller.shopNameController,
                                inputType: TextInputType.text,
                                validator: Helper.emptyValidator,
                              ),
                              Helper.spaceVertical(2.h),
                              Obx(
                                () => _controller.categories.value != null
                                    ? NormalTextField<Category>.dropdown(
                                        label: 'Category',
                                        controller: _controller.categoryController,
                                        dropdownList: _controller.categories,
                                        validator: Helper.emptyValidator,
                                        onSelected: (s) {
                                          _controller.categoryId = s.name.nullSafe;
                                          return s.name.nullSafe;
                                        },
                                      )
                                    : empty(),
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField<City>.dropdownWithSearch(
                                label: 'City',
                                controller: _controller.cityController,
                                dropdownList: cities,
                                validator: Helper.emptyValidator,
                                onSelected: (c) {
                                  _controller.cityController.text = c.name;
                                  return c.name;
                                },
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Shop Address',
                                controller: _controller.addressController,
                                inputType: TextInputType.text,
                                validator: Helper.emptyValidator,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Business Type',
                                controller: _controller.businessTypeController,
                                inputType: TextInputType.text,
                                validator: Helper.emptyValidator,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Turn Over',
                                controller: _controller.turnOverController,
                                inputType: TextInputType.text,
                                validator: Helper.emptyValidator,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField.dropdown(
                                label: 'Is Shop/Grah Udyog',
                                controller: _controller.isShopController,
                                validator: Helper.emptyValidator,
                                dropdownList: [
                                  'Shop',
                                  'Grah Udyog',
                                ],
                                onSelected: (String value) => value,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Shop owner aadhar No.',
                                controller: _controller.aadharNoController,
                                inputType: TextInputType.number,
                                validator: Helper.emptyValidator,
                              ),
                              Helper.spaceVertical(2.h),
                              Obx(
                                () => _img(
                                    title: 'Shop owner aadhar image',
                                    subTitle: 'Click to select',
                                    file: _controller.aadharCard.value),
                              ),
                              Helper.spaceVertical(2.h),
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
                    Icon(Icons.check, color: Colors.white, size: 16),
                    Helper.spaceHorizontal(6),
                    Text('Update Shop Details', style: MyTextStyle(color: Colors.white)),
                  ],
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _img({
    required String title,
    required String subTitle,
    required File file,
  }) {
    return ListTile(
      title: Text(
        title,
        style: MyTextStyle(fontSize: fontSizeMedium),
      ),
      subtitle: Text(subTitle, style: MyTextStyle(fontSize: fontSizeSmall)),
      leading: file.path.notEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.file(file, width: 40, height: 40))
          : Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
              child: Icon(Icons.add),
            ),
      trailing: file.path.notEmpty
          ? Icon(Icons.check, size: 16, color: ThemeColors.colorPrimary)
          : empty(),
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      onTap: _controller.pickAadharCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Colors.grey.shade50,
    );
  }

  Widget _pickFileWidget(c, i) {
    File? image = _controller.images[i];
    return Container(
      width: imgSize,
      height: imgSize,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400, width: 1)),
      child: image.path.notEmpty
          ? Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(image, width: imgSize, height: imgSize),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: smallIcon(
                      Icons.close,
                      () {
                        _controller.images[i] = File('');
                      },
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            )
          : TextButton(
              onPressed: _controller.pickShopImage,
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(imgSize / 4),
              ),
              child: assetImage('assets/icons/camera.png'),
            ),
    );
  }
}
