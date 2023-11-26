import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/modules/companies/companies_page_view.dart';
import 'package:spoorthymactcs/modules/companies/companies_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';


class CompaniesPage extends BasePage<CompaniesPageViewModel> {
  const CompaniesPage({Key? key}) : super(key: key);


  @override
  CompaniesPageState createState() => CompaniesPageState();
}


class CompaniesPageState
    extends BaseStatefulPage<CompaniesPageViewModel, CompaniesPage> {
  @override
  Widget buildMobileView(BuildContext context, CompaniesPageViewModel model) {
    return CompaniesPageView(provideBase());
  }


  @override
  ProviderBase provideBase() {
    return companiesViewModelProvider;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return const CommonAppBar(
      titleWidget: Text("Companies"),
      enalbeTitle: true,
    );
  }

  @override
  void onPageInit(CompaniesPageViewModel model) {
    model.getCompaniesList();
    super.onPageInit(model);
  }

}