import 'package:domain/constants/error_types.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/model/base/error_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spoorthymactcs/main/navigation/app_router.dart';
import 'package:spoorthymactcs/ui/molecules/loader/common_loader.dart';
import 'package:spoorthymactcs/utils/extension/base_page_extensions.dart';
import 'package:spoorthymactcs/utils/status.dart';
import 'dart:async';
import '../ui/app_svg.dart';

import '../utils/asset_utils.dart';
import '../utils/color_utils.dart';
import 'base_page_view_model.dart';
import 'base_widget.dart';

/// Every Page/View should be inherited from this
abstract class BasePage<VM extends BasePageViewModel> extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<VM extends BasePageViewModel,
    T extends BasePage<VM>> extends State<T> {}

abstract class BaseStatefulPage<VM extends BasePageViewModel,
    B extends BasePage<VM>> extends BasePageState<VM, B> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  VM? _viewModel;

  bool get attached => _viewModel != null;
  StreamSubscription? errorSubscription;
  StreamSubscription? toastSubscription;
  StreamSubscription? statusSubscription;

  @override
  Widget build(BuildContext context) {
    return stateBuild(context);
  }

  Widget stateBuild(BuildContext context) {
    return _getLayout();
  }

  /// Returns viewModel of the screen
  VM getViewModel() {
    return attached
        ? _viewModel!
        : throw AppError(
            cause: Exception("View model is not attached"),
            error: ErrorInfo(message: "View Model is not attached"),
            type: ErrorType.UI,
          );
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;

  /// Actual Screen which load scaffold and load UI
  Widget _getLayout() {
    return BaseWidget<VM>(
        providerBase: provideBase(),
        onModelReady: _onBaseModelReady,
        onInit: onPageInit,
        builder: (BuildContext context, VM? model, Widget? child) {
          return WillPopScope(
            onWillPop: onBackPressed,
            child: ScaffoldMessenger(
              key: _scaffoldMessengerKey,
              child: Scaffold(
                key: _scaffoldKey,
                backgroundColor: scaffoldBackgroundColor(),
                appBar: buildAppbar(),
                floatingActionButton: buildFloatingActionButton(),
                extendBodyBehindAppBar: extendBodyBehindAppBar(),
                body: SafeArea(
                  child: _buildScaffoldBody(context, model!),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                drawer: buildDrawer(),
                drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(),
                bottomNavigationBar: buildBottomNavigationBar(),
                bottomSheet: buildBottomSheet(),
                resizeToAvoidBottomInset: true,
                extendBody: true,
              ),
            ),
          );
        });
  }

  /// Building a appbar of screen
  PreferredSizeWidget? buildAppbar() {
    // return AppBar(
    //   backgroundColor: AppColor.blue,
    //   centerTitle: false,
    // );
    return null;
  }

  /// bottom inset
  bool? resizeToAvoidBottomInset() {
    return false;
  }

  /// Building a appbar of screen
  Color? scaffoldBackgroundColor() {
    return null;
  }

  /// Building a drawer of screen
  Widget? buildDrawer() {
    return null;
  }

  /// Building a bottom-sheet
  Widget? buildBottomSheet() {
    return null;
  }

  Widget? buildFloatingActionButton() {
    return null;
  }

  /// Building a bottomNaviagtion Bar
  Widget? buildBottomNavigationBar() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  bool drawerEnableOpenDragGesture() {
    return false;
  }

  Widget _buildScaffoldBody(BuildContext context, VM model) {
    return ScreenTypeLayout(
        mobile: buildMobileView(context, model),
        tablet: buildTabletView(context, model),
        desktop: buildWebView(context, model));
  }

  @mustCallSuper
  Widget buildMobileView(BuildContext context, VM model);

  @mustCallSuper
  Widget? buildTabletView(BuildContext context, VM model) {
    return null;
  }

  @mustCallSuper
  Widget? buildWebView(BuildContext context, VM model) {
    return null;
  }

    @override
  void dispose() {
    errorSubscription?.cancel();
    toastSubscription?.cancel();
    statusSubscription?.cancel();
    super.dispose();
  }

  void _onBaseModelReady(VM model) {
    _viewModel = model;
    errorSubscription?.cancel();
    errorSubscription = model.error.listen((event) async {
      // String apiErrorStatus = event?.error.apiErrorStatus ?? "";
      // String apiErrorCode = event?.error.apiErrorCode ?? "";
      String errMessage = event.type == ErrorType.NET_NO_INTERNET_CONNECTION
          ? "Can't connect right now. Please check your internet connection"
          : event.error.description;
      var errCode = event.error.apiErrorStatus;
      if (errMessage.isEmpty) {
        errMessage = event.error.message;
      }
      if (errCode == '10002') {
        context.goNamed(AppRoute.login.name);
      } else if (errMessage.isNotEmpty) {
        showToast(errMessage);
      }
    });
    toastSubscription?.cancel();
    toastSubscription = model.toast.listen((message) {
      debugPrint("message: $message");
      showToast(message);
    });
    statusSubscription?.cancel();
    statusSubscription = model.status.listen((event) {
      if (!mounted) return;
      if (event == Status.LOADING) {
        CommonLoader(context);
      } else {
        if (mounted) if (context.canPop()) context.pop();
      }
    });

    model.setContext(context);
    onModelReady(model);
  }

  Future<bool> onBackPressed({dynamic param}) {
    return _onWillPop(param);
  }

  Future<bool> _onWillPop(dynamic param) {
    if (Navigator.canPop(context)) {
      if (param != null) {
        Navigator.pop(context, param);
        return Future.value(false);
      } else {
        Navigator.pop(
          context,
        );
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  /*Mandatory*/


  /// You can setup load something when model is ready, Ex: Load or fetch some data from remote layer
  void onModelReady(VM model) {}

  /// You can call this to initiate any model methods to run once on Init
  void onPageInit(VM model) {
    //
  }

  /// Declare and initialization of viewModel for the page
  ProviderBase provideBase();
}

abstract class BasePageViewWidget<T extends BasePageViewModel> extends Widget {
  final ProviderBase providerBase;

  const BasePageViewWidget(this.providerBase, {Key? key}) : super(key: key);

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() =>
      DataProviderElement<T>(this, providerBase);
}

class DataProviderElement<T extends BasePageViewModel>
    extends ComponentElement {
  final ProviderBase providerBase;

  DataProviderElement(BasePageViewWidget widget, this.providerBase)
      : super(widget);

  @override
  BasePageViewWidget get widget => super.widget as BasePageViewWidget;

  @override
  Widget build() {
    return BaseWidget<T>(
      providerBase: providerBase,
      builder: (context, model, child) {
        return widget.build(this, model!);
      },
    );
  }
}
