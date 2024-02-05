import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/modules/borrowers/borrowers_action_page.dart';
import 'package:spoorthymactcs/modules/borrowers/borrowers_page_view.dart';
import 'package:spoorthymactcs/modules/borrowers/borrowers_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';


class BorrowersPage extends BasePage<BorrowersPageViewModel> {
  const BorrowersPage({Key? key}) : super(key: key);


  @override
  BorrowersPageState createState() => BorrowersPageState();
}


class BorrowersPageState
    extends BaseStatefulPage<BorrowersPageViewModel, BorrowersPage> {
  @override
  Widget buildMobileView(BuildContext context, BorrowersPageViewModel model) {
    return BorrowersPageView(provideBase());
  }


  @override
  ProviderBase provideBase() {
    return borrowersViewModelProvider;
  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return CommonAppBar(
      titleWidget: const Text("Borrowers"),
      enalbeTitle: true,
      enableActions: true,
      actionButtonOnTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => const BorrowersActionPage(type: "ADD",)),
        ).then((value) => ProviderScope.containerOf(context).read(borrowersViewModelProvider).disposeAllVariables());
      },
    );
  }

  @override
  void onPageInit(BorrowersPageViewModel model) {
    model.getBorrowersList(context);
    model.getBranchesList();
    model.filterAddressMasterList(context);
    super.onPageInit(model);
  }
}