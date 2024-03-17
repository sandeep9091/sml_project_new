

import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/model/get_modules_response/generate_loans_response.dart';
import 'package:domain/model/get_modules_response/get_teams_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/model/services/get_team_mapper_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/services/borrowers_usecase.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/generate_loans_usecase.dart';
import 'package:domain/usecase/services/get_teams_mapper_usecase.dart';
import 'package:domain/usecase/services/get_teams_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/di/notifier/team_mapping_notifier.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

import '../../main/navigation/route_paths.dart';

class GenerateLoansPageViewModel extends BasePageViewModel {
  ValueNotifier<bool> isActive = ValueNotifier(false);
  String selectedBorrower = "";
  ValueNotifier<String> selectedBorrowerName = ValueNotifier("");
  ValueNotifier<int> selectedHouseType = ValueNotifier(0);
  ValueNotifier<int> selectedProductType = ValueNotifier(0);
  ValueNotifier<int> selectedDeposit = ValueNotifier(0);
  ValueNotifier<int> selectedLoanAmount = ValueNotifier(0);
  ValueNotifier<int> selectedRepayMode = ValueNotifier(0);
  ValueNotifier<int> selectedLoanTenure = ValueNotifier(0);
  ValueNotifier<int> selectedSurityHouseType = ValueNotifier(0);
  TextEditingController controllerDescription = TextEditingController();
  TextEditingController controllerSmtCode = TextEditingController();
  TextEditingController controllerbank = TextEditingController();
  TextEditingController controllerAccountNo = TextEditingController();
  TextEditingController controllerAccountName = TextEditingController();
  TextEditingController controllerIfscCode = TextEditingController();
  TextEditingController controllerSurityName = TextEditingController();
  TextEditingController controllerSurityAadhar = TextEditingController();
  TextEditingController controllerSurityContactNo = TextEditingController();
  List<BorrowersResponseData> borrowersList = [];
  List<dynamic> branchesList = [];
  List<dynamic> newBranchesList = [];
  UserInfo? userInfo;

  ValueNotifier<bool> enableSave = ValueNotifier(false);
  final GenerateLoansUseCase _generateLoansUseCase;
  final GetTeamMapperUseCase _getTeamMapperUseCase;
  final GetTeamsUseCase _getTeamsUseCase;
  final CommonUseCase _commonUseCase;
  final BorrowersUseCase _borrowersUseCase;
  final BranchesUseCase _branchesUseCase;

  final PublishSubject<GenerateLoansUseCaseParams> _generateLoansRequest = PublishSubject();
  final PublishSubject<GetTeamMapperUseCaseParams> _getTeamMapperRequest = PublishSubject();
  final PublishSubject<GetTeamsUseCaseParams> _getTeamsRequest = PublishSubject();
  final PublishSubject<CommonUseCaseParams> _commonRequest = PublishSubject();
  final PublishSubject<BorrowersUseCaseParams> _borrowersRequest = PublishSubject();
  final PublishSubject<BranchesUseCaseParams> _branchesRequest = PublishSubject();

  final BehaviorSubject<Resource<GenerateLoansResponse>> _generateLoansResponse = BehaviorSubject();
  final BehaviorSubject<Resource<GetTeamMapperResponse>> _getTeamMapperResponse = BehaviorSubject();
  final BehaviorSubject<Resource<GetTeamsResponse>> _getTeamsResponse = BehaviorSubject();
  final BehaviorSubject<Resource<CommonResponse>> _commonResponse = BehaviorSubject();
  final BehaviorSubject<Resource<BorrowersResponse>> _borrowersResponse = BehaviorSubject();
  final BehaviorSubject<Resource<BranchesResponse>> _branchesResponse = BehaviorSubject();

  Stream<Resource<GenerateLoansResponse>> get generateLoansStream => _generateLoansResponse.stream;
  Stream<Resource<GetTeamMapperResponse>> get getTeamMapperStream => _getTeamMapperResponse.stream;
  Stream<Resource<GetTeamsResponse>> get getTeamsStream => _getTeamsResponse.stream;
    Stream<Resource<CommonResponse>> get commonSaveStream => _commonResponse.stream;
    Stream<Resource<BorrowersResponse>> get borrowersStream => _borrowersResponse.stream;

