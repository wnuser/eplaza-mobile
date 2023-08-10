import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/store_category.dart';
import '../../utils/const.dart';
import '../../widgets/app_bar2.dart';
import '../../widgets/custom_bottom_nav_bar_static.dart';
import '../product_preview/product_preview_screen.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 20), () => Get.focusScope!.unfocus());
    Future.delayed(Duration(milliseconds: 50), () => Get.focusScope!.unfocus());
    Future.delayed(Duration(milliseconds: 100), () => Get.focusScope!.unfocus());
    Future.delayed(Duration(milliseconds: 400), () => Get.focusScope!.unfocus());
    Future.delayed(Duration(milliseconds: 800), () => Get.focusScope!.unfocus());
    Future.delayed(Duration(milliseconds: 1200), () => Get.focusScope!.unfocus());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar2(),
          // MyAppBar(
          //   widget.storeCategory.title.nullStr,
          //   enableSearch: true,
          //   searchCallBack: _controller.filterList,
          //   searchExpanded: true,
          //   searchHint: 'Favorite shop...',
          //   // trailing: [
          //   //   // TextButton(
          //   //   //   onPressed: () {},
          //   //   //   child: assetImage('assets/icons/preview.png',
          //   //   //       width: 18, height: 18, color: Colors.black),
          //   //   // ),
          //   //   smallIconImage(
          //   //     'assets/icons/preview.png',
          //   //     () {},
          //   //     iconColor: Colors.white,
          //   //     size: 44,
          //   //   ),
          //   //   Helper.spaceHorizontal(6),
          //   // ],
          // ),
          // _filterLayout(),
          // Divider(thickness: 1, height: 0),
          Expanded(
              child: ListView(
            children: [
              // GlobalSlider(_controller.slides),
              assetImage('assets/images/store1.jpeg', width: 100.w, fit: BoxFit.fitWidth),
              // StoreCategories(categories: _controller.storeCategories),
              Helper.spaceVertical(8),
              _preview(),
              Helper.spaceVertical(12),
              _categories(),
              Helper.spaceVertical(2),
              Obx(
                () => GridView.builder(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 80),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 6,
                    childAspectRatio: 1 / 1.22,
                  ),
                  itemBuilder: (c, i) {
                    return StoreItem(i, _controller.shops[i]);
                  },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _controller.shops.length,
                ),
              ),
            ],
          ))
        ]),
      ),
      bottomNavigationBar: CustomBottomNavBar(-1),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ProductPreviewScreen());
        },
        backgroundColor: ThemeColors.colorPrimary,
        elevation: 6,
        splashColor: Colors.black,
        child: assetImage('assets/icons/box.png', width: 22, height: 22),
      ),
    );
  }

  // Widget _filterLayout() => Container(
  //       decoration: BoxDecoration(color: Colors.white),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           Expanded(
  //             flex: 1,
  //             child: MyFlatButton(
  //               height: 45,
  //               onPressed: _sortDialog,
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   assetImage('assets/icons/sort.png', width: 22, height: 22, color: Colors.black),
  //                   Helper.spaceHorizontal(10),
  //                   Text('Sort', style: MyTextStyle(fontSize: fontSizeMedium))
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Container(width: 1, height: 30, color: Colors.grey),
  //           Expanded(
  //             flex: 1,
  //             child: MyFlatButton(
  //               height: 45,
  //               onPressed: () {},
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.max,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   assetImage('assets/icons/preview.png',
  //                       width: 18, height: 18, color: Colors.black),
  //                   Helper.spaceHorizontal(10),
  //                   Text('Product Preview', style: MyTextStyle(fontSize: fontSizeMedium))
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //
  // void _sortDialog() {
  //   MyTextStyle style = MyTextStyle(color: Colors.black, fontSize: fontSizeMedium);
  //   Get.bottomSheet(Dialog(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //     child: Container(
  //       width: 100.w - 10,
  //       padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
  //       decoration: Helper.dialogBoxDecoration,
  //       child: ListView(
  //         shrinkWrap: true,
  //         physics: BouncingScrollPhysics(),
  //         children: [
  //           Align(
  //             alignment: Alignment.center,
  //             child: Text(
  //               'Sort By',
  //               style: MyTextStyle(fontSize: fontSizeLarge),
  //             ),
  //           ),
  //           Helper.spaceVertical(20),
  //           RadioListTile(
  //             title: Text('Newest', style: style),
  //             value: Sort.NEWEST,
  //             groupValue: _sortIndexGroup,
  //             dense: true,
  //             onChanged: (value) => setState(() {
  //               _sortIndexGroup = value!;
  //               _controller.sort(Sort.NEWEST);
  //               Get.back();
  //             }),
  //           ),
  //           RadioListTile(
  //             title: Text('Oldest', style: style),
  //             value: Sort.OLDEST,
  //             groupValue: _sortIndexGroup,
  //             dense: true,
  //             onChanged: (value) => setState(() {
  //               _sortIndexGroup = value!;
  //               _controller.sort(Sort.OLDEST);
  //               Get.back();
  //             }),
  //           ),
  //           Divider(color: Colors.grey.shade300, height: 1),
  //           RadioListTile(
  //             title: Text('Name A to Z', style: style),
  //             value: Sort.A_TO_Z,
  //             groupValue: _sortIndexGroup,
  //             dense: true,
  //             onChanged: (value) => setState(() {
  //               _sortIndexGroup = value!;
  //               _controller.sort(Sort.A_TO_Z);
  //               Get.back();
  //             }),
  //           ),
  //           RadioListTile(
  //             title: Text('Name Z to A', style: style),
  //             value: Sort.Z_TO_A,
  //             groupValue: _sortIndexGroup,
  //             dense: true,
  //             onChanged: (value) => setState(() {
  //               _sortIndexGroup = value!;
  //               _controller.sort(Sort.Z_TO_A);
  //               Get.back();
  //             }),
  //           ),
  //           // Divider(color: Colors.grey.shade300, height: 1),
  //           // RadioListTile(
  //           //   title: Text('Rating High to Low', style: style),
  //           //   value: Sort.RATING_HIGH_TO_LOW,
  //           //   groupValue: _sortIndexGroup,
  //           //   dense: true,
  //           //   onChanged: (value) => setState(() {
  //           //     _sortIndexGroup = value!;
  //           //     _controller.sort(Sort.RATING_HIGH_TO_LOW);
  //           //     Get.back();
  //           //   }),
  //           // ),
  //           // RadioListTile(
  //           //   title: Text('Rating Low to High', style: style),
  //           //   value: Sort.RATING_LOW_TO_HIGH,
  //           //   groupValue: _sortIndexGroup,
  //           //   dense: true,
  //           //   onChanged: (value) => setState(() {
  //           //     _sortIndexGroup = value!;
  //           //     _controller.sort(Sort.RATING_LOW_TO_HIGH);
  //           //     Get.back();
  //           //   }),
  //           // ),
  //           // Helper.spaceVertical(20),
  //           Align(
  //             alignment: Alignment.bottomRight,
  //             child: MyFlatButton(
  //               onPressed: Get.back,
  //               height: 40,
  //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //               color: Colors.red,
  //               child: Text('Cancel',
  //                   style: MyTextStyle(fontSize: fontSizeMedium, color: Colors.white)),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ));
  // }

  Widget _preview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Daily Needs & Sweets, In Bilaspur',
              style: MyTextStyle(
                fontSize: fontSizeLarge,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Helper.spaceHorizontal(4),
          // TextButton(
          //   onPressed: () {},
          //   style: TextButton.styleFrom(
          //     padding: EdgeInsets.all(6),
          //   ),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Text(
          //         'Product Preview',
          //         style: MyTextStyle(
          //           color: Colors.black,
          //           fontSize: fontSizeMini,
          //           fontWeight: FontWeight.w500,
          //           height: 1,
          //         ),
          //         maxLines: 2,
          //         textAlign: TextAlign.center,
          //       ),
          //       assetImage('assets/images/bbbb.jpg', width: 40, height: 40),
          //       Text(
          //         'Daily Needs',
          //         style: MyTextStyle(
          //           color: ThemeColors.colorPrimary,
          //           fontSize: fontSizeSmall,
          //           fontWeight: FontWeight.w500,
          //           height: 1,
          //         ),
          //         maxLines: 2,
          //         textAlign: TextAlign.center,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _categories() {
    return SizedBox(
      height: 24,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _controller.storeCategories.length,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (c, i) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            padding: EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: ThemeColors.colorPrimary, width: 1.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              _controller.storeCategories[i].title.nullSafe,
              style: MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w500),
            ),
          );
        },
      ),
    );
  }
}
