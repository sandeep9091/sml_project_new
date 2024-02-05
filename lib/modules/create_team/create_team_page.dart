import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/common_utils/appButton.dart';
import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/modules/create_team/create_team_page_view.dart';
import 'package:spoorthymactcs/modules/create_team/create_team_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';


class CreateTeamPage extends BasePage<CreateTeamPageViewModel> {
  const CreateTeamPage({Key? key}) : super(key: key);


  @override
  CreateTeamPageState createState() => CreateTeamPageState();
}


class CreateTeamPageState
    extends BaseStatefulPage<CreateTeamPageViewModel, CreateTeamPage> {
  @override
  Widget buildMobileView(BuildContext context, CreateTeamPageViewModel model) {
    return CreateTeamPageView(provideBase());
  }


  @override
  ProviderBase provideBase() {
    return createTeamViewModelProvider;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return const CommonAppBar(
      titleWidget: Text("Create Team"),
      enalbeTitle: true,
    );
  }

  @override
  void onPageInit(CreateTeamPageViewModel model) {
    model.getBranchesList();
    model.getTeamMapper();
    super.onPageInit(model);
  }

  @override
  Widget buildBottomNavigationBar() {
    CreateTeamPageViewModel model =
        ProviderScope.containerOf(context).read(createTeamViewModelProvider);
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
  }
}