import 'package:e_plaza_vendor/screens/product_listing/components/tile.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/utils/toasty.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/app_bar.dart';
import 'package:e_plaza_vendor/widgets/my_network_image.dart';
import 'package:e_plaza_vendor/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../dialogs/delivery_times_bottom_sheet_dialog.dart';
import '../../modals/sub_category.dart' as sub;
import '../../values/dimen.dart';
import '../../widgets/normal_text_field.dart';
import '../../widgets/widgets.dart';
import 'controller.dart';

class AddProductScreen extends StatefulWidget {
  final String action;
  final num? productId;

  AddProductScreen({required this.action, this.productId, Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final Controller _controller = Get.put(Controller(), tag: 'AddProductScreenController');

  final imgSize = 20.w;

  @override
  void initState() {
    _controller.getProductDetails(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar((widget.action == 'ADD' ? 'Add' : 'Edit') + ' Product', enableSearch: true),
          Helper.spaceVertical(12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: Form(
                  key: _controller.formKey,
                  child: ListView(
                    controller: _controller.scrollController,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                            height: imgSize,
                            // child: ListView(
                            //   shrinkWrap: true,
                            //   physics: BouncingScrollPhysics(),
                            //   scrollDirection: Axis.horizontal,
                            //   children: [
                            //     Obx(() => _controller.images.length < 3 ? _pickFileWidget(null) : empty()),
                            child: Obx(
                              () => _controller.images.isNotEmpty &&
                                      _controller.imageErrors.isNotEmpty
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
                            )
                            //   ],
                            // ),
                            ),
                      ),
                      Helper.spaceVertical(12),
                      NormalTextField(
                        label: 'Product Title',
                        controller: _controller.titleController,
                        inputType: TextInputType.text,
                        contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        validator: Helper.emptyValidator,
                        // border: NormalTextField.outlinedBorder,
                      ),
                      Helper.spaceVertical(12),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: NormalTextField(
                              label: 'MRP/Sale Price',
                              controller: _controller.offerPriceController,
                              inputType: TextInputType.number,
                              prefixText: Const.currencySymbol,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              // contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                              onChanged: _controller.onPriceChange,
                              validator: Helper.emptyValidator,
                              border: NormalTextField.outlinedBorder,
                            ),
                          ),
                          Helper.spaceHorizontal(20),
                          Expanded(
                            child: NormalTextField(
                              label: 'Discount Price',
                              controller: _controller.discountPriceController,
                              inputType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              // contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                              onChanged: _controller.onPriceChange,
                              prefixText: Const.currencySymbol,
                              validator: Helper.emptyValidator,
                              border: NormalTextField.outlinedBorder,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(top: 5, right: 0),
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            color: ThemeColors.colorPrimary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Obx(
                            () => Text(
                              _controller.calculatedPercentage.value < 0 ||
                                      _controller.calculatedPercentage.value > 100
                                  ? 'Invalid Price'
                                  : _controller.calculatedPercentage.value.toStringAsFixed(1) +
                                      '% OFF',
                              style: MyTextStyle(
                                color: Colors.white,
                                fontSize: fontSizeSmall,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Helper.spaceVertical(12),
                      Obx(
                        () => _controller.categories.value != null
                            ? NormalTextField<sub.SubCategory>.dropdownWithSearch(
                                label: 'Category',
                                controller: _controller.categoryController,
                                dropdownList: _controller.categories,
                                onSelected: (c) {
                                  _controller.selectedCategoryId = (c.id ?? 0).toString();
                                  return c.name.nullStr;
                                },
                                contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                validator: Helper.emptyValidator,
                          // border: NormalTextField.outlinedBorder,
                              )
                            : empty(),
                      ),
                      Helper.spaceVertical(12),
                      NormalTextField(
                        label: 'Description',
                        controller: _controller.descriptionController,
                        inputType: TextInputType.text,
                        contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        minLines: 2,
                        maxLines: 120,
                        validator: Helper.emptyValidator,
                        // border: NormalTextField.outlinedBorder,
                      ),
                      Helper.spaceVertical(12),
                      NormalTextField(
                        label: 'Stock  Quantity',
                        controller: _controller.stockController,
                        inputType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        validator: Helper.emptyValidator,
                        // border: NormalTextField.outlinedBorder,
                      ),
                      Helper.spaceVertical(12),
                      NormalTextField.dropdownWithoutMenu(
                        label: 'Shipping Policy',
                        controller: _controller.shippingPolicyController,
                        contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        validator: Helper.emptyValidator,
                        // border: NormalTextField.outlinedBorder,
                        onTap: () {
                          DeliveryTimesBottomSheetDialog(_controller.deliveryTimes, (time) {
                            _controller.shippingPolicyController.text = time.txt;
                            _controller.selectedShippingPolicyId = time.id.toString();
                          });
                        },
                      ),
                      Helper.spaceVertical(12),
                      Tile('Product Policy'),
                      Helper.spaceVertical(4),
                      Obx(
                        () => _cb('Cancellation', _controller.cancellationPolicy.value, (b) {
                          _controller.cancellationPolicy.value = b!;
                        }),
                      ),
                      Obx(
                        () => _cb('Exchange', _controller.exchange.value, (b) {
                          _controller.exchange.value = b!;
                        }),
                      ),
                      Obx(
                        () => _cb('Return', _controller.return_.value, (b) {
                          _controller.return_.value = b!;
                          print(b);
                          if (b) {
                            _controller.scrollController.animateTo(
                              _controller.scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                            );
                          }
                        }),
                      ),
                      Obx(
                        () => _controller.return_.value
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child:
                                    Text('Refund will be in 7 days according to Eplaza standard'),
                              )
                            : empty(),
                      ),
                      Helper.spaceVertical(40),
                    ],
                  ),
                ),
            ),
          ),
          Obx(
            () => _controller.status.value == Status.PROGRESS
                ? LinearProgressIndicator()
                : PrimaryButton(
                    child: widget.action == 'ADD' ? 'Add Product' : 'Edit Product',
                    width: 90.w,
                    height: 6.h,
                    borderRadius: 6,
                    textStyle: MyTextStyle(
                      color: ThemeColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    onPressed: () {
                      if (widget.action == 'ADD') {
                        _controller.addProduct();
                      } else {
                        Toasty.info('Coming Soon...');
                      }
                    },
                  ),
          ),
          Helper.spaceVertical(5),
        ]),
      ),
    );
  }

  Widget _pickFileWidget(c, i) {
    var image = _controller.images[i];
    return Obx(
      () => _controller.imageErrors.value != null
          ? Container(
              width: imgSize,
              height: imgSize,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _controller.imageErrors[i] ? Colors.red : Colors.grey.shade400,
                  width: 1,
                ),
              ),
              child: image != null
                  ? Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: image is String
                              ? MyNetworkImage(path: image, width: imgSize, height: imgSize)
                              : Image.file(image, width: imgSize, height: imgSize),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: smallIcon(
                              Icons.close,
                              () {
                                _controller.images[i] = null;
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
                      child: assetImage(
                        'assets/icons/camera.png',
                        color: _controller.imageErrors[i] ? Colors.red : Colors.black54,
                      ),
                    ),
            )
          : empty(),
    );
  }

  Widget _cb(String title, bool checked, void Function(bool? b) cb) {
    return TextButton(
        onPressed: () {
          cb(!checked);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(value: checked, onChanged: cb),
            Text(
              title,
              style: MyTextStyle(
                // color: checked ? ThemeColors.colorPrimary : ThemeColors.colorPrimary,
                fontWeight: checked ? FontWeight.w600 : FontWeight.w500,
              ),
            )
          ],
        ));
  }
}
