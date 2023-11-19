import 'package:flutter/material.dart';

class RoundedCornerContainer extends StatelessWidget {
  final EdgeInsets containerPadding;
  final Widget child;
  final Color containerColor;
  final BoxConstraints containerContraints;
  final EdgeInsets padding;
  final double borderRadius;
  const RoundedCornerContainer({
    Key? key,
    this.containerPadding = const EdgeInsets.all(16.0),
    required this.containerColor,
    required this.child,
    this.containerContraints = const BoxConstraints(
      minWidth: double.infinity,
      minHeight: 145,
    ),
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
    this.borderRadius = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        padding: containerPadding,
        constraints: containerContraints,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
