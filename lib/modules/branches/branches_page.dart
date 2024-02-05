import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/modules/branches/branches_page_view.dart';
import 'package:spoorthymactcs/modules/branches/branches_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';

import 'branches_action_page.dart';


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
    return CommonAppBar(
      titleWidget: const Text("Branches"),
      enalbeTitle: true,
      enableActions: true,
      actionButtonOnTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => const BranchesActionPage(type: "ADD",)),
        );
      },
    );
  }

  @override
  void onPageInit(BranchesPageViewModel model) {
    model.getBranchesList();
    model.getCompaniesList();
    model.filterAddressMasterList(context);
    super.onPageInit(model);
  }

}