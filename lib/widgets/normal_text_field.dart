import 'package:e_plaza_vendor/dialogs/popup_menu.dart';
import 'package:e_plaza_vendor/dialogs/searchable_list_dialog.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/size_config.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NormalTextField<T> extends StatelessWidget {
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
  EdgeInsets? contentPadding;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String? value)? validator;
  InputBorder? border;
  int? maxLength;

  NormalTextField({
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
    this.contentPadding,
    this.inputFormatters = const <TextInputFormatter>[],
    this.validator,
    this.border,
    this.maxLength,
  }) : super(key: key);

  NormalTextField.dropdown({
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
    this.contentPadding,
    this.inputFormatters = const <TextInputFormatter>[],
    this.validator,
    this.border,
    this.maxLength,
  }) : super(key: key) {
    _fieldType = 'dropdown';
    enable = false;
  }

  NormalTextField.dropdownWithSearch({
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
    this.contentPadding,
    this.inputFormatters = const <TextInputFormatter>[],
    this.validator,
    this.border,
    this.maxLength,
  }) : super(key: key) {
    _fieldType = 'dropdownWithSearch';
    enable = false;
  }

  NormalTextField.dropdownWithoutMenu({
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
    this.contentPadding,
    this.inputFormatters = const <TextInputFormatter>[],
    this.validator,
    this.border,
    this.maxLength,
  }) : super(key: key) {
    _fieldType = 'dropdownWithoutMenu';
    enable = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(margin: margin, decoration: _containerDecoration, child: _field);
  }

  Widget get _field {
    if (_fieldType == 'dropdown') {
      return MyPopupMenuButton(
        onTap: Get.focusScope!.unfocus,
        list: dropdownList,
        title: label,
        onSelected: (s) => controller.text = onSelected!.call(s as T),
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
      validator: validator,
      enabled: enable,
      controller: controller,
      inputFormatters: inputFormatters,
      style: MyTextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
      keyboardType: inputType,
      obscureText: obSecure,
      focusNode: focusNode,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: obSecure ? 1 : maxLines,
      maxLength: maxLength ?? 2000,
      decoration: InputDecoration(
        isDense: true,
        hintText: label,
        prefixIcon: prefix,
        labelText: label.nullSafe,
        labelStyle: MyTextStyle(color: Colors.grey),
        // hintStyle: MyTextStyle(color: Colors.grey),
        filled: false,
        // fillColor: Colors.white,
        errorStyle: TextStyle(color: Colors.red),
        border: border ?? underlineBorder,
        focusedBorder: border ?? underlineBorder,
        enabledBorder: border ?? underlineBorder,
        disabledBorder: border ?? underlineBorder,
        contentPadding: contentPadding/* ?? EdgeInsets.symmetric(vertical: 0.3.h)*/,
        counterText: '',
        prefixText: prefixText,
        suffixIcon: _fieldType == 'normal'
            ? null
            : const Icon(Icons.keyboard_arrow_down_rounded,
                color: ThemeColors.colorPrimary, size: 18),
      ),
    );
  }

  BoxDecoration get _containerDecoration => BoxDecoration(
        // color: ThemeColors.whiteBlue,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(160, 255, 255, 255),
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      );

  static UnderlineInputBorder underlineBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 0.6),
  );

  static OutlineInputBorder outlinedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 0.6),
    borderRadius: BorderRadius.circular(8),
  );
}