  GenerateLoansPageViewModel(this._generateLoansUseCase,this._getTeamMapperUseCase,this._getTeamsUseCase,this._commonUseCase,this._borrowersUseCase,this._branchesUseCase) {
    _generateLoansRequest.listen((value) {
      RequestManager(value,
              createCall: () => _generateLoansUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        _generateLoansResponse.safeAdd(event);
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
            showToastWithString(event.data!.sMessage);
            getGeneratedLoans();
            getBranchesList();
            modelcontext?.pop();
          }else if(event.status == Status.ERROR){
            showToastWithError(event.appError);
          }
        _commonResponse.safeAdd(event);
      });
    });

    _borrowersRequest.listen((value) {
      RequestManager(value,
              createCall: () => _borrowersUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        if(event.status == Status.SUCCESS){
            if(event.data?.data != null){
              List<BorrowersResponseData> data1 = event.data?.data??[];
              if(data1.isNotEmpty){
                borrowersList = data1;
              }
            }
          }
        _borrowersResponse.safeAdd(event);
      });
    });

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
  }

  updateBranchesList(List<BranchesResponseData> data) {
    if(data.isNotEmpty){
      for (var each in data) {
        branchesList.add({
        "name": each.bname,
        "branchid": each.branchid,
        "bcode": each.bcode,
        "clientCount": each.clientCount
      });
      }}
  }

  getGeneratedLoans(){
    if(userInfo != null){
    _generateLoansRequest.safeAdd(
      GenerateLoansUseCaseParams(
        secure: {"create_by":userInfo?.id}
        ));
    } 
 
  }

  getTeamMapper(){
  _getTeamMapperRequest.safeAdd(
      GetTeamMapperUseCaseParams(
        secure: {}
        ));
  }

  getBranchesList(){
    if(userInfo != null){
       _branchesRequest.safeAdd(
      BranchesUseCaseParams(
        secure: {"filter": "Drop", "create_by": userInfo?.id}
        ));
    }  
  }

  getTeams(String branchId){
  _getTeamsRequest.safeAdd(
      GetTeamsUseCaseParams(
        secure: {
          "branch": branchId
        }
        ));
  }

  getBorrowersList(){
    if(userInfo != null){
        _borrowersRequest.safeAdd(
      BorrowersUseCaseParams(
          secure: {
              "code": "",
              "create_by": userInfo?.id
          }
        ));
    }

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

/*     _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.createTeamSave,
        secure: 
          {
            "branch": selectedBranch.value,
            "cader": dummyCaderList
          }
        )); */
  }

/*   updateBranchesList(List<BranchesResponseData> data) {
    if(data.isNotEmpty){
      for (var each in data) { 
        branchesList.add({
        "name": each.bname,
        "id": each.id
      });
      }}
  } */

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

  getsmtCode(BuildContext context){
    if(userInfo != null && branchesList.isNotEmpty){
      newBranchesList = branchesList.where((element) => (element['branchid'] == userInfo?.branchid)).toList();
      controllerSmtCode.text = newBranchesList[0]['bcode']+(newBranchesList[0]['clientCount']+1).toString().padLeft(3, '0');
    }
  }

  int getValueFromId(String? id){
    try{
    if(id!=null && id.isNotEmpty){
      return int.parse(id);
    }else{
      return 0;
    }
    }catch(e){
      return 0;
    }
  }

  saveGenerateLoanData(){
    _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.generateloans,
        secure: 
          {
            "smtcode": controllerSmtCode.text,
            "branch": newBranchesList[0]['branchid'],
            "borrowername": selectedBorrowerName.value,
            "housetype": selectedHouseType.value,
            "prodtype": selectedProductType.value,
            "loanamount": selectedLoanAmount.value,
            "loanschedule": selectedRepayMode.value,
            "tenure": selectedLoanTenure.value,
            "bankname": controllerbank.text,
            "accountno": controllerAccountNo.text,
            "accountname": controllerAccountName.text,
            "ifsc": controllerIfscCode.text,
            "surityname": controllerSurityName.text,
            "surityaadhar": controllerSurityAadhar.text,
            "surityhousetype": selectedSurityHouseType.value,
            "contactnumber": controllerSurityContactNo.text,
            "deposit": selectedDeposit.value,
            "approvalstatus": "P",
            "approvalremarks": "",
            "approvalby": "P",
            "active": true,
            "description": controllerDescription.text,
            "flag": "S",
            "create_by": userInfo?.id,
            "borrower": selectedBorrower
          }
        ));
  }

  disposeAllVariables(){
  selectedBorrowerName.value = "";
  selectedBorrower = "";
  selectedHouseType.value = 0;
  selectedProductType.value = 0;
  selectedLoanAmount.value = 0;
  selectedRepayMode.value = 0;
  selectedLoanTenure.value = 0;
  selectedSurityHouseType.value = 0;
  controllerDescription.clear();
  controllerbank.clear();
  controllerAccountNo.clear();
  controllerAccountName.clear();
  controllerIfscCode.clear();
  controllerSurityName.clear();
  controllerSurityAadhar.clear();
  controllerSurityContactNo.clear();
  }

    @override
  void dispose() {
    selectedBorrowerName.value = "";
    selectedBorrower = "";
    selectedHouseType.value = 0;
    selectedProductType.value = 0;
    selectedLoanAmount.value = 0;
    selectedRepayMode.value = 0;
    selectedLoanTenure.value = 0;
    selectedSurityHouseType.value = 0;
    controllerbank.clear();
    controllerAccountNo.clear();
    controllerAccountName.clear();
    controllerIfscCode.clear();
    controllerSurityName.clear();
    controllerSurityAadhar.clear();
    controllerSurityContactNo.clear();
    controllerDescription.clear();
    super.dispose();
  }
}