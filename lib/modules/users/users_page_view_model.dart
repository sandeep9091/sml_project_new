

import 'dart:convert';

import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/users_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/model/services/get_caders_response.dart';
import 'package:domain/model/services/get_gender_list_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/services/users_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/di/notifier/get_caders_notifier.dart';
import 'package:spoorthymactcs/di/notifier/get_genders_notifier.dart';
import 'package:spoorthymactcs/di/notifier/login_notifier.dart';
import 'package:spoorthymactcs/main/navigation/route_paths.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

class UsersPageViewModel extends BasePageViewModel {
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  ValueNotifier<String> selectedCadre = ValueNotifier("");
  ValueNotifier<String> selectedGender = ValueNotifier("");
  ValueNotifier<bool> isActive = ValueNotifier(false);
  List<dynamic> genderList = [];
  List<dynamic> cadreList = [];

   final UsersUseCase _usersUseCase;
   final CommonUseCase _commonUseCase;

  final PublishSubject<UsersUseCaseParams> _usersListRequest = PublishSubject();
  final PublishSubject<CommonUseCaseParams> _commonRequest = PublishSubject();

  /// Handle response and states for  content
  final BehaviorSubject<Resource<UsersListResponse>> _usersListResponse = BehaviorSubject();
  final BehaviorSubject<Resource<CommonResponse>> _commonResponse = BehaviorSubject();

  /// Stream for content
  Stream<Resource<UsersListResponse>> get usersListStream => _usersListResponse.stream;
  Stream<Resource<CommonResponse>> get commonSaveStream => _commonResponse.stream;


  UsersPageViewModel(this._usersUseCase,this._commonUseCase) {
    _usersListRequest.listen((value) {
      RequestManager(value,
              createCall: () => _usersUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        _usersListResponse.safeAdd(event);
      });
    });

    _commonRequest.listen((value) {
      RequestManager(value,
              createCall: () => _commonUseCase.execute(params: value))
          .asFlow()
          .listen((event) async{
          if(event.status == Status.SUCCESS){
            await getUsersList(modelcontext!);
            modelcontext?.pop();
          }
        _commonResponse.safeAdd(event);
      });
    });
  }


  getUsersList(BuildContext context){
    List<LoginResponseData> loginResponseData = ProviderScope.containerOf(context).read(loginNotifierProvider);
    LoginResponseData? loginData;
    if(loginResponseData.isNotEmpty){
      loginData = loginResponseData[0];
    }
    if(loginData != null){
    _usersListRequest.safeAdd(
      UsersUseCaseParams(
        secure: jsonEncode(loginData.userInfo?.userCader?.code??"")));
    }
  }

  saveUserData({required String flag, UsersListResponseData? singleUser}){
    _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.usersSave,
        secure: jsonEncode(
          {
            "id": (flag == "EDIT") ? singleUser?.id : null,
            "password": controllerPassword.text.trim(),
            "description": controllerDescription.text.trim(),
            "gender": selectedGender.value,
            "dep_id": null,
            "active": (flag == "EDIT") ? isActive.value : true,
            "flag": (flag == "EDIT") ? "E" : "S",
            "uname": controllerUserName.text.trim(),
            "cader": selectedCadre.value,
            "department": null
          }
        )));
  }

  updateGenderList(BuildContext context) {
    List<GetGenderListResponseData> data = ProviderScope.containerOf(context).read(getGenderListNotifierProvider);
    if(data.isNotEmpty){
      for (var each in data) { 
        genderList.add({
        "name": each.gname,
        "id": each.id
      });
      }}
  }

  updateCadreList(BuildContext context) {
    List<GetCadersResponseData> data = ProviderScope.containerOf(context).read(getCadersNotifierProvider);
    if(data.isNotEmpty){
      for (var each in data) { 
        cadreList.add({
        "name": each.cdname,
        "id": each.id
      });
      }}
  }
}