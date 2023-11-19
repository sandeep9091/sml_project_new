import 'package:flutter/material.dart';

import 'appColors.dart';
import 'appStyles.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;

  //final Color buttonTextColor;
  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final bool isEnable;
  final bool? busy;
  final Color? borderColor;
  final bool isBorder;
  final EdgeInsets? padding;
  final double? borderRadius;
  const AppButton(
      {Key? key,
      this.onPressed,
      required this.title,
      this.textColor,
      this.backgroundColor,
      this.height = 45,
      this.width,
      this.fontSize,
      this.isEnable = false,
      this.borderColor,
      this.isBorder = false,
      this.busy = false,
      this.borderRadius,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(90.0)),
        onTap: onPressed == null
            ? null
            : !isEnable
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    onPressed?.call();
                  },
        child: Container(
          height: height,
          width: width,
          padding:
              padding ?? const EdgeInsets.symmetric(horizontal: 57, vertical: 12),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? 90.0)),
            border: isBorder
                ? Border.all(color: borderColor ?? AppColors.primary)
                : const Border(),
            color: isEnable
                ? (backgroundColor ?? AppColors.primary)
                : AppColors.grey,
          ),
          child: Center(
            child: busy ?? false
                ? SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          AppColors.white,
                        ),
                        strokeWidth: 2.0),
                  )
                : Text(
                    title,
                    style: TextStyle(
                      color: textColor ?? AppColors.white,
                      fontSize: fontSize,
                      fontFamily: FontUtils.primary,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ),
        ));
  }
}