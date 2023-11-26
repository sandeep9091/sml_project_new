import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../base/base_widget.dart';
import '../di/app/app_modules.dart';
import 'app_viewmodel.dart';
import 'navigation/app_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final goRouter = ref.watch(goRouterProvider);

    return BaseWidget<AppViewModel>(
      providerBase: appViewModel,
      builder: (context, appModel, child) {
        return MaterialApp.router(
          key: appLevelKey,
          routerConfig: goRouter,
          builder: (context, widget) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget!),
              maxWidth: 1400,
              minWidth: 360,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(640, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(1100, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1400, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              background: Container(
                color: const Color(0xFFE5E5E5),
              )),
          //supportedLocales: S.delegate.supportedLocales,
          //onGenerateTitle: (context) => S.of(context).appTitle,
          debugShowCheckedModeBanner: false,
          theme: appModel!.themeData,
          scrollBehavior:
              ScrollConfiguration.of(context).copyWith(scrollbars: false),
        );
      },
    );
  }
}
