import 'package:flutter/material.dart';

import '../base/base_view_model.dart';
import '../utils/color_utils.dart';

GlobalKey<NavigatorState> appLevelKey = GlobalKey(debugLabel: 'app-key');

class AppViewModel extends BaseViewModel {
  ThemeData _themeData = ThemeData();
  AppTheme _appTheme = AppTheme.light;

  AppTheme get appTheme => _appTheme;

  ThemeData get themeData {
    switch (_appTheme) {
      case AppTheme.dark:
      case AppTheme.light:
        _themeData = _themeData.copyWith(
            brightness: Brightness.light,
            scaffoldBackgroundColor: AppColor.white,
            primaryColor: AppColor.main,
            primaryColorDark: AppColor.black,
            primaryColorLight: AppColor.white,
            floatingActionButtonTheme: _themeData.floatingActionButtonTheme
                .copyWith(
                    backgroundColor: AppColor.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
            backgroundColor: AppColor.lightGrayishBlue,
            cardTheme: CardTheme(
                color: AppColor.white,
                shadowColor: AppColor.lightGrayishBlueDark,
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            appBarTheme: const AppBarTheme(
                color: AppColor.main,
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(
                  color: AppColor.white,
                )),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColor.blue,
              //selectionHandleColor: AppColor.black,
              //selectionColor: AppColor.black,
            ),
            inputDecorationTheme: InputDecorationTheme(
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColor.grey.withOpacity(0.4),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                filled: false,
                border: InputBorder.none,
                enabledBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.lightGrayishBlueDark)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColor.black,
                )),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColor.black,
                )),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColor.black,
                )),
                isCollapsed: true,
                errorStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColor.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColor.black.withOpacity(0.6),
                  fontSize: 14,
                  height: 1.48,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            textTheme: _themeData.textTheme.apply(
                fontFamily: 'Montserrat',
                bodyColor: AppColor.black,
                displayColor: AppColor.black),
            primaryTextTheme: _themeData.textTheme.apply(
                fontFamily: 'Montserrat',
                bodyColor: AppColor.black,
                displayColor: AppColor.black),
            iconTheme: const IconThemeData(
              color: AppColor.white,
            ),
            errorColor: AppColor.lightGrayishBlueDark,
            indicatorColor: AppColor.lightGrayishBlueDark,
            buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              textTheme: ButtonTextTheme.normal,
            ),
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: AppColor.white));
        break;
    }

    return _themeData;
  }

  ThemeData toggleTheme() {
    if (appTheme == AppTheme.dark) {
      _appTheme = AppTheme.light;
    } else {
      _appTheme = AppTheme.dark;
    }
    return themeData;
  }
}

enum AppTheme {
  dark,
  light,
}
