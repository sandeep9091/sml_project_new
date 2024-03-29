import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';

import '../../di/login/login_modules.dart';
import '../../di/notifier/login_notifier.dart';
import 'generate_loans_action_page.dart';
import 'generate_loans_page_view.dart';
import 'generate_loans_page_view_model.dart';


class GenerateLoansPage extends BasePage<GenerateLoansPageViewModel> {
  const GenerateLoansPage({Key? key}) : super(key: key);


  @override
  GenerateLoansPageState createState() => GenerateLoansPageState();
}


class GenerateLoansPageState
    extends BaseStatefulPage<GenerateLoansPageViewModel, GenerateLoansPage> {
  @override
  Widget buildMobileView(BuildContext context, GenerateLoansPageViewModel model) {
    return GenerateLoansPageView(provideBase());
  }


  @override
  ProviderBase provideBase() {
    return generateLoansViewModelProvider;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return CommonAppBar(
      titleWidget: const Text("Generated Loans"),
      enalbeTitle: true,
      enableActions: true,
      actionButtonOnTap: (){
        //ProviderScope.containerOf(context).read(generateLoansViewModelProvider).getsmtCode(context);
        Navigator.push(context,MaterialPageRoute(builder: (context) => const GenerateLoansActionPage(type: "ADD",)),
        ).then((value) => ProviderScope.containerOf(context).read(generateLoansViewModelProvider).disposeAllVariables());
      },
    );
  }

  @override
  void onPageInit(GenerateLoansPageViewModel model) async{
    model.userInfo= await ProviderScope.containerOf(context).read(loginUserInfoNotifierProvider);
    model.getBranchesList();
    model.getBorrowersList();
    model.getGeneratedLoans();
    super.onPageInit(model);
  }

  /* @override
  Widget buildBottomNavigationBar() {
    GenerateLoansPageViewModel model =
        ProviderScope.containerOf(context).read(GenerateLoansViewModelProvider);
    return ValueListenableBuilder(
      valueListenable: model.enableSave,
      builder: (context, isValid, child) {
        return Container(
          padding: const EdgeInsets.only(left: 15.0, right: 15,bottom: 7.0),
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
          ),
          child: AppButton(
              isEnable: isValid,
              height: 40,
              borderRadius: 25.0,
              padding: const EdgeInsets.symmetric(horizontal: 57, vertical: 7),
              title: "Save",
              onPressed: () {
                model.saveTeamData();
              }),
        );
      },
    );
  } */
}