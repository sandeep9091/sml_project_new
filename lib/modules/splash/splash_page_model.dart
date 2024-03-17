// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:domain/model/login/login_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/subjects.dart';

import '../../base/base_page_view_model.dart';
import '../../di/notifier/login_notifier.dart';
import '../../main/navigation/app_router.dart';
import '../../utils/common_utils.dart';
import '../../utils/extension/stream_extention.dart';

class SplashViewModel extends BasePageViewModel {
  ValueNotifier<int> bottomIndex = ValueNotifier(0);

  ///linear progress bar progress holder subject
  final BehaviorSubject<double> _splashProgressSubject =
      BehaviorSubject.seeded(0.0);

  final String testVariable = "Test Variable from Splash";

  Stream<double> get splashProgressStream => _splashProgressSubject.stream;

  AnimationController? animationController;

  ///app version response
  final PublishSubject<String> _appVersionSubject = PublishSubject();

  Stream<String> get appVersionStream => _appVersionSubject.stream;

  SplashViewModel() {
    //getAppVersionAndCode();
    startTimer(const Duration(milliseconds: 500));
  }

  /// Timer logic to trigger after 1 sec
  startTimer(Duration duration) {
    Timer.periodic(duration, (timer) {
      if (timer.tick == 4) {
        _splashProgressSubject.safeAdd(1.0);
        timer.cancel();
      } else {
        _splashProgressSubject.safeAdd(_splashProgressSubject.value + 0.25);
      }
    });
  }

  // void getAppVersionAndCode() async {
  //   //PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   String version = packageInfo.version;
  //   String buildNumber = packageInfo.buildNumber;
  //   _appVersionSubject.safeAdd('Version: $version+$buildNumber');
  // }

  checkUser(BuildContext context) async{
    try{
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      AppCommonUtils().appVersion = packageInfo.version;
          String userData =  await AppCommonUtils().secureStorage().getValue(key: 'loginResponse') ?? "";
    if(userData.isNotEmpty){
      LoginResponse? loginResponse = LoginResponse.fromJson(jsonDecode(userData));
      if(loginResponse != null){
        if(loginResponse.data.isNotEmpty){
          await ProviderScope.containerOf(modelcontext!).
            read(loginUserInfoNotifierProvider.notifier).setData(loginResponse.data[0].userInfo);
            context.pushNamed(AppRoute.dashboard.name);
        }
      }else{
        context.pushNamed(AppRoute.login.name);
      }
    }else{
      context.pushNamed(AppRoute.login.name);
    }
    }catch(e){
      context.pushNamed(AppRoute.login.name);
    }
  }

  @override
  void dispose() {
    _splashProgressSubject.close();
    _appVersionSubject.close();
    super.dispose();
  }
}
