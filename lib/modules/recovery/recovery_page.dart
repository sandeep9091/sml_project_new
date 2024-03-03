import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';
import '../../di/login/login_modules.dart';
import 'recovery_page_view.dart';
import 'recovery_page_view_model.dart';


class RecoveryPage extends BasePage<RecoveryPageViewModel> {
  const RecoveryPage({Key? key}) : super(key: key);


  @override
  RecoveryPageState createState() => RecoveryPageState();
}


class RecoveryPageState
    extends BaseStatefulPage<RecoveryPageViewModel, RecoveryPage> {
  @override
  Widget buildMobileView(BuildContext context, RecoveryPageViewModel model) {
    return RecoveryPageView(provideBase());
  }


  @override
  ProviderBase provideBase() {
    return recoveryViewModelProvider;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return const CommonAppBar(
      titleWidget: Text("Recovery"),
      enalbeTitle: true,
    );
  }

  @override
  void onPageInit(RecoveryPageViewModel model) {
    model.getGeneratedLoans(context);
    super.onPageInit(model);
  }

  /* @override
  Widget buildBottomNavigationBar() {
    RecoveryPageViewModel model =
        ProviderScope.containerOf(context).read(RecoveryPageViewModelProvider);
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