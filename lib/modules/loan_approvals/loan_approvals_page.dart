import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';
import '../../di/login/login_modules.dart';
import 'loan_approvals_page_view.dart';
import 'loan_approvals_page_view_model.dart';


class LoanApprovalsPage extends BasePage<LoanApprovalsPageViewModel> {
  const LoanApprovalsPage({Key? key}) : super(key: key);


  @override
  LoanApprovalsPageState createState() => LoanApprovalsPageState();
}


class LoanApprovalsPageState
    extends BaseStatefulPage<LoanApprovalsPageViewModel, LoanApprovalsPage> {
  @override
  Widget buildMobileView(BuildContext context, LoanApprovalsPageViewModel model) {
    return LoanApprovalsPageView(provideBase());
  }


  @override
  ProviderBase provideBase() {
    return loanApprovalsViewModelProvider;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return const CommonAppBar(
      titleWidget: Text("Loan Approvals"),
      enalbeTitle: true,
    );
  }

  @override
  void onPageInit(LoanApprovalsPageViewModel model) {
    model.getGeneratedLoans();
    super.onPageInit(model);
  }

}