import 'dart:io';

import 'package:e_plaza_vendor/modals/category.dart';
import 'package:e_plaza_vendor/utils/data/cities.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/dimen.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/primary_button.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../dialogs/multi_select_dialog.dart' as own;
import '../../modals/city.dart';
import '../../utils/const.dart';
import '../../widgets/normal_text_field.dart';
import 'controller.dart';

class ShopDetailsScreen extends StatefulWidget {
  ShopDetailsScreen();

  @override
  _ShopDetailsScreenState createState() => _ShopDetailsScreenState();
}

class _ShopDetailsScreenState extends State<ShopDetailsScreen> {
  late Controller _controller;

  final cp = 8.0;
  final imgSize = 20.w;

  @override
  void initState() {
    _controller = Get.put<Controller>(Controller(), tag: 'BusinessProfileDetailsController');
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 95.h,
              width: 100.w,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Helper.spaceVertical(3.h),
                  assetImage('assets/icons/logo.png', width: 60.w, fit: BoxFit.fitWidth),
                  Helper.spaceVertical(1.h),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: (cp + 2).w),
                      padding: EdgeInsets.symmetric(horizontal: cp.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 4,
                              spreadRadius: 4,
                              offset: Offset(0, 2))
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Form(
                        key: _controller.formKey,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Helper.spaceVertical(3.h),
                              Text(
                                'Shop Details',
                                style: MyTextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
                              ),
                              Helper.spaceVertical(3.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  height: imgSize + 20,
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
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Shop Name',
                                controller: _controller.shopNameController,
                                inputType: TextInputType.text,
                                validator: Helper.emptyValidator,
                              ),
                              Helper.spaceVertical(2.h),
                              Obx(
                                () => _controller.categories.value != null
                                    ? NormalTextField<Category>.dropdownWithoutMenu(
                                        label: 'Category',
                                        controller: _controller.categoryController,
                                        validator: Helper.emptyValidator,
                                        // dropdownList: _controller.categories,
                                        // onSelected: (s) {
                                        //   _controller.categoryId = s.id.nullSafe;
                                        //   return s.name.nullSafe;
                                        // },
                                        onTap: () {
                                          own.MultiSelectDialog<Category>(context,
                                              title: 'Select Category',
                                              itemTitle: (c) => c.name.nullSafe,
                                              list: _controller.categories,
                                              selected: _controller.selectedCategories,
                                              onSelected: (li1) {
                                                List<Category> li = [...li1];

                                                String cats = _controller.selectedCategories
                                                    .map((e) => e.name.nullSafe)
                                                    .join(',');
                                                _controller.categoryController.text = cats;

                                                _controller.selectedCategoryIds = _controller
                                                    .selectedCategories
                                                    .map((e) => e.id.toInt)
                                                    .toList();

                                                _controller.selectedCategories.clear();
                                                _controller.selectedCategories.addAll(li);
                                              });
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
                                dropdownList: ['Shop', 'Grah Udyog'],
                                onSelected: (String value) => value,
                              ),
                              Helper.spaceVertical(2.h),
                              NormalTextField(
                                label: 'Shop owner aadhar No.',
                                controller: _controller.aadharNoController,
                                inputType: TextInputType.number,
                                // validator: Helper.emptyValidator,
                                maxLength: 12,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        ),
                      ),
                    ),
                  ),
                  Helper.spaceVertical(4.h),
                  PrimaryButton(
                    // width: 80.w,
                    width: (100 - ((cp * 4) + 2)).w,
                    height: 7.h,
                    borderRadius: 3.5.h,
                    onPressed: _controller.addShop,
                    child: 'COMPLETE',
                  ),
                ],
              ),
            ),
            Obx(() => progressLayout(enable: _controller.status.value == Status.PROGRESS))
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
      contentPadding: EdgeInsets.zero,
      onTap: _controller.pickAadharCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Colors.grey.shade50,
    );
  }

  Widget _pickFileWidget(c, i) {
    File? image = _controller.images[i];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
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
        ),
        Helper.spaceVertical(3),
        Text(
          i == 0 ? 'Logo' : 'Shop Image',
          style: MyTextStyle(fontSize: fontSizeSmall),
        )
      ],
    );
  }
}
