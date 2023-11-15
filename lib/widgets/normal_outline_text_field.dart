import 'package:e_plaza/dialogs/popup_menu.dart';
import 'package:e_plaza/dialogs/searchable_list_dialog.dart';
import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NormalOutlineTextField<T> extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  TextInputType inputType = TextInputType.text;
  final bool obSecure;
  final FocusNode? focusNode;
  final void Function(String value)? onChanged;
  String Function(T value)? onSelected;
  void Function()? onTap;
  List<T> dropdownList = [];
  String _fieldType = 'normal';
  bool enable = true;
  int? minLines = 1;
  int? maxLines = 300;
  String? prefixText;
  Widget? prefix;
  EdgeInsets? margin;
  bool showDropdownIcon = false;

  NormalOutlineTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.inputType = TextInputType.text,
    this.obSecure = false,
    this.focusNode,
    this.onChanged,
    this.enable = true,
    this.minLines,
    this.maxLines,
    this.prefix,
    this.prefixText,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  NormalOutlineTextField.dropdown({
    Key? key,
    required this.label,
    required this.controller,
    required this.dropdownList,
    required this.onSelected,
    this.obSecure = false,
    this.focusNode,
    this.onChanged,
    this.prefix,
    this.prefixText,
    this.margin = EdgeInsets.zero,
    this.showDropdownIcon = true,
  }) : super(key: key) {
    _fieldType = 'dropdown';
    enable = false;
  }

  NormalOutlineTextField.dropdownWithSearch({
    Key? key,
    required this.label,
    required this.controller,
    required this.dropdownList,
    required this.onSelected,
    this.obSecure = false,
    this.focusNode,
    this.onChanged,
    this.prefix,
    this.prefixText,
    this.margin = EdgeInsets.zero,
    this.showDropdownIcon = true,
  }) : super(key: key) {
    _fieldType = 'dropdownWithSearch';
    enable = false;
  }

  NormalOutlineTextField.dropdownWithoutMenu({
    Key? key,
    required this.label,
    required this.controller,
    required this.onTap,
    this.inputType = TextInputType.text,
    this.obSecure = false,
    this.focusNode,
    this.onChanged,
    this.prefix,
    this.margin = EdgeInsets.zero,
    this.showDropdownIcon = true,
  }) : super(key: key) {
    _fieldType = 'dropdownWithoutMenu';
    enable = false;
  }

  @override
  Widget build(BuildContext context) {
    return _field;
  }

  Widget get _field {
    if (_fieldType == 'dropdown') {
      return MyPopupMenuButton(
        onTap: Get.focusScope!.unfocus,
        list: dropdownList,
        title: label,
        onSelected: (s) => controller.text = onSelected!.call(s),
        child: _normalField,
      );
    } else if (_fieldType == 'dropdownWithoutMenu') {
      return TextButton(
          onPressed: () {
            Get.focusScope!.unfocus();
            onTap!.call();
          },
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: _normalField);
    } else if (_fieldType == 'dropdownWithSearch') {
      return TextButton(
          onPressed: () {
            Get.focusScope!.unfocus();
            SearchableListDialog<T>(label, dropdownList, isSearch: true).show((object) {
              controller.text = onSelected!.call(object);
            });
          },
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: _normalField);
    } else {
      return _normalField;
    }
  }

  Widget get _normalField {
    return TextFormField(
      // onTap: () {
      //   if (onTap != null) {
      //     Get.focusScope.unfocus();
      //     controller.text = onTap.call();
      //   }
      // },
      enabled: enable,
      controller: controller,
      style: MyTextStyle(color: Colors.black87, fontWeight: FontWeight.w400),
      keyboardType: inputType,
      obscureText: obSecure,
      focusNode: focusNode,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: obSecure ? 1 : maxLines,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        isDense: true,
        hintText: label,
        prefixIcon: prefix,
        // labelText: label.nullSafe,
        labelStyle: MyTextStyle(color: Colors.grey),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        alignLabelWithHint: true,
        // hintStyle: MyTextStyle(color: Colors.grey),
        border: _border,
        focusedBorder: _border,
        enabledBorder: _border,
        disabledBorder: _border,
        contentPadding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.4.h),
        prefixText: prefixText,
        suffixIcon: _fieldType == 'normal' || !showDropdownIcon
            ? null
            : const Icon(Icons.keyboard_arrow_down_rounded,
                color: ThemeColors.colorPrimary, size: 18),
      ),
    );
  }

  OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(color: Colors.black54, width: 0.4),
  );
}
