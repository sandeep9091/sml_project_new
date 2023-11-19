import 'package:flutter/material.dart';

import '../../../base/base_widget.dart';
import '../../../di/app/app_modules.dart';
import '../../../utils/color_utils.dart';
import 'drawer_view_model.dart';

class HomeDrawer extends StatelessWidget {
  final Function onItemSelect;

  const HomeDrawer({Key? key, required this.onItemSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DrawerViewModel>(
      providerBase: drawerViewModelProvider,
      onModelReady: (model) {
        model.setContext(context);
      },
      builder: (BuildContext context, model, child) {
        return SizedBox(
          width: 300,
          child: Drawer(
              backgroundColor: AppColor.containerBGColor,
              child: SingleChildScrollView(
                child: Column(children: [
                  InkWell(
                    onTap: () {
                      onItemSelect.call();
                    },
                    child: DrawerHeader(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColor.containerBGColor,
                        ),
                      ),
                    ),
                  ),
                ]),
              )),
        );
      },
    );
  }
}
