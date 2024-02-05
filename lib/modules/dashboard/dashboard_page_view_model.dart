import 'dart:convert';

import 'package:domain/model/get_modules_response/dashboard_response.dart';
import 'package:domain/model/get_modules_response/get_modules_new_response.dart';
import 'package:domain/model/get_modules_response/get_modules_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/model/services/address_master_response.dart';
import 'package:domain/model/services/get_caders_response.dart';
import 'package:domain/model/services/get_gender_list_response.dart';
import 'package:domain/usecase/common_usecase/get_dashboard_usecase.dart';
import 'package:domain/usecase/common_usecase/get_modules_new_usecase.dart';
import 'package:domain/usecase/common_usecase/get_modules_usecase.dart';
import 'package:domain/usecase/services/address_master_usecase.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spoorthymactcs/di/notifier/address_master_notifier.dart';
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
  final GetDashboardUseCase _getDashboardUseCase;
  final GetModulesUseCase _getModulesUseCase;
  final GetModulesNewUseCase _getModulesnewUseCase;
  final GetGenderListUseCase _getGenderListUseCase;
  final GetCadersUseCase _getCadersUseCase;
  final AddressMasterUseCase _addressMasterUseCase;

  final PublishSubject<GetDashboardUseCaseParams> _getDashboardRequest = PublishSubject();
  final PublishSubject<GetModulesUseCaseParams> _getModulesRequest = PublishSubject();
  final PublishSubject<GetModulesNewUseCaseParams> _getModulesNewRequest = PublishSubject();
  final PublishSubject<GetGenderListUseCaseParams> _getGenderListRequest = PublishSubject();
  final PublishSubject<GetCadersUseCaseParams> _getCadersRequest = PublishSubject();
  final PublishSubject<AddressMasterUseCaseParams> _getAddressMasterRequest = PublishSubject();

  /// Handle response and states for  content
  final BehaviorSubject<Resource<GetDashboardResponse>> _getDashboardResponse = BehaviorSubject();
  final BehaviorSubject<Resource<GetModulesResponse>> _getModulesResponse = BehaviorSubject();
  final BehaviorSubject<Resource<GetModulesNewResponse>> _getModulesNewResponse = BehaviorSubject();
  final BehaviorSubject<Resource<GetGenderListResponse>> _getGenderListResponse = BehaviorSubject();
  final BehaviorSubject<Resource<GetCadersResponse>> _getCadersResponse = BehaviorSubject();
  final BehaviorSubject<Resource<AddressMasterResponse>> _getAddressMasterResponse = BehaviorSubject();

  /// Stream for content
  Stream<Resource<GetDashboardResponse>> get getDashboardResponse => _getDashboardResponse.stream;
  Stream<Resource<GetModulesResponse>> get getModulesResponse => _getModulesResponse.stream;
  Stream<Resource<GetModulesNewResponse>> get getModulesNewResponse => _getModulesNewResponse.stream;
  Stream<Resource<AddressMasterResponse>> get addressMasterStream => _getAddressMasterResponse.stream;

  final ChangeNotifierProviderRef ref;

  DashboardPageViewModel(this._getDashboardUseCase,this._getModulesUseCase,this._getModulesnewUseCase,this._getGenderListUseCase,this._getCadersUseCase, 
  this._addressMasterUseCase,this.ref) {
    _getDashboardRequest.listen((value) {
      RequestManager(value,
              createCall: () => _getDashboardUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        if(event.status == Status.SUCCESS){
          if(event.data!.data.isNotEmpty){
            ref.read(getDashboardNotifierProvider.notifier).setData(event.data!.data);
          }
        }
        _getDashboardResponse.safeAdd(event);
      });
    });

    _getModulesNewRequest.listen((value) {
      RequestManager(value,
              createCall: () => _getModulesnewUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        if(event.status == Status.SUCCESS){
          if(event.data!.data.isNotEmpty){
            ref.read(getModulesNewNotifierProvider.notifier).setData(event.data!.data);
          }
        }
        _getModulesNewResponse.safeAdd(event);
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

    _getAddressMasterRequest.listen((value) {
      RequestManager(value,
              createCall: () => _addressMasterUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        if(event.status == Status.SUCCESS){
          if(event.data!.data.isNotEmpty){
            if(event.data!.data[0].addressData.isNotEmpty){
              ref.read(addressMasterNotifierProvider.notifier).setData(event.data!.data[0].addressData);
            }
          }
        }
        _getAddressMasterResponse.safeAdd(event);
      });
    });
  }

  getModulesData(BuildContext context) {
    UserInfo? userInfo = ProviderScope.containerOf(context).read(loginUserInfoNotifierProvider);
    if(userInfo != null){
    _getModulesNewRequest.safeAdd(
      GetModulesNewUseCaseParams(
        secure: {
          'code':userInfo.userCader?.code
          }));
    }
  }

    getDashboardData(BuildContext context) {
    UserInfo? userInfo = ProviderScope.containerOf(context).read(loginUserInfoNotifierProvider);
    if(userInfo != null){
    _getDashboardRequest.safeAdd(
      GetDashboardUseCaseParams(
        secure: {
          'cader':userInfo?.userCader?.code ?? "",
          'create_by':userInfo?.id ??""
          }));
    }
  }

  getGenderData(){
  _getGenderListRequest.safeAdd(
      GetGenderListUseCaseParams(
        secure: {}));
  }

  getCadersData(BuildContext context){
    UserInfo? userInfo = ProviderScope.containerOf(context).read(loginUserInfoNotifierProvider);
    if(userInfo != null){
    _getCadersRequest.safeAdd(
      GetCadersUseCaseParams(
        secure: {
          'cader':userInfo?.userCader?.code
        }));
    }
  }

  getAddressMaster(){
    _getAddressMasterRequest.safeAdd(
      AddressMasterUseCaseParams(
        secure: {}));
  }

  renderModulePages(BuildContext context, Modules childData){
    String route = childData.path;
    if(route.isNotEmpty){
      context.push(route);
    }else{
      const SizedBox.shrink();
    }
  }

  callAllData(BuildContext context){
    getDashboardData(context);
    getModulesData(context);
    getGenderData();
    getCadersData(context);
    getAddressMaster();
  }
}
