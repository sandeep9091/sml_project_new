import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';

import '../../di/login/login_modules.dart';
import 'login_page_view.dart';
import 'login_page_view_model.dart';


class LoginPage extends BasePage<LoginPageViewModel> {
  const LoginPage({Key? key}) : super(key: key);


  @override
  LoginPageState createState() => LoginPageState();
}


class LoginPageState
    extends BaseStatefulPage<LoginPageViewModel, LoginPage> {
  @override
  Widget buildMobileView(BuildContext context, LoginPageViewModel model) {
    return LoginPageView(provideBase());
  }


  @override
  ProviderBase provideBase() {
    return loginViewModelProvider;
  }

  

  @override
  void onPageInit(LoginPageViewModel model) async{
    //model.login();
  }
}