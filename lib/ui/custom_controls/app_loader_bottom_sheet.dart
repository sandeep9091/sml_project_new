import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';

class AppLoaderBottomSheet {
  Future<dynamic> showBottomSheet({
    required BuildContext context,
    bool isDismissible = false,
    bool enableDrag = false,
    bool isScrollControlled = true,
    double elevation = 1,
    Color backgroundColor = AppColor.white,
    BoxConstraints constraints = const BoxConstraints(
      minHeight: 200,
      maxHeight: 200,
      minWidth: double.infinity,
    ),
  }) async {
    return await showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      isScrollControlled: true,
      elevation: elevation,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      constraints: constraints,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (ctx) {
        return const Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator.adaptive(
              backgroundColor: AppColor.main,
            ),
          ),
        );
      },
    );
  }
}
