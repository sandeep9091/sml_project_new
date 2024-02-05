

import 'dart:convert';

import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/model/services/address_master_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/services/borrowers_usecase.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/di/notifier/address_master_notifier.dart';
import 'package:spoorthymactcs/di/notifier/login_notifier.dart';
import 'package:spoorthymactcs/main/navigation/route_paths.dart';
import 'package:spoorthymactcs/utils/common_utils.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

class BorrowersPageViewModel extends BasePageViewModel {
  TextEditingController controllerBorrowerName = TextEditingController();
  TextEditingController controllerBorrowerAadhar = TextEditingController();
  TextEditingController controllerBorrowerContactNo = TextEditingController();
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerPincode = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  ValueNotifier<String> selectedBranch = ValueNotifier("");
  ValueNotifier<bool> isActive = ValueNotifier(false);
   List<dynamic> branchesList = [];

  List<dynamic> countryList = [];
  List<dynamic> stateList = [];
  List<dynamic> cityList = [];
  ValueNotifier<String> selectedCountry = ValueNotifier("");
  ValueNotifier<String> selectedState = ValueNotifier("");
  ValueNotifier<String> selectedCity = ValueNotifier("");

  ValueNotifier<bool> isCitySelected = ValueNotifier(false);
  ValueNotifier<bool> isStateselected = ValueNotifier(false);

  ValueNotifier<String?> filePathAadhar = ValueNotifier(null);
  ValueNotifier<String?> filePathRationCard = ValueNotifier(null);
  ValueNotifier<String?> filePathHouseTaxReceipt = ValueNotifier(null);
  ValueNotifier<String?> filePathLoanApplication = ValueNotifier(null);
  ValueNotifier<String?> filePathHousePhoto = ValueNotifier(null);
  ValueNotifier<String?> filePathPassportPhoto = ValueNotifier(null);
  ValueNotifier<String?> filePathOthers = ValueNotifier(null);

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
            showToastWithString(event.data!.sMessage);
            await getBorrowersList(modelcontext!);
            modelcontext?.pop();
          }else if(event.status == Status.ERROR){
            showToastWithError(event.appError);
          }
        _commonResponse.safeAdd(event);
      });
    });
  }

  getBorrowersList(BuildContext context){
    UserInfo? userInfo= ProviderScope.containerOf(context).read(loginUserInfoNotifierProvider);
    if(userInfo != null){
        _borrowersRequest.safeAdd(
      BorrowersUseCaseParams(
          secure: {
              "code": "",
              "create_by": userInfo?.id ??""
          }
        ));
    }

  }

  getBranchesList(){
  _branchesRequest.safeAdd(
      BranchesUseCaseParams(
        secure: {}
        ));
  }

  saveBorrowersData({required String flag, BorrowersResponseData? singleBorrower}){
    UserInfo? userInfo = ProviderScope.containerOf(modelcontext!).read(loginUserInfoNotifierProvider);

    _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.borrowerSave,
        secure: 
          {
            "id": (flag == "EDIT") ? singleBorrower?.id : null,
            "active": (flag == "EDIT") ? isActive.value : true,
            "flag": (flag == "EDIT") ? "E" : "S",
            "name": controllerBorrowerName.text.trim(),
            "aadhar": controllerBorrowerAadhar.text.trim(),
            "ccode": null,
            "description": controllerDescription.text.trim(),
            "countryname": selectedCountry.value,
            "state": selectedState.value,
            "city": selectedCity.value,
            "cityname": getCityNameFromId(selectedCity.value),
            "pincode": controllerPincode.text.trim(),
            "contact_no": controllerBorrowerContactNo.text.trim(),
            "byemployee": userInfo?.id,
            "byemployeename": userInfo?.uname,
            "A": AppCommonUtils().getUploadImagePath(filePathAadhar.value),
            "RC": AppCommonUtils().getUploadImagePath(filePathRationCard.value),
            "HT": AppCommonUtils().getUploadImagePath(filePathHouseTaxReceipt.value),
            "LA": AppCommonUtils().getUploadImagePath(filePathLoanApplication.value),
            "HP": AppCommonUtils().getUploadImagePath(filePathHousePhoto.value),
            "PP": AppCommonUtils().getUploadImagePath(filePathPassportPhoto.value),
            "OTHERS": AppCommonUtils().getUploadImagePath(filePathOthers.value),
            "create_by": userInfo?.id,
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

  disposeAllVariables(){
   controllerBorrowerName.clear();
    controllerBorrowerAadhar.clear();
    controllerBorrowerContactNo.clear();
    controllerCode.clear();
    selectedCountry.value = "";
    selectedState.value = "";
    selectedCity.value = "";
    controllerPincode.clear();
    controllerDescription.clear();
    selectedBranch.value = "";
    filePathAadhar.value = null;
    filePathRationCard.value = null;
    filePathHouseTaxReceipt.value = null;
    filePathLoanApplication.value = null;
    filePathHousePhoto.value = null;
    filePathPassportPhoto.value = null;
    filePathOthers.value = null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerBorrowerName.dispose();
    controllerBorrowerAadhar.dispose();
    controllerBorrowerContactNo.dispose();
    controllerCode.dispose();
    selectedCountry.dispose();
    selectedState.dispose();
    selectedCity.dispose();
    controllerPincode.dispose();
    controllerDescription.dispose();
    selectedBranch.dispose();
    filePathAadhar.dispose();
    filePathRationCard.dispose();
    filePathHouseTaxReceipt.dispose();
    filePathLoanApplication.dispose();
    filePathHousePhoto.dispose();
    filePathPassportPhoto.dispose();
    filePathOthers.dispose();
  }

  filterAddressMasterList(BuildContext context){
    List<AddressData> addressData = ProviderScope.containerOf(context).read(addressMasterNotifierProvider);
    for(var x in addressData){
      countryList.add({
        "name":x.name,
        "code":x.code
      });
    }
  }

  filterStatesList(){
    List<AddressData> addressData = ProviderScope.containerOf(modelcontext!).read(addressMasterNotifierProvider);
    for(var x in addressData){
      if(x.name == selectedCountry.value){
        stateList = x.states; 
      }
    }
    isStateselected.value = !isStateselected.value;
    isCitySelected.value = !isCitySelected.value;
    selectedState.value = "";
    selectedCity.value = "";
  }

  filterCitiesList(){
    List<AddressData> addressData = ProviderScope.containerOf(modelcontext!).read(addressMasterNotifierProvider);
    for(var x in addressData){
      if(x.name == selectedCountry.value){
        for(var y in x.states){
          if(y.name == selectedState.value){
            cityList = y.cities;
          }
        } 
      }
    }
    isCitySelected.value = !isCitySelected.value;
    selectedCity.value = "";
  }

  getCityNameFromId(String cityId){
    List<AddressData> addressData = ProviderScope.containerOf(modelcontext!).read(addressMasterNotifierProvider);
    for(var x in addressData){
      for(var y in x.states){
          for(var z in y.cities){
            if(z.code == selectedCity.value){
              return z.cname;
            }
        } 
        } 
    }
  }

  updateStateCityData(String city){
    List<AddressData> addressData = ProviderScope.containerOf(modelcontext!).read(addressMasterNotifierProvider);
    for(var x in addressData){
      for(var y in x.states){
          for(var z in y.cities){
            if(z.cname == city){
              stateList = x.states; 
              cityList = y.cities;
              selectedCountry.value = x.name;
              selectedState.value = y.name;
              selectedCity.value = z.code;
            }
        } 
        } 
    }
  }

}