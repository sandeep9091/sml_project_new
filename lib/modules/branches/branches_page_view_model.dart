

import 'dart:convert';

import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/model/services/address_master_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/di/notifier/address_master_notifier.dart';
import 'package:spoorthymactcs/di/notifier/login_notifier.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

import '../../main/navigation/route_paths.dart';

class BranchesPageViewModel extends BasePageViewModel {
  TextEditingController controllerBranchName = TextEditingController();
  TextEditingController controllerBranchCode = TextEditingController();
  TextEditingController controllerBranchDate = TextEditingController();
  TextEditingController controllerContactNumber = TextEditingController();
  TextEditingController controllerPincode = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  //ValueNotifier<String> selectedCadre = ValueNotifier("");
  ValueNotifier<String> selectedCompany = ValueNotifier("");
  ValueNotifier<bool> isActive = ValueNotifier(false);
  List<dynamic> companiesList = [];
  DateTime selectedDate = DateTime.now();

    List<dynamic> countryList = [];
  List<dynamic> stateList = [];
  List<dynamic> cityList = [];
  ValueNotifier<String> selectedCountry = ValueNotifier("");
  ValueNotifier<String> selectedState = ValueNotifier("");
  ValueNotifier<String> selectedCity = ValueNotifier("");

  ValueNotifier<bool> isCitySelected = ValueNotifier(false);
  ValueNotifier<bool> isStateselected = ValueNotifier(false);

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
            showToastWithString(event.data!.sMessage);
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
        secure: {}
        ));
  }

  getCompaniesList(){
  _companiesRequest.safeAdd(
      CompaniesUseCaseParams(
        secure: {}
        ));
  }

  saveBranchesData({required String flag, BranchesResponseData? singleBranch}){
    UserInfo? userInfo = ProviderScope.containerOf(modelcontext!).read(loginUserInfoNotifierProvider);
    
    _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.branchSave,
        secure: 
          {
            "id": (flag == "EDIT") ? singleBranch?.id : null,
            "active": (flag == "EDIT") ? isActive.value : true,
            "flag": (flag == "EDIT") ? "E" : "S",
            "bname": controllerBranchName.text.trim(),
            "bcode": controllerBranchCode.text.trim(),
            "b_opn_dt": controllerBranchDate.text.trim(),
            "desc": controllerDescription.text.trim(),
            "cId": selectedCompany.value,
            "countryname": selectedCountry.value,
            "state": selectedState.value,
            "city": selectedCity.value,
            "cityname": getCityNameFromId(selectedCity.value),
            "pincode": controllerPincode.text.trim(),
            "contact_no": controllerContactNumber.text.trim(),
            "createby": userInfo?.id,
          }
        ));
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

    getStringFromDate(DateTime picked) {
    DateTime dateTime = DateTime(picked.year, picked.month, picked.day);
    DateFormat format = DateFormat("dd/MM/yyyy");
    String dateString = format.format(dateTime);
    controllerBranchDate.text = dateString;
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