

import 'dart:convert';

import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/model/services/address_master_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/di/notifier/address_master_notifier.dart';
import 'package:spoorthymactcs/di/notifier/login_notifier.dart';
import 'package:spoorthymactcs/main/navigation/route_paths.dart';
import 'package:spoorthymactcs/utils/common_utils.dart';
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

  List<dynamic> countryList = [];
  List<dynamic> stateList = [];
  List<dynamic> cityList = [];
  ValueNotifier<String> selectedCountry = ValueNotifier("");
  ValueNotifier<String> selectedState = ValueNotifier("");
  ValueNotifier<String> selectedCity = ValueNotifier("");
  ValueNotifier<String?> companyLogoFilePath = ValueNotifier(null);

  ValueNotifier<bool> isCitySelected = ValueNotifier(false);
  ValueNotifier<bool> isStateselected = ValueNotifier(false);
  

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
            showToastWithString(event.data!.sMessage);
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
        secure: {}
        ));
  }

  saveCompanyData({required String flag, CompaniesListResponseData? eachCompany}){
    UserInfo? userInfo = ProviderScope.containerOf(modelcontext!).read(loginUserInfoNotifierProvider);
    
    _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.companiesSave,
        secure: 
          {
            "id": (flag == "EDIT") ? eachCompany?.id : null,
            "flag": (flag == "EDIT") ? "E" : "S",
            "cname": controllerCompanyName.text.trim(),
            "ccode": "",
            "cadress": controllerCompanyAddress.text.trim(),
            "decs": controllerDescription.text.trim(),
            "active": (flag == "EDIT") ? isActive.value : true,
            "countryname": selectedCountry.value,
            "state": selectedState.value,
            "city": selectedCity.value,
            "cityname": getCityNameFromId(selectedCity.value),
            "createby": userInfo?.id,
            "cLogo": AppCommonUtils().getUploadImagePath(companyLogoFilePath.value),
          }
        ));

    debugPrint("");
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