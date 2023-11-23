import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/color_utils.dart';

class AppToast {
  AppToast._();

  static showToast(
    String? message, {
    Color backgroundColor = AppColor.toastBgColor,
    Toast duration = Toast.LENGTH_LONG,
    Color textColor = AppColor.white,
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) async {
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: duration,
      gravity: gravity,
      backgroundColor: backgroundColor,
      timeInSecForIosWeb: 3,
      textColor: textColor,
      fontSize: 14,
    );
  }
}
