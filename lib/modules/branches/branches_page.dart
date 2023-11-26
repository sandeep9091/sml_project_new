import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/modules/branches/branches_page_view.dart';
import 'package:spoorthymactcs/modules/branches/branches_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';


class BranchesPage extends BasePage<BranchesPageViewModel> {
  const BranchesPage({Key? key}) : super(key: key);


  @override
  BranchesPageState createState() => BranchesPageState();
}


class BranchesPageState
    extends BaseStatefulPage<BranchesPageViewModel, BranchesPage> {
  @override
  Widget buildMobileView(BuildContext context, BranchesPageViewModel model) {
    return BranchesPageView(provideBase());
  }


  @override
  ProviderBase provideBase() {
    return branchesViewModelProvider;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return const CommonAppBar(
      titleWidget: Text("Branches"),
      enalbeTitle: true,
    );
  }

  @override
  void onPageInit(BranchesPageViewModel model) {
    model.getBranchesList();
    super.onPageInit(model);
  }

}