import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../base/base_page.dart';
import '../../di/providers/splash/splash_modules.dart';
import '../../utils/color_utils.dart';
import 'splash_page_model.dart';
import 'splash_page_view.dart';

class SplashPage extends BasePage<SplashViewModel> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends BaseStatefulPage<SplashViewModel, SplashPage> {
  @override
  ProviderBase provideBase() {
    return splashViewModelProvider;
  }

  @override
  Widget buildMobileView(BuildContext context, SplashViewModel model) {
    return SplashPageView(provideBase());
  }

  @override
  void onPageInit(SplashViewModel model) {
    // TODO: implement onPageInit
    super.onPageInit(model);
    model.checkUser(context);
  }
}
