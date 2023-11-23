import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/main/app_viewmodel.dart';

import '../../utils/asset_utils.dart';
import '../../utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../base/base_page.dart';
import '../side_menu/side_menu.dart';
import 'dashboard_page_view.dart';
import 'dashboard_page_view_model.dart';

class DashboardPage extends BasePage<DashboardPageViewModel> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState
    extends BaseStatefulPage<DashboardPageViewModel, DashboardPage> {
  @override
  Widget buildMobileView(BuildContext context, DashboardPageViewModel model) {
    return DashboardPageView(provideBase());
  }

  @override
  Widget? buildWebView(BuildContext context, DashboardPageViewModel model) {
    super.buildWebView(context, model);
    return const Center(
      child: Text(
        "This is WEB",
        style: TextStyle(color: AppColor.black),
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

   @override
    Widget? buildDrawer() {
    return const SideMenu();
  }
  

  @override
  ProviderBase provideBase() {
    return dashboardViewModelProvider;
  }

  @override
  void onPageInit(DashboardPageViewModel model) {
    model.getModulesData(context);
    super.onPageInit(model);
  }
}
