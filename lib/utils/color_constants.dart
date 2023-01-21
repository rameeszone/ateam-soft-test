import 'package:flutter/material.dart';

class ColorConstants {
  ColorConstants._();

  static const Color primaryColor = Color(0xFFCFD4D9);
  static const Color black = Colors.black;
  static const Color green = Colors.green;
  static const Color blue = Colors.blueAccent;
  static const Color white = Colors.white;

  static const Map<int, Color> colorMap = {
    50: Color.fromRGBO(207, 212, 217, .1),
    100: Color.fromRGBO(207, 212, 217, .2),
    200: Color.fromRGBO(207, 212, 217, .3),
    300: Color.fromRGBO(207, 212, 217, .4),
    400: Color.fromRGBO(207, 212, 217, .5),
    500: Color.fromRGBO(207, 212, 217, .6),
    600: Color.fromRGBO(207, 212, 217, .7),
    700: Color.fromRGBO(207, 212, 217, .8),
    800: Color.fromRGBO(207, 212, 217, .9),
    900: Color.fromRGBO(207, 212, 217, 1),
  };
}
