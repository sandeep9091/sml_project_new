import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/modules/users/cascade_page.dart';
import 'package:spoorthymactcs/modules/users/users_action_page.dart';
import 'package:spoorthymactcs/modules/users/users_page_view.dart';
import 'package:spoorthymactcs/modules/users/users_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';


class UsersPage extends BasePage<UsersPageViewModel> {
  const UsersPage({Key? key}) : super(key: key);


  @override
  UsersPageState createState() => UsersPageState();
}


class UsersPageState
    extends BaseStatefulPage<UsersPageViewModel, UsersPage> {
  @override
  Widget buildMobileView(BuildContext context, UsersPageViewModel model) {
    return UsersPageView(provideBase());
  }


  @override
  ProviderBase provideBase() {
    return usersViewModelProvider;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return CommonAppBar(
      titleWidget: const Text("Users"),
      enalbeTitle: true,
      enableActions: true,
      actionButtonOnTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context) => const UsersActionPage(type: "ADD",)),
        // );
        Navigator.push(context,MaterialPageRoute(builder: (context) => CascadingDropdownExample()));
      },
    );
  }

  @override
  void onPageInit(UsersPageViewModel model) {
    model.getUsersList(context);
    model.updateGenderList(context);
    model.updateCadreList(context);
    super.onPageInit(model);
  }

}