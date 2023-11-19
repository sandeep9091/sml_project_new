import 'package:flutter/material.dart';

SnackBar customSnackBar({
  required String content,
  SnackBarBehavior behavior = SnackBarBehavior.fixed,
  bool isSuccess = false,
  Color color = Colors.red,
  Color textColor = Colors.white,
  double margin = 40,
  Duration duration = const Duration(seconds: 3),
}) {
  return SnackBar(
    padding: const EdgeInsets.all(10),
    duration: duration,
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: behavior,
    content: Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 40),
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSuccess ? Colors.black : color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: TextStyle(
              color: textColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    ),
  );
}
