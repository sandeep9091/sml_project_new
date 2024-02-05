

import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/model/get_modules_response/get_teams_response.dart';
import 'package:domain/model/services/get_team_mapper_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/get_teams_mapper_usecase.dart';
import 'package:domain/usecase/services/get_teams_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/di/notifier/team_mapping_notifier.dart';
import 'package:spoorthymactcs/main/navigation/route_paths.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

class CreateTeamPageViewModel extends BasePageViewModel {
  List<dynamic> branchesList = [];
  ValueNotifier<String> selectedBranch = ValueNotifier("");
  ValueNotifier<bool> isResettedForSingleSelection = ValueNotifier(false);
  ValueNotifier<bool> enableSave = ValueNotifier(false);
  final BranchesUseCase _branchesUseCase;
  final GetTeamMapperUseCase _getTeamMapperUseCase;
  final GetTeamsUseCase _getTeamsUseCase;
  final CommonUseCase _commonUseCase;

  final PublishSubject<BranchesUseCaseParams> _branchesRequest = PublishSubject();
  final PublishSubject<GetTeamMapperUseCaseParams> _getTeamMapperRequest = PublishSubject();
  final PublishSubject<GetTeamsUseCaseParams> _getTeamsRequest = PublishSubject();
  final PublishSubject<CommonUseCaseParams> _commonRequest = PublishSubject();

  final BehaviorSubject<Resource<BranchesResponse>> _branchesResponse = BehaviorSubject();
  final BehaviorSubject<Resource<GetTeamMapperResponse>> _getTeamMapperResponse = BehaviorSubject();
  final BehaviorSubject<Resource<GetTeamsResponse>> _getTeamsResponse = BehaviorSubject();
  final BehaviorSubject<Resource<CommonResponse>> _commonResponse = BehaviorSubject();

  Stream<Resource<BranchesResponse>> get branchesStream => _branchesResponse.stream;
  Stream<Resource<GetTeamMapperResponse>> get getTeamMapperStream => _getTeamMapperResponse.stream;
  Stream<Resource<GetTeamsResponse>> get getTeamsStream => _getTeamsResponse.stream;
    Stream<Resource<CommonResponse>> get commonSaveStream => _commonResponse.stream;

  CreateTeamPageViewModel(this._branchesUseCase,this._getTeamMapperUseCase,this._getTeamsUseCase,this._commonUseCase) {
    _branchesRequest.listen((value) {
      RequestManager(value,
              createCall: () => _branchesUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        if(event.status == Status.SUCCESS){
          if(event.data!.data.isNotEmpty){
            updateBranchesList(event.data!.data);
          }
        }
        _branchesResponse.safeAdd(event);
      });
    });

    _getTeamMapperRequest.listen((value) {
      RequestManager(value,
              createCall: () => _getTeamMapperUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
            showLoader(event.status);
          if(event.status == Status.SUCCESS){
            if(event.data?.data != null){
              GetTeamMapperResponseData? data1 = event.data?.data;
              if(data1!.caderData.isNotEmpty){
                ProviderScope.containerOf(modelcontext!).read(teamMappingNotifierProvider.notifier).setData(data1.caderData);
              }
            }
          }
        _getTeamMapperResponse.safeAdd(event);
      });
    });

    _getTeamsRequest.listen((value) {
      RequestManager(value,
              createCall: () => _getTeamsUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
            showLoader(event.status);
        _getTeamsResponse.safeAdd(event);
      });
    });

    _commonRequest.listen((value) {
      RequestManager(value,
              createCall: () => _commonUseCase.execute(params: value))
          .asFlow()
          .listen((event) async{
          if(event.status == Status.SUCCESS){
            showToastWithString(event.data!.sMessage ?? "");
            getTeams(selectedBranch.value);
          }
        _commonResponse.safeAdd(event);
      });
    });
  }

  getBranchesList(){
  _branchesRequest.safeAdd(
      BranchesUseCaseParams(
        secure: {}
        ));
  }

  getTeamMapper(){
  _getTeamMapperRequest.safeAdd(
      GetTeamMapperUseCaseParams(
        secure: {}
        ));
  }

  getTeams(String branchId){
  _getTeamsRequest.safeAdd(
      GetTeamsUseCaseParams(
        secure: {
          "branch": branchId
        }
        ));
  }

  saveTeamData(){
    List<CaderData> caderData = ProviderScope.containerOf(modelcontext!).read(teamMappingNotifierProvider);
    debugPrint(caderData.toString());

    List dummyCaderList = [];
    List userList = [];
    for(var eachCader in caderData){
      userList = [];
      for(var eachUser in eachCader.usersData){
        if(eachUser.isCheckBoxActive){
          userList.add({
          "uname": eachUser.uname,
          "id": eachUser.id,
          "isChecked": eachUser.isCheckBoxActive
        });
        }
      }

      dummyCaderList.add({
        "cader": eachCader.id,
        "users": userList
      });
    }

    _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.createTeamSave,
        secure: 
          {
            "branch": selectedBranch.value,
            "cader": dummyCaderList
          }
        ));
  }

  updateBranchesList(List<BranchesResponseData> data) {
    if(data.isNotEmpty){
      for (var each in data) { 
        branchesList.add({
        "name": each.bname,
        "id": each.id
      });
      }}
  }

  resetCheckBoxValue(){
    List<CaderData> caderData = ProviderScope.containerOf(modelcontext!).read(teamMappingNotifierProvider);
    if(caderData.isNotEmpty){
      for(var eachCader in caderData){
        for(var eachUser in eachCader.usersData){
          eachUser.isCheckBoxActive = false;
        }
      }
    }
  }

  resetForSingleSelection(String id,bool value){
    List<CaderData> caderData = ProviderScope.containerOf(modelcontext!).read(teamMappingNotifierProvider);
    if(caderData.isNotEmpty){
      for(var eachCader in caderData){
        if(eachCader.code == "BM"){
          for(var eachUser in eachCader.usersData){
            eachUser.isCheckBoxActive = (eachUser.id == id)?value:false;
          }
        }
      }
    }
  }
}