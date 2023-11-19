import 'package:flutter/material.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';

import '../../utils/asset_utils.dart';
import '../../utils/color_utils.dart';
import '../ui/app_svg.dart';


class AppErrorWidget extends StatelessWidget {
  final String str;
  final bool enableBorder;
  final double radius;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  const AppErrorWidget({
    super.key,
    required this.str,
    this.enableBorder = false,
    this.radius = 4,
    this.margin = const EdgeInsets.only(top: 10),
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColor.lightBlue,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: enableBorder ? AppColor.lightBlue : AppColor.lightBlue,
        ),
      ),
      child: Row(children: [
        const SizedBox(width: 10),
        enableBorder
            ? AppSvg.asset(AssetUtils.logo, width: 12)
            : Image.asset(
                AssetUtils.logo,
                height: 16,
              ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            str,
            style: TextStyle(
              color: AppColor.lightBlue,
              fontSize: 10,
              fontFamily: FontUtils.Montserrat.toString(),
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ]),
    );
  }
}
