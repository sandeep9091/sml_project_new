import 'dart:convert';

import 'package:domain/model/get_modules_response/get_modules_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/model/services/get_caders_response.dart';
import 'package:domain/model/services/get_gender_list_response.dart';
import 'package:domain/usecase/common_usecase/get_modules_usecase.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spoorthymactcs/di/notifier/get_caders_notifier.dart';
import 'package:spoorthymactcs/di/notifier/get_genders_notifier.dart';
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
  final GetGenderListUseCase _getGenderListUseCase;
  final GetCadersUseCase _getCadersUseCase;

  final PublishSubject<GetModulesUseCaseParams> _getModulesRequest = PublishSubject();
  final PublishSubject<GetGenderListUseCaseParams> _getGenderListRequest = PublishSubject();
  final PublishSubject<GetCadersUseCaseParams> _getCadersRequest = PublishSubject();

  /// Handle response and states for  content
  final BehaviorSubject<Resource<GetModulesResponse>> _getModulesResponse = BehaviorSubject();
  final BehaviorSubject<Resource<GetGenderListResponse>> _getGenderListResponse = BehaviorSubject();
  final BehaviorSubject<Resource<GetCadersResponse>> _getCadersResponse = BehaviorSubject();

  /// Stream for content
  Stream<Resource<GetModulesResponse>> get getModulesResponse => _getModulesResponse.stream;

  final ChangeNotifierProviderRef ref;

  DashboardPageViewModel(this._getModulesUseCase,this._getGenderListUseCase,this._getCadersUseCase, this.ref) {
    _getModulesRequest.listen((value) {
      RequestManager(value,
              createCall: () => _getModulesUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        if(event.status == Status.SUCCESS){
          if(event.data!.data.isNotEmpty){
            ref.read(getModulesNotifierProvider.notifier).setData(event.data!.data);
          }
        }
        _getModulesResponse.safeAdd(event);
      });
    });

    _getGenderListRequest.listen((value) {
      RequestManager(value,
              createCall: () => _getGenderListUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        if(event.status == Status.SUCCESS){
          if(event.data!.data.isNotEmpty){
            ref.read(getGenderListNotifierProvider.notifier).setData(event.data!.data);
          }
        }
        _getGenderListResponse.safeAdd(event);
      });
    });

    _getCadersRequest.listen((value) {
      RequestManager(value,
              createCall: () => _getCadersUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        if(event.status == Status.SUCCESS){
          if(event.data!.data.isNotEmpty){
            ref.read(getCadersNotifierProvider.notifier).setData(event.data!.data);
          }
        }
        _getCadersResponse.safeAdd(event);
      });
    });
  }

  getModulesData(BuildContext context) {
    List<LoginResponseData> loginResponseData = ref.read(loginNotifierProvider);
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

  getGenderData(){
  _getGenderListRequest.safeAdd(
      GetGenderListUseCaseParams(
        secure: jsonEncode({})));
  }

  getCadersData(BuildContext context){
    List<LoginResponseData> loginResponseData = ref.read(loginNotifierProvider);
    LoginResponseData? loginData;
    if(loginResponseData.isNotEmpty){
      loginData = loginResponseData[0];
    }
    if(loginData != null){
    _getCadersRequest.safeAdd(
      GetCadersUseCaseParams(
        secure: jsonEncode({
          'cader':loginData.userInfo?.userCader?.code
        })));
    }
  }

  renderModulePages(BuildContext context, MdChilds childData){
    String route = childData.routerLink;
    if(route.isNotEmpty){
      context.push(route);
    }else{
      const SizedBox.shrink();
    }
  }
}
