import 'package:flutter/material.dart';

class ThemeColors {
  // //Black Shade
  // static const int _primary = 0xFFFF232020;
  // static const int _r = 35;
  // static const int _g = 32;
  // static const int _b = 32;

  //Purple Theme
  static const int _primary = 0xFFE93323;
  static const int _r = 233;
  static const int _g = 51;
  static const int _b = 35;

  // //Purple
  // static const int _primary = 0xFF7C4DFF;
  // static const int _r = 124;
  // static const int _g = 77;
  // static const int _b = 255;

  static const Map<int, Color> _color = {
    50: Color.fromRGBO(_r, _g, _b, .1),
    100: Color.fromRGBO(_r, _g, _b, .2),
    200: Color.fromRGBO(_r, _g, _b, .3),
    300: Color.fromRGBO(_r, _g, _b, .4),
    400: Color.fromRGBO(_r, _g, _b, .5),
    500: Color.fromRGBO(_r, _g, _b, .6),
    600: Color.fromRGBO(_r, _g, _b, .7),
    700: Color.fromRGBO(_r, _g, _b, .8),
    800: Color.fromRGBO(_r, _g, _b, .9),
    900: Color.fromRGBO(_r, _g, _b, 1),
  };

  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color whiteBlue = Color.fromARGB(255, 242, 243, 248);
  static const Color offWhite = Color.fromARGB(255, 251, 252, 254);
  static const Color backgroundColor = white;
  static const MaterialColor colorPrimary = MaterialColor(_primary, _color);
  static const Color accentColor = Color.fromRGBO(32, 157, 216, 1);
  static const Color defaultTextColor = Colors.black;
  // static const Color defaultTextColor = Color.fromRGBO(32, 36, 37, 1.0);
  static const Color success = Color.fromRGBO(25, 135, 84, 1.0);

  static Color shimmerBaseColor = Colors.grey.shade200;
  static Color shimmerHighlightColor = Colors.grey.shade100;

  static const Color testColor = Color.fromRGBO(93, 45, 182, 1.0);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    // end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
    colors: <Color>[colorPrimary, colorPrimary], // red to yellow
    tileMode: TileMode.clamp, // repeats the gradient over the canvas
  );
  static  LinearGradient gradient2 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    // end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
    colors: <Color>[colorPrimary.shade500, Colors.brown.shade500], // red to yellow
    tileMode: TileMode.clamp, // repeats the gradient over the canvas
  );
}
