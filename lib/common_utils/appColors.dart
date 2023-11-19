import 'package:flutter/material.dart';

class AppColors{
  static Color primary = const Color(0xff1a5786);
  static Color headingColor = Colors.black;
  static Color controlsHintColor = const Color(0xFFc7c7c7);
  static Color controlsHeadingColor = Colors.black;
  static Color white = Colors.white;
  static Color grey = const Color(0xFF808080);
  static Color semiGrey = const Color(0xFF787276);
  static Color greyLight = const Color(0xFFC5C6D0);
  static Color primaryText = fromHex('#182651');
  static Color primaryButton = fromHex('#314ca3');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}