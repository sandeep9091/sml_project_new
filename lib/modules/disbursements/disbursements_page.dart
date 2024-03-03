import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';
import '../../di/login/login_modules.dart';
import 'disbursements_page_view.dart';
import 'disbursements_page_view_model.dart';


class DisbursementsPage extends BasePage<DisbursementsPageViewModel> {
  const DisbursementsPage({Key? key}) : super(key: key);


  @override
  DisbursementsPageState createState() => DisbursementsPageState();
}


class DisbursementsPageState
    extends BaseStatefulPage<DisbursementsPageViewModel, DisbursementsPage> {
  @override
  Widget buildMobileView(BuildContext context, DisbursementsPageViewModel model) {
    return DisbursementsPageView(provideBase());
  }


  @override
  ProviderBase provideBase() {
    return disbursementsViewModelProvider;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return const CommonAppBar(
      titleWidget: Text("Disbursements (Approved loans)"),
      enalbeTitle: true,
    );
  }

  @override
  void onPageInit(DisbursementsPageViewModel model) {
    model.getGeneratedLoans();
    super.onPageInit(model);
  }

}