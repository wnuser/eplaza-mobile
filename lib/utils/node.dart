import 'package:flutter/material.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class CustomFocusNode extends FocusNode {

  static bool first = true;

  @override
  bool get hasFocus => !first;
}
