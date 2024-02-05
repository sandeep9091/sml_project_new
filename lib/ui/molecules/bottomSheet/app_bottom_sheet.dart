import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';

class AppBottomSheet {
  AppBottomSheet._();

  static show(BuildContext context,
      {bool isScrollControlled = false,
      bool isDismissible = true,
      bool enableDrag = true,
      bool closeBottonEnable = true,
      required Widget Function(BuildContext context) builder,
      BoxConstraints? constraints,
      Color? backgroundColor}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      backgroundColor: backgroundColor ?? Colors.white,
      enableDrag: enableDrag,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => Wrap(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                constraints:
                    constraints ?? BoxConstraints(minWidth: double.infinity),
                child: builder(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static showWithMargin(BuildContext context,
      {bool isScrollControlled = false,
      bool isDismissible = false,
      bool enableDrag = false,
      required Widget Function(BuildContext context) builder,
      BoxConstraints? constraints,
      bool closeBottonEnable = true,
      Color? backgroundColor,
      bool? safeAreaBottom = true,
      EdgeInsets? margin =
          const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 0)}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      backgroundColor: AppColor.transparent,
      enableDrag: enableDrag,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Wrap(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: margin,
                      constraints: constraints ??
                          const BoxConstraints(minWidth: double.infinity),
                      decoration: BoxDecoration(
                        color: backgroundColor ?? Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: SafeArea(
                          bottom: safeAreaBottom ?? true,
                          child: builder(context)),
                    ),
                    Visibility(
                      visible: closeBottonEnable,
                      child: Positioned(
                        right: 8,
                        child: InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.grey,
                                  blurRadius: 10,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.close_sharp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
