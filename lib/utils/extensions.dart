
import 'package:flutter/services.dart';

import '../values/strings.dart';
import 'helper.dart';

extension StringExtension on String? {
  String get inCaps => this.notEmpty && this!.length > 0 ? '${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}' : '';

  String get capitalizeFirstOfEach => this!.replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.inCaps).join(' ');

  String get everyFirstDigit => Helper.getEveryFirstDigit(this);

  String get nullSafe => this ?? '';

  String placeholder(String def) => this.notEmpty ? this! : def.nullSafe;

  String get nullStr => this ?? '------';

  bool get notEmpty => !Helper.isEmpty(this);

  bool get empty => Helper.isEmpty(this);

  int get toInt => Helper.parseInt(this);

  double get toDouble => Helper.parseDouble(this);

  void get copy => Clipboard.setData(ClipboardData(text: this.nullSafe));

  List<String> get toList => Helper.toList(this);

  String get t => Strings.get(this);

  bool get isNumeric => this.notEmpty && double.tryParse(this??'0') != null;

  String get formatNumber => Helper.formatNumber(this);

  String get formatNumberWithPlus => Helper.formatNumber(this, withPlus: true);

  String get starred => Helper.starred(this, 6);

// bool get isInt => this.notNull && int.tryParse(this) != null;
//
// bool get isDouble => this.notNull && double.tryParse(this) != null;
//
// String capitalize() {
//   if (isEmpty) {
//     return this;
//   }
//   return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
// }
//
// int countWords() {
//   if (isEmpty) {
//     return 0;
//   }
//   var words = trim().split(RegExp(r'(\s+)'));
//   return words.length;
// }
//
// String removeNumbers() {
//   if (isEmpty) {
//     return this;
//   }
//   var regex = RegExp(r'(\d+)');
//   return replaceAll(regex, '');
// }
//
// String onlyLetters() {
//   if (isEmpty) {
//     return this;
//   }
//   // ignore: unnecessary_raw_strings
//   var regex = RegExp(r'([^a-zA-Z]+)');
//   return replaceAll(regex, '');
// }
//
// bool isIpv4() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(
//       r'((?:^|\s)([a-z]{3,6}(?=://))?(://)?((?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?))(?::(\d{2,5}))?(?:\s|$))');
//   return regex.hasMatch(this);
// }
//
// bool isIpv6() {
//   if (isEmpty) {
//     return false;
//   }
//
//   substring(0, 1);
//   var regex = RegExp(
//       r'(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))');
//   return regex.hasMatch(this);
// }
//
// bool isUrl() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(
//       r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)');
//   return regex.hasMatch(this);
// }
//
// bool isDate() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(
//       r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$');
//   if (regex.hasMatch(this)) {
//     return true;
//   }
//   try {
//     DateTime.parse(this);
//     return true;
//   } on FormatException {
//     return false;
//   }
// }
//
// bool isMail() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(r"(^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)");
//   return regex.hasMatch(this);
// }
//
// bool isNumber() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(r'^\d+$');
//   return regex.hasMatch(this);
// }
//
// bool isStrongPassword() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex =
//       RegExp(r'^(?=.*([A-Z]){1,})(?=.*[!@#$&*]{1,})(?=.*[0-9]{1,})(?=.*[a-z]{1,}).{8,100}$');
//   return regex.hasMatch(this);
// }
//
// bool isGuid() {
//   if (isEmpty) {
//     return false;
//   }
//   var regex = RegExp(
//       r'^(\{{0,1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}\}{0,1})$');
//   return regex.hasMatch(this);
// }
//
// String toCamelCase() {
//   if (isEmpty) {
//     return this;
//   }
//   var words = trim().split(RegExp(r'(\s+)'));
//   var result = words[0].toLowerCase();
//   for (var i = 1; i < words.length; i++) {
//     result += words[i].substring(0, 1).toUpperCase() + words[i].substring(1).toLowerCase();
//   }
//   return result;
// }
//
// String onlyNumbers() {
//   if (isEmpty) {
//     return this;
//   }
//   // ignore: unnecessary_raw_strings
//   var regex = RegExp(r'([^0-9]+)');
//   return replaceAll(regex, '');
// }
//
// String removeLetters() {
//   if (isEmpty) {
//     return this;
//   }
//   // ignore: unnecessary_raw_strings
//   var regex = RegExp(r'([a-zA-Z]+)');
//   return replaceAll(regex, '');
// }
//
// List<Map<String, int>> charOccurences() {
//   if (isEmpty) {
//     return [];
//   }
//   // ignore: omit_local_variable_types
//   List<Map<String, int>> occurences = [];
//   var letters = split('')..sort();
//   var checkingLetter = letters[0];
//   var count = 0;
//   for (var i = 0; i < letters.length; i++) {
//     if (letters[i] == checkingLetter) {
//       count++;
//       if (i == letters.length - 1) {
//         occurences.add({checkingLetter: count});
//         checkingLetter = letters[i];
//       }
//     } else {
//       occurences.add({checkingLetter: count});
//       checkingLetter = letters[i];
//       count = 1;
//     }
//   }
//   return occurences;
// }

