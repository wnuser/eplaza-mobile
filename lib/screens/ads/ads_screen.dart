import 'dart:io';

import 'package:e_plaza_vendor/modals/ad.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/widgets/normal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../values/dimen.dart';
import '../../values/theme_colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/widgets.dart';
import 'components/controller.dart';

class AdsScreen extends StatefulWidget {
  AdsScreen();

  @override
  _AdsScreenState createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> with TickerProviderStateMixin {
  _AdsScreenState();

  final Controller _controller = Get.put<Controller>(Controller(), tag: 'AdsController');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            MyAppBar('Ads'),
            _leadList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addAdDialog,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _leadList() {
    return Expanded(
      child: Obx(() {
        if (_controller.status.value == Status.PROGRESS /* && _controller.contacts.isEmpty*/) {
          return progressLayout();
        } else if (_controller.status.value != Status.PROGRESS && _controller.ads.isEmpty) {
          return emptyLayout(title: 'No Lists!');
        } else {
          return Scrollbar(
            thickness: 3,
            radius: Radius.circular(2),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 80),
              itemCount: _controller.ads.length,
              itemBuilder: _item,
            ),
          );
        }
      }),
    );
  }

  Widget _item(BuildContext c, int pos) {
    Ad data = _controller.ads[pos];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: Colors.grey.shade300),
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.only(left: 17, right: 16, top: 10, bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [

            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title.nullSafe,
                    style: TextStyle(
                        color: ThemeColors.defaultTextColor,
                        fontSize: fontSizeMedium,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data.title.nullSafe,
                    style: TextStyle(
                        color: ThemeColors.defaultTextColor,
                        fontSize: fontSizeSmall,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    data.link.nullSafe,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: fontSizeMini,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            smallIconImage('assets/icons/img.png', () {}, color: Colors.red, factor: 2.2),
            Helper.spaceHorizontal(2),
            smallIconImage('assets/icons/delete.png', () {}, color: Colors.red)
          ],
        ),
      ),
    );
  }

  void addAdDialog() {
    _controller.file.value = File('');

    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
              decoration: Helper.dialogBoxDecoration,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Create Ad',
                      style:
                          TextStyle(fontSize: fontSizeLarge, color: ThemeColors.defaultTextColor),
                    ),
                  ),
                  Helper.spaceVertical(20),
                  NormalTextField(
                      label: 'Title',
                      controller: _controller.titleController,
                      inputType: TextInputType.name),
                  Helper.spaceVertical(10),
                  NormalTextField(
                      label: 'Link',
                      controller: _controller.linkController,
                      inputType: TextInputType.url),
                  Helper.spaceVertical(10),
                  NormalTextField(
                      label: 'Info',
                      controller: _controller.infoController,
                      inputType: TextInputType.multiline),
                  Helper.spaceVertical(10),
                  Obx(() => FileWidget('Image', 'Click to select', _controller.file.value,
                      _controller.pickFile, '')),
                  Helper.spaceVertical(20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        cancelButton('Close', Get.back),
                        // negativeButton('Close', () => Get.back()),
                        Helper.spaceHorizontal(10),
                        // submitButton('Submit', _controller.addLeadGroup),
                        submitButton('Submit', () {}),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

// Widget _fi() {
//   return ListTile(
//     onTap: _controller.pickFile,
//     dense: true,
//     title: Text('Import File'),
//     subtitle: Text('Click to select'),
//     tileColor: Colors.grey.shade100,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8),
//     ),
//     leading: Obx(
//       () => _controller.file.value.path.empty
//           ? Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(Icons.add, color: Colors.black, size: 20),
//             )
//           : Image.file(
//               _controller.file.value,
//               width: 40,
//               height: 40,
//               errorBuilder: (a, b, c) {
//                 return assetImage('assets/icons/xls.png', width: 40, height: 40);
//               },
//             ),
//     ),
//     trailing: _controller.file.value.path.notEmpty ? Icon(Icons.check, color: Colors.green, size: 22) : empty(),
//   );
// }
}
