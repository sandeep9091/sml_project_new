import 'package:flutter/material.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';

import '../../utils/asset_utils.dart';
import '../../utils/color_utils.dart';

class AppErrorWidget extends StatelessWidget {
  final String? str;
  final bool enableBorder;
  final double radius;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  const AppErrorWidget({
    super.key,
    this.str,
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
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const SizedBox(width: 10),
        const Image(image: AssetImage(
                AssetUtils.noDocuments),height: 120,width: 120,color: AppColor.grey,),
        const SizedBox(height: 10),
        Text(
            str ?? "No Documents, Please try again...",
            style: TextStyle(
              color: AppColor.grey,
              fontSize: 20,
              fontFamily: FontUtils.primary.toString(),
              fontWeight: FontWeight.w400,
            ),
          ),
      ]),
    );
  }
}
