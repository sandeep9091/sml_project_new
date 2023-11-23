import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/font_utils.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool applyBgColor;
  final Color bgColor;
  final bool isMarginApply;
  final bool disable;
  final bool isLoading;
  final double height;
  final double width;
  final Widget? child;

  const AppButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.bgColor = AppColor.main,
      this.applyBgColor = true,
      this.isMarginApply = false,
      this.disable = false,
      this.isLoading = false,
      this.height = 45,
      this.width = 150,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColor.transparent,
      splashColor: AppColor.transparent,
      highlightColor: AppColor.transparent,
      onTap: isLoading ? null : onTap,
      child: Container(
        height: height,
        width: width,
        constraints: BoxConstraints(
          maxHeight: height,
          minHeight: height,
          maxWidth: width,
          minWidth: width,
        ),
        margin: isMarginApply
            ? const EdgeInsets.only(bottom: 30, left: 35, right: 35)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          border: applyBgColor
              ? const Border.symmetric(
                  horizontal: BorderSide.none,
                  vertical: BorderSide.none,
                )
              : Border.all(),
          color: disable
              ? Colors.grey
              : applyBgColor
                  ? bgColor
                  : AppColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
              )
            : child != null
                ? child!
                : Text(
                    title,
                    style: TextStyle(
                      color: disable
                          ? Colors.grey.shade100
                          : applyBgColor
                              ? AppColor.white
                              : AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontUtils.primary.toString(),
                      fontSize: 14,
                    ),
                  ),
      ),
    );
  }
}
