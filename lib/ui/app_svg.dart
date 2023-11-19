import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../main/app_viewmodel.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import '../di/app/app_modules.dart';

class AppSvg {
  AppSvg._();

  static Widget asset(String assetName,
      {double? width,
      String? darkAssetName,
      double? height,
      BoxFit fit = BoxFit.contain,
      Color? color,
      alignment = Alignment.center,
      BlendMode colorBlendMode = BlendMode.srcIn,
      String? semanticsLabel}) {
    if (kIsWeb) {
      return Consumer(
        builder: (context, watch, child) => Image.network(
          darkAssetName != null
              ? (watch.watch(appViewModel).appTheme == AppTheme.dark
                  ? darkAssetName
                  : assetName)
              : assetName,
          width: width,
          height: height,
          fit: fit,
          color: color,
          alignment: alignment,
        ),
      );
    }
    return Consumer(
      builder: (context, watch, child) => SvgPicture.asset(
          darkAssetName != null
              ? (watch.watch(appViewModel).appTheme == AppTheme.dark
                  ? darkAssetName
                  : assetName)
              : assetName,
          width: width,
          height: height,
          fit: fit,
          color: color,
          alignment: alignment,
          colorBlendMode: colorBlendMode,
          semanticsLabel: semanticsLabel),
    );
  }

  static Widget network(String url,
      {double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      Color? color,
      alignment = Alignment.center,
      BlendMode colorBlendMode = BlendMode.srcIn,
      String? semanticsLabel}) {
    return Consumer(
      builder: (context, watch, child) => SvgPicture.network(url,
          width: width,
          height: height,
          fit: fit,
          color: color,
          alignment: alignment,
          colorBlendMode: colorBlendMode,
          semanticsLabel: semanticsLabel),
    );
  }

  static ImageProvider provider(String assetName,
      {Color? color, Size? size, required int height}) {
    return svg_provider.Svg(assetName, color: color, size: size);
  }
}
