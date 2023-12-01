

import 'dart:convert';

import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/services/borrowers_usecase.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/di/notifier/login_notifier.dart';
import 'package:spoorthymactcs/main/navigation/route_paths.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

class BorrowersPageViewModel extends BasePageViewModel {
  TextEditingController controllerBorrowerName = TextEditingController();
  TextEditingController controllerBorrowerAadhar = TextEditingController();
  TextEditingController controllerBorrowerContactNo = TextEditingController();
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerState = TextEditingController();
  TextEditingController controllerDistrict = TextEditingController();
  TextEditingController controllerPincode = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  ValueNotifier<String> selectedBranch = ValueNotifier("");
  ValueNotifier<bool> isActive = ValueNotifier(false);
   List<dynamic> branchesList = [];

  final BranchesUseCase _branchesUseCase;
  final BorrowersUseCase _borrowersUseCase;
  final CommonUseCase _commonUseCase;

  final PublishSubject<BranchesUseCaseParams> _branchesRequest = PublishSubject();
  final PublishSubject<BorrowersUseCaseParams> _borrowersRequest = PublishSubject();
  final PublishSubject<CommonUseCaseParams> _commonRequest = PublishSubject();

  /// Handle response and states for  content
  final BehaviorSubject<Resource<BranchesResponse>> _branchesResponse = BehaviorSubject();
  final BehaviorSubject<Resource<BorrowersResponse>> _borrowersResponse = BehaviorSubject();
  final BehaviorSubject<Resource<CommonResponse>> _commonResponse = BehaviorSubject();

  /// Stream for content
  Stream<Resource<BorrowersResponse>> get borrowersStream => _borrowersResponse.stream;
  Stream<Resource<CommonResponse>> get commonSaveStream => _commonResponse.stream;

  BorrowersPageViewModel(this._branchesUseCase,this._borrowersUseCase,this._commonUseCase) {
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

    _borrowersRequest.listen((value) {
      RequestManager(value,
              createCall: () => _borrowersUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        _borrowersResponse.safeAdd(event);
      });
    });

    _commonRequest.listen((value) {
      RequestManager(value,
              createCall: () => _commonUseCase.execute(params: value))
          .asFlow()
          .listen((event) async{
          if(event.status == Status.SUCCESS){
            await getBorrowersList();
            modelcontext?.pop();
          }
        _commonResponse.safeAdd(event);
      });
    });
  }

  getBorrowersList(){
  _borrowersRequest.safeAdd(
      BorrowersUseCaseParams(
        secure: jsonEncode({})));
  }

  getBranchesList(){
  _branchesRequest.safeAdd(
      BranchesUseCaseParams(
        secure: jsonEncode({})));
  }

  saveBorrowersData({required String flag, BorrowersResponseData? singleBorrower}){
    List<LoginResponseData> loginResponseData = ProviderScope.containerOf(modelcontext!).read(loginNotifierProvider);
    LoginResponseData? loginData;
    if(loginResponseData.isNotEmpty){
      loginData = loginResponseData[0];
    }

    _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.borrowerSave,
        secure: jsonEncode(
          {
            "id": (flag == "EDIT") ? singleBorrower?.id : null,
            "active": (flag == "EDIT") ? isActive.value : true,
            "flag": (flag == "EDIT") ? "E" : "S",
            "name": controllerBorrowerName.text.trim(),
            "aadhar": controllerBorrowerAadhar.text.trim(),
            "ccode": controllerCode.text.trim(),
            "description": controllerDescription.text.trim(),
            "branch_id": selectedBranch.value,
            "state": controllerState.text.trim(),
            "district": controllerDistrict.text.trim(),
            "pincode": controllerPincode.text.trim(),
            "contact_no": controllerBorrowerContactNo.text.trim(),
            "byemployee": loginData?.userInfo?.id,
            "byemployeename": loginData?.userInfo?.uname,
          }
        )));
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

}