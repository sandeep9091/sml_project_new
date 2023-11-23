// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:math';
import 'package:data/db/constants/pref_keys.dart';
import 'package:data/source/secure_storage/secure_storage_ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:io';


class AppCommonUtils {
  late final SecureStorageDataSource _secureStorageDataSource;

  static final AppCommonUtils _singleton = AppCommonUtils._internal();

  AppCommonUtils._internal() {
    _secureStorageDataSource = SecureStorageDataSourceImpl();
  }

  factory AppCommonUtils() {
    return _singleton;
  }

  SecureStorageDataSource secureStorage() => _secureStorageDataSource;
  String tokenId = "";
  getTokenId() async {
    tokenId = await AppCommonUtils().secureStorage().getValue(
          key: PrefKeys.tokenId,
        );
  }

  // getTempDirectory() async {
  //   Directory? appPath = await getApplicationSupportDirectory();
  //   return appPath.path;
  // }

  String greeting(BuildContext context) {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    }
    if (hour < 17) {
      return "Good Afternoon";
    }
    return "Good Evening";
  }

// 2023-08-22 14:20:04 to 13 Sep 2023
  static String formatDateToDate(String date) {
    if (date == "NA") {
      return date;
    } else {
      try {
        DateTime input = DateTime.parse(date);
        var day = input.day.toString();
        var month = DateFormat.MMMM().format(input);
        var year = DateFormat.y().format(input);
        var finalDate = "$day $month $year";
        return finalDate;
      } catch (e) {
        return '';
      }
    }
  }

  // 2023-09-14 14:20:04 to 14 Sep, 2023
  static String formatDateTimeToDate(String date) {
    try {
      DateTime input = DateTime.parse(date);
      var day = input.day.toString();
      var month = DateFormat.MMM().format(input);
      var year = DateFormat.y().format(input);
      var finalDate = "$day $month, $year";
      return finalDate;
    } catch (e) {
      return '';
    }
  }

  // 2023-09-14 14:20:04 to 14-09-2023
  static String formatDateTimeToDateReverse(String date) {
    try {
      DateTime input = DateTime.parse(date);
      var day = input.day.toString();
      var month = input.month.toString();
      var year = DateFormat.y().format(input);
      var finalDate = "$day-$month-$year";
      return finalDate;
    } catch (e) {
      return '';
    }
  }

    static String formatEpochToDateTime(int epoch) {
    try {
      var dt = DateTime.fromMillisecondsSinceEpoch(epoch);
      var finalDate = DateFormat('dd-MM-yyyy, hh:mm a').format(dt);
      return finalDate;
    } catch (e) {
      return '';
    }
  }

  String getMobileSubString(String num) {
    if (num.length > 10) {
      return num.substring(2, num.length);
    } else {
      return num;
    }
  }

  static Future<String> concertLocalImageToBase64(String imagePath) async {
    ByteData bytes = await rootBundle.load(imagePath);
    var buffer = bytes.buffer;
    String imgBase64 = base64Encode(Uint8List.view(buffer));
    String imageConverted = "data:image/png;base64,$imgBase64";
    return imageConverted;
  }

  LinearGradient generateRandomGradient() {
    // Generate two random colors
    Color color1 = getRandomColor();
    Color color2 = getRandomColor();

    // Create a gradient with the random colors
    return LinearGradient(
      colors: [color1, color2],
    );
  }

  Color getRandomColor() {
    // Generate random RGB values
    int red = Random().nextInt(256);
    int green = Random().nextInt(256);
    int blue = Random().nextInt(256);

    // Create a color from the RGB values
    return Color.fromARGB(255, red, green, blue);
  }
}