// String take(int length) {
//   if (this.notEmpty && this?.length! > length) {
//     return (this?.substring(0, length))! + '...';
//   }
//   return this.nullSafe;
// }

// String reverse() {
//   if (isEmpty) {
//     return this;
//   }
//   var letters = split('').toList().reversed;
//   return letters.reduce((current, next) => current + next);
// }
//
// String first({int n = 1}) {
//   if (isEmpty) {
//     return this;
//   }
//   if (length < n) {
//     return this;
//   }
//   return substring(0, n);
// }
//
// String last({int n = 1}) {
//   if (isEmpty) {
//     return this;
//   }
//   if (length < n) {
//     return this;
//   }
//   return substring(length - n, length);
// }
//
// List<String> toArray() {
//   if (isEmpty) {
//     return [];
//   }
//   return split('');
// }
//
// String stripHtml() {
//   if (isEmpty) {
//     return this;
//   }
//   // ignore: unnecessary_raw_strings
//   var regex = RegExp(r'<[^>]*>');
//   return replaceAll(regex, '');
// }
//
// String ifEmpty(Function act) {
//   return isEmpty ? act() : this;
// }
//
// String repeat(int count) {
//   if (isEmpty || count <= 0) {
//     return this;
//   }
//   var repeated = this;
//   for (var i = 0; i < count - 1; i++) {
//     repeated += this;
//   }
//   return repeated;
// }
//
// String squeeze(String char) {
//   var sb = '';
//   for (var i = 0; i < length; i++) {
//     if (i == 0 || this[i - 1] != this[i] || (this[i - 1] == this[i] && this[i] != char)) {
//       sb += this[i];
//     }
//   }
//   return sb;
// }
//
// bool hasSameCharacters() {
//   if (length > 1) {
//     var b = this[0].toLowerCase();
//     for (var i = 1; i < length; i++) {
//       var c = this[i].toLowerCase();
//       if (c != b) {
//         return false;
//       }
//     }
//   }
//   return true;
// }
//
// String shuffle() {
//   var stringArray = toArray();
//   stringArray.shuffle();
//   return stringArray.join();
// }
//
// bool get asBool => this.toLowerCase() == 'true';
//
// bool hasMatch(String value, String pattern) {
//   return (value == null) ? false : RegExp(pattern).hasMatch(value);
// }
//
// /// Checks if string is Currency.
// bool isCurrency(String s) => hasMatch(s,
//     r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');
//
// /// Checks if string is phone number.
// bool isPhoneNumber(String s) {
//   if (s.length > 16 || s.length < 9) return false;
//   return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
// }
//
// /// Checks if string is email.
// bool isEmail(String s) => hasMatch(s,
//     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//
// /// Checks if string is an html file.
// bool isHTML(String filePath) {
//   return filePath.toLowerCase().endsWith(".html");
// }
//
// bool validateEmail() {
//   if (this == null) return false;
//   return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//       .hasMatch(this);
// }
//
// String removeAllWhiteSpace() => this.notNull ? this.replaceAll(RegExp(r"\s+\b|\b\s"), "") : null;
}