import 'package:go_router/go_router.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:flutter/material.dart';

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight, this.actions,
      this.leading, this.enalbeTitle, this.titleWidget, this.enableLeading,this.enableActions,this.actionButtonOnTap)
      : super.fromHeight(
          (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0),
        );

  final double? toolbarHeight;
  final double? bottomHeight;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? enalbeTitle;
  final Widget? titleWidget;
  final bool? enableLeading;
  final bool? enableActions;
  final Function()? actionButtonOnTap;
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar(
      {super.key,
      this.bottom,
      this.toolbarHeight = 60.0,
      this.actions,
      this.leading,
      this.enalbeTitle = false,
      this.titleWidget,
      this.enableLeading = true,
      this.enableActions = false,
      this.actionButtonOnTap,
      this.child});

  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final List<Widget>? actions;
  final Widget? leading;
  final bool enalbeTitle;
  final Widget? titleWidget;
  final bool enableLeading;
  final bool enableActions;
  final Function()? actionButtonOnTap;
  final Widget? child;
  @override
  Size get preferredSize {
    return _PreferredAppBarSize(
        enableLeading == true ? toolbarHeight : 50,
        bottom?.preferredSize.height,
        actions,
        leading,
        enalbeTitle,
        titleWidget,
        enableLeading,
        enableActions,
        actionButtonOnTap);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child ?? const SizedBox.shrink(),
        AppBar(
          elevation: 0,
          actions: enableActions ? (actions ?? [IconButton(onPressed: actionButtonOnTap, icon: const Icon(Icons.add_circle_outline_rounded,color: AppColor.white,))]): [Container()],
          backgroundColor: AppColor.primary,
          leading: enableLeading ? leading ?? IconButton(onPressed: (){ context.pop();}, icon: const Icon(Icons.arrow_back))  : Container(),
          leadingWidth: 50,
          toolbarHeight: 50,
          title: enalbeTitle ? titleWidget : Container(),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ],
    );
  }
}
