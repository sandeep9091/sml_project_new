import 'dart:convert';

import 'package:domain/model/get_modules_response/get_modules_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/usecase/common_usecase/get_modules_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/di/notifier/get_modules_notifier.dart';
import 'package:spoorthymactcs/di/notifier/login_notifier.dart';
import 'package:spoorthymactcs/utils/status.dart';
import '../../utils/extension/stream_extention.dart';
import 'package:rxdart/rxdart.dart';

import '../../base/base_page_view_model.dart';
import '../../utils/request_manager.dart';
import '../../utils/resource.dart';

class DashboardPageViewModel extends BasePageViewModel {
  final GetModulesUseCase _getModulesUseCase;

  final PublishSubject<GetModulesUseCaseParams> _getModulesRequest = PublishSubject();

  /// Handle response and states for  content
  final BehaviorSubject<Resource<GetModulesResponse>> _getModulesResponse = BehaviorSubject();

  /// Stream for content
  Stream<Resource<GetModulesResponse>> get getModulesResponse => _getModulesResponse.stream;

  DashboardPageViewModel(this._getModulesUseCase) {
    _getModulesRequest.listen((value) {
      RequestManager(value,
              createCall: () => _getModulesUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        if(event.status == Status.SUCCESS){
          if(event.data!.data.isNotEmpty){
            ProviderScope.containerOf(modelcontext!).
            read(getModulesNotifierProvider.notifier).setData(event.data!.data);
          }
        }
        _getModulesResponse.safeAdd(event);
      });
    });
  }

  getModulesData(BuildContext context) {
    List<LoginResponseData> loginResponseData = ProviderScope.containerOf(context).read(loginNotifierProvider);
    LoginResponseData? loginData;
    if(loginResponseData.isNotEmpty){
      loginData = loginResponseData[0];
    }
    if(loginData != null){
    _getModulesRequest.safeAdd(
      GetModulesUseCaseParams(
        secure: jsonEncode({
          'cader':loginData.userInfo?.userCader?.code
          })));
    }
  }
}
