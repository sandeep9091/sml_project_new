

import 'dart:convert';

import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/main/navigation/route_paths.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

class CompaniesPageViewModel extends BasePageViewModel {
  TextEditingController controllerCompanyName = TextEditingController();
  TextEditingController controllerCompanyCode = TextEditingController();
  TextEditingController controllerCompanyAddress = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  ValueNotifier<bool> isActive = ValueNotifier(false);

  final CompaniesUseCase _companiesUseCase;
  final CommonUseCase _commonUseCase;

  final PublishSubject<CompaniesUseCaseParams> _companiesRequest = PublishSubject();
  final PublishSubject<CommonUseCaseParams> _commonRequest = PublishSubject();


  /// Handle response and states for  content
  final BehaviorSubject<Resource<CompaniesListResponse>> _companiesResponse = BehaviorSubject();
  final BehaviorSubject<Resource<CommonResponse>> _commonResponse = BehaviorSubject();

  /// Stream for content
  Stream<Resource<CompaniesListResponse>> get companiesStream => _companiesResponse.stream;
  Stream<Resource<CommonResponse>> get commonSaveStream => _commonResponse.stream;



  CompaniesPageViewModel(this._companiesUseCase,this._commonUseCase) {
    _companiesRequest.listen((value) {
      RequestManager(value,
              createCall: () => _companiesUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        _companiesResponse.safeAdd(event);
      });
    });

    _commonRequest.listen((value) {
      RequestManager(value,
              createCall: () => _commonUseCase.execute(params: value))
          .asFlow()
          .listen((event) async{
          if(event.status == Status.SUCCESS){
            await getCompaniesList();
            modelcontext?.pop();
          }
        _commonResponse.safeAdd(event);
      });
    });
    }




  getCompaniesList(){
  _companiesRequest.safeAdd(
      CompaniesUseCaseParams(
        secure: jsonEncode({})));
  }

  saveCompanyData({required String flag, CompaniesListResponseData? eachCompany}){
    _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.companiesSave,
        secure: jsonEncode(
          {
            "id": (flag == "EDIT") ? eachCompany?.id : null,
            "cname": controllerCompanyName.text.trim(),
            "ccode": controllerCompanyCode.text.trim(),
            "cadress": controllerCompanyAddress.text.trim(),
            "decs": controllerDescription.text.trim(),
            "active": (flag == "EDIT") ? isActive.value : true,
            "flag": (flag == "EDIT") ? "E" : "S",
          }
        )));
  }
}