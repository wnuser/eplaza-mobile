import 'package:e_plaza/dialogs/list_dialog.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/app_bar.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/store_category.dart';
import '../../utils/const.dart';
import '../../widgets/my_network_image.dart';
import 'controller.dart';
import 'store_item.dart';

class StoresScreen extends StatefulWidget {
  final StoreCategory storeCategory;

  StoresScreen(this.storeCategory, {Key? key}) : super(key: key);

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  final Controller _controller = Get.put(Controller(), tag: 'StoresScreenController');

  int _sortIndexGroup = Sort.NEWEST;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.whiteBlue,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar(widget.storeCategory.title.nullStr, enableSearch: true, searchCallBack: _controller.filterList),
          _filterLayout(),
          Expanded(
            child: Obx(()=>ListView.builder(
                padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 80),
                itemBuilder: (c, i) => StoreItem(i, _controller.shops[i]),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: _controller.shops.length,
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: _fab,
    );
  }

  Widget get _fab {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 50,
          padding: EdgeInsets.only(left: 2, right: 22),
          decoration: BoxDecoration(
            color: ThemeColors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 5))
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: MyNetworkImage(
                  path: '',
                  imageName:
                      'https://images.meesho.com/images/products/228753704/1dmmv_512.webp',
                  width: 46,
                  height: 46,
                  open: true,
                ),
              ),
              Helper.spaceHorizontal(12),
              Text(
                'Product\nPreview',
                style: MyTextStyle(
                  color: ThemeColors.colorPrimary,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _filterLayout() => Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: MyFlatButton(
                height: 45,
                onPressed: _sortDialog,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    assetImage('assets/icons/sort.png', width: 22, height: 22, color: Colors.black),
                    Helper.spaceHorizontal(10),
                    Text('Sort', style: MyTextStyle(fontSize: fontSizeMedium))
                  ],
                ),
              ),
            ),
            Container(width: 1, height: 30, color: Colors.grey),
            Expanded(
              flex: 1,
              child: MyFlatButton(
                height: 45,
                onPressed: () {
                  BottomSheetListDialog('Filters', _controller.storeCategories,
                          isBottomSheet: true)
                      .show((position, s) {
                    _controller.selectedCategory.value = s.title.nullSafe;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    assetImage('assets/icons/filter.png',
                        width: 18, height: 18, color: Colors.black),
                    Helper.spaceHorizontal(10),
                    Obx(()=> Text(_controller.selectedCategory.value,
                          style: MyTextStyle(fontSize: fontSizeMedium)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  void _sortDialog() {
    MyTextStyle style = MyTextStyle(color: Colors.black, fontSize: fontSizeMedium);
    Get.bottomSheet(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 100.w - 10,
        padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        decoration: Helper.dialogBoxDecoration,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Sort By',
                style: MyTextStyle(fontSize: fontSizeLarge),
              ),
            ),
            Helper.spaceVertical(20),
            RadioListTile(
              title: Text('Newest', style: style),
              value: Sort.NEWEST,
              groupValue: _sortIndexGroup,
              dense: true,
              onChanged: (value) => setState(() {
                _sortIndexGroup = value!;
                _controller.sort(Sort.NEWEST);
                Get.back();
              }),
            ),
            RadioListTile(
              title: Text('Oldest', style: style),
              value: Sort.OLDEST,
              groupValue: _sortIndexGroup,
              dense: true,
              onChanged: (value) => setState(() {
                _sortIndexGroup = value!;
                _controller.sort(Sort.OLDEST);
                Get.back();
              }),
            ),
            Divider(color: Colors.grey.shade300, height: 1),
            RadioListTile(
              title: Text('Name A to Z', style: style),
              value: Sort.A_TO_Z,
              groupValue: _sortIndexGroup,
              dense: true,
              onChanged: (value) => setState(() {
                _sortIndexGroup = value!;
                _controller.sort(Sort.A_TO_Z);
                Get.back();
              }),
            ),
            RadioListTile(
              title: Text('Name Z to A', style: style),
              value: Sort.Z_TO_A,
              groupValue: _sortIndexGroup,
              dense: true,
              onChanged: (value) => setState(() {
                _sortIndexGroup = value!;
                _controller.sort(Sort.Z_TO_A);
                Get.back();
              }),
            ),
            Divider(color: Colors.grey.shade300, height: 1),
            RadioListTile(
              title: Text('Rating High to Low', style: style),
              value: Sort.RATING_HIGH_TO_LOW,
              groupValue: _sortIndexGroup,
              dense: true,
              onChanged: (value) => setState(() {
                _sortIndexGroup = value!;
                _controller.sort(Sort.RATING_HIGH_TO_LOW);
                Get.back();
              }),
            ),
            RadioListTile(
              title: Text('Rating Low to High', style: style),
              value: Sort.RATING_LOW_TO_HIGH,
              groupValue: _sortIndexGroup,
              dense: true,
              onChanged: (value) => setState(() {
                _sortIndexGroup = value!;
                _controller.sort(Sort.RATING_LOW_TO_HIGH);
                Get.back();
              }),
            ),
            Helper.spaceVertical(20),
            Align(
              alignment: Alignment.bottomRight,
              child: MyFlatButton(
                onPressed: Get.back,
                height: 40,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.red,
                child: Text('Cancel',
                    style: MyTextStyle(fontSize: fontSizeMedium, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
