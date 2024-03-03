import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const transparent = Colors.transparent;
  static const primary = Color(0xFF3A18C2);
  static const main = Color(0xFF3A18C2);
  static const toastBgColor = Color(0xffa3a3a3);
  static const Color bgColor = Color(0xffFFFFFF);
  static const Color splashTitle = main;
  static const semiBlack = Color(0xff221F20);
  static const semiGrey = Color(0xff686873);
  static const txtboxHintColor = Color(0xFF858585);
  static const grey = Color(0xFF9E9E9E);
  static const grey400 = Color(0xFFBDBDBD);
  static const grey350 = Color(0xFFD6D6D6);
  static const grey300 = Color(0xFFE0E0E0);
  static const grey200 = Color(0xFFEEEEEE);
  static const yellowDark = Color(0xFFC79807);
  static const white = Color(0xffFFFFFF);
  static const black = Color(0xff000000);
  static const blue = Color(0xFF2196F3);
  static const red = Color(0xFFFF6686);
  static const yellow = Color.fromRGBO(158, 143, 7, 1);
  static const lightBlue = Color(0xFFECF7FF);
  static const lavender = Color(0xFFEADEF4);
  static const lightCyan = Color.fromARGB(100, 196, 226, 224);
  static const green = Color(0xFF28B459);
  static const lightGreen = Color(0xFF28B459);

  static const lightGrayishBlue = Color(0xfff4f4fa);
  static const lightGrayishBlueDark = Color(0xffCDD0E2);
  static const lightGrayishBlueLight = Color(0xffF4F4FA);
  static const selected = main;
  static const unselected = Color(0xFFC4E2E0);

  static const containerBGColor = Color(0xFFE4F1FA);

  static const borderColor = Color.fromARGB(68, 210, 210, 210);

  static const borderShadow = Color.fromARGB(46, 69, 32, 218);

  static Color controlsHintColor = const Color(0xFFc7c7c7);
  static Color primaryText = fromHex('#182651');
  static Color primaryButton = fromHex('#314ca3');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
