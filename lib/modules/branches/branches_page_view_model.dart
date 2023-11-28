

import 'dart:convert';

import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

import '../../main/navigation/route_paths.dart';

class BranchesPageViewModel extends BasePageViewModel {
  TextEditingController controllerBranchName = TextEditingController();
  TextEditingController controllerBranchCode = TextEditingController();
  TextEditingController controllerContactNumber = TextEditingController();
  TextEditingController controllerState = TextEditingController();
  TextEditingController controllerDistrict = TextEditingController();
  TextEditingController controllerPincode = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  //ValueNotifier<String> selectedCadre = ValueNotifier("");
  ValueNotifier<String> selectedCompany = ValueNotifier("");
  ValueNotifier<bool> isActive = ValueNotifier(false);
  List<dynamic> companiesList = [];

  final BranchesUseCase _branchesUseCase;
  final CompaniesUseCase _companiesUseCase;
  final CommonUseCase _commonUseCase;

  final PublishSubject<BranchesUseCaseParams> _branchesRequest = PublishSubject();
  final PublishSubject<CompaniesUseCaseParams> _companiesRequest = PublishSubject();
  final PublishSubject<CommonUseCaseParams> _commonRequest = PublishSubject();

  /// Handle response and states for  content
  final BehaviorSubject<Resource<BranchesResponse>> _branchesResponse = BehaviorSubject();
  final BehaviorSubject<Resource<CompaniesListResponse>> _companiesResponse = BehaviorSubject();
  final BehaviorSubject<Resource<CommonResponse>> _commonResponse = BehaviorSubject();

  /// Stream for content
  Stream<Resource<BranchesResponse>> get branchesStream => _branchesResponse.stream;
  Stream<Resource<CommonResponse>> get commonSaveStream => _commonResponse.stream;



  BranchesPageViewModel(this._branchesUseCase,this._companiesUseCase,this._commonUseCase) {
    _branchesRequest.listen((value) {
      RequestManager(value,
              createCall: () => _branchesUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        if(event.status == Status.SUCCESS){
          if(event.data!.data.isNotEmpty){
            //ProviderScope.containerOf(modelcontext!).read(getModulesNotifierProvider.notifier).setData(event.data!.data);
          }
        }
        _branchesResponse.safeAdd(event);
      });
    });

    _companiesRequest.listen((value) {
      RequestManager(value,
              createCall: () => _companiesUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        if(event.status == Status.SUCCESS){
          if(event.data!.data.isNotEmpty){
            updateCompaniesList(event.data!.data);
          }
        }
        _companiesResponse.safeAdd(event);
      });
    });

    _commonRequest.listen((value) {
      RequestManager(value,
              createCall: () => _commonUseCase.execute(params: value))
          .asFlow()
          .listen((event) async{
          if(event.status == Status.SUCCESS){
            await getBranchesList();
            modelcontext?.pop();
          }
        _commonResponse.safeAdd(event);
      });
    });
    }




  getBranchesList(){
  _branchesRequest.safeAdd(
      BranchesUseCaseParams(
        secure: jsonEncode({})));
  }

  getCompaniesList(){
  _companiesRequest.safeAdd(
      CompaniesUseCaseParams(
        secure: jsonEncode({})));
  }

  saveBranchesData({required String flag, BranchesResponseData? singleBranch}){
    _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.branchSave,
        secure: jsonEncode(
          {
            "id": (flag == "EDIT") ? singleBranch?.id : null,
            "active": (flag == "EDIT") ? isActive.value : true,
            "flag": (flag == "EDIT") ? "E" : "S",
            "bname": controllerBranchName.text.trim(),
            "bcode": controllerBranchCode.text.trim(),
            "b_opn_dt": "27/11/2023",
            "desc": controllerDescription.text.trim(),
            "cId": selectedCompany.value,
            "state": controllerState.text.trim(),
            "district": controllerDistrict.text.trim(),
            "pincode": controllerPincode.text.trim(),
            "contact_no": controllerContactNumber.text.trim(),
          }
        )));
  }

  updateCompaniesList(List<CompaniesListResponseData> data) {
    if(data.isNotEmpty){
      for (var each in data) { 
        companiesList.add({
        "name": each.cname,
        "id": each.id
      });
      }}
  }
}