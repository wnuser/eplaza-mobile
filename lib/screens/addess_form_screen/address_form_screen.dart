import 'package:e_plaza/screens/checkout_screen/checkout_screen.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/normal_text_field.dart';
import 'package:e_plaza/widgets/order_setps.dart';
import 'package:e_plaza/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dialogs/searchable_list_dialog.dart';
import '../../modals/city.dart';
import '../../widgets/app_bar.dart';
import 'controller.dart';

class AddressFormScreen extends StatelessWidget {
  AddressFormScreen({Key? key}) : super(key: key);

  final Controller _controller = Get.put(Controller(), tag: 'AddressFormScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar('Address'),
          OrderSteps(active: 0),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Helper.spaceVertical(8),
                _addressForm(),
                Helper.spaceVertical(40),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: PrimaryButton(
              child: 'Continue',
              onPressed: () {
                Get.to(() => CheckoutScreen());
              },
              borderRadius: 4,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _addressForm() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Form(
          key: _controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text('Address Details',
                  style: MyTextStyle(fontWeight: FontWeight.w600, fontSize: fontSizeLarge)),
              Helper.spaceVertical(12),
              NormalTextField(
                  label: 'House No, Building Name',
                  controller: _controller.addressController,
                  inputType: TextInputType.text,
                  validator: (v) {
                    if (v.empty) {
                      return 'Please Enter House No, Building Name';
                    }
                    return null;
                  }),
              Helper.spaceVertical(12),
              NormalTextField(
                  label: 'Road name, Area colony',
                  controller: _controller.roadNameAreaColonyController,
                  inputType: TextInputType.text,
                  validator: (v) {
                    if (v.empty) {
                      return 'Please Enter Road name, Area colony';
                    }
                    return null;
                  }),
              Helper.spaceVertical(12),
              NormalTextField(
                  label: 'Pin Code',
                  controller: _controller.pinCodeController,
                  inputType: TextInputType.number,
                  validator: (v) {
                    if (v.empty) {
                      return 'Please Enter Pin Code';
                    }
                    return null;
                  }),
              Helper.spaceVertical(12),
              NormalTextField(
                  label: 'Landmark',
                  controller: _controller.landmarkController,
                  inputType: TextInputType.text,
                  validator: (v) {
                    // if (v.isEmpty) {
                    //   return 'Please Enter Landmark';
                    // }
                    return null;
                  }),
              Helper.spaceVertical(12),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Obx(
                    () => _controller.statesList.value != null
                        ? Expanded(
                            child: NormalTextField<State>.dropdownWithoutMenu(
                              label: 'Select State',
                              // enabled: false,
                              controller: _controller.stateController,
                              // dropdownList: _controller.statesList,
                              validator: (v) {
                                if (v.empty) {
                                  return 'Please select state';
                                }
                                return null;
                              },
                              onTap: () {
                                SearchableListDialog('Select State', _controller.statesList)
                                    .show((c) {
                                  _controller.cityController.clear();
                                  _controller.stateController.text = c.name;
                                  _controller.getCities(c.id);
                                });
                              },
                              // onSelected: (c) {
                              //   _controller.cityController.clear();
                              //   _controller.stateController.text = c.name;
                              //   _controller.getCities(c.id);
                              // },
                            ),
                          )
                        : empty(),
                  ),
                  Helper.spaceHorizontal(10),
                  Obx(
                    () => _controller.citiesList.value != null
                        ? Expanded(
                            child: NormalTextField<City>.dropdownWithoutMenu(
                              label: 'Select City',
                              controller: _controller.cityController,
                              // dropdownList: _controller.citiesList,
                              validator: (v) {
                                if (v.empty) {
                                  return 'Please select city';
                                }
                                return null;
                              },
                              onTap: () {
                                SearchableListDialog('Select City', _controller.citiesList)
                                    .show((c) {
                                  _controller.cityController.text = c.name;
                                });
                              },
                              // onSelected: (c) {
                              //   _controller.cityController.text =
                              //       c.name;
                              // },
                            ),
                          )
                        : empty(),
                  ),
                ],
              ),
              Helper.spaceVertical(12),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: NormalTextField(
                        label: 'Phone No',
                        controller: _controller.phoneNoController,
                        inputType: TextInputType.phone,
                        validator: (v) {
                          if (v.empty) {
                            return 'Please enter Phone No';
                          } else if (v!.length < 10 || v.length > 15) {
                            return 'Please enter valid Phone No';
                          }
                          return null;
                        }),
                  ),
                  Helper.spaceHorizontal(10),
                  Expanded(
                    child: NormalTextField(
                        label: 'Alternate Phone',
                        controller: _controller.altPhoneNoController,
                        inputType: TextInputType.phone,
                        validator: (v) {
                          if (v.empty || (v!.length < 10 || v.length > 15)) {
                            return 'Please enter valid alternate Phone No';
                          }
                          return null;
                        }),
                  ),
                ],
              ),
              Helper.spaceVertical(12),
              const Text('Type of address', style: MyTextStyle(fontSize: fontSizeSmall)),
              Helper.spaceVertical(4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _addressTypeItem(icon: Icons.home_rounded, label: 'Home'),
                  Helper.spaceHorizontal(12),
                  _addressTypeItem(icon: Icons.apartment_rounded, label: 'Work'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _addressTypeItem({required IconData icon, required String label}) {
    return Obx(
      () => SizedBox(
        height: 30,
        child: TextButton(
          onPressed: () => _controller.addressType.value = label,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(bottom: 0, top: 0, left: 10, right: 12),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                    width: 1,
                    color: label == _controller.addressType.value
                        ? ThemeColors.colorPrimary
                        : Colors.grey)),
            backgroundColor: label == _controller.addressType.value
                ? ThemeColors.colorPrimary.shade50
                : Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: ThemeColors.colorPrimary, size: 20),
              Helper.spaceHorizontal(10),
              Text(label, style: const MyTextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
