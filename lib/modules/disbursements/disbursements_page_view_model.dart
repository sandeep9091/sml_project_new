

import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:domain/model/get_modules_response/generate_loans_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/services/borrowers_usecase.dart';
import 'package:domain/usecase/services/generate_loans_usecase.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';

import '../../main/navigation/route_paths.dart';
import '../../utils/status.dart';

class DisbursementsPageViewModel extends BasePageViewModel {
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
  ValueNotifier<String> selectedPaymentType = ValueNotifier("");
  ValueNotifier<String> selectedDisbursementStatus = ValueNotifier("");
  TextEditingController controllerDescription = TextEditingController();
  TextEditingController controllerSmtCode = TextEditingController();
  TextEditingController controllerbank = TextEditingController();
  TextEditingController controllerAccountNo = TextEditingController();
  TextEditingController controllerAccountName = TextEditingController();
  TextEditingController controllerIfscCode = TextEditingController();
  TextEditingController controllerSurityName = TextEditingController();
  TextEditingController controllerSurityAadhar = TextEditingController();
  TextEditingController controllerSurityContactNo = TextEditingController();
  TextEditingController controllerDisbursementRemarks = TextEditingController();
  List<BorrowersResponseData> borrowersList = [];
  UserInfo? userInfo;

  final GenerateLoansUseCase _generateLoansUseCase;
  final CommonUseCase _commonUseCase;
  final BorrowersUseCase _borrowersUseCase;

  final PublishSubject<GenerateLoansUseCaseParams> _generateLoansRequest = PublishSubject();
  final PublishSubject<CommonUseCaseParams> _commonRequest = PublishSubject();
  final PublishSubject<BorrowersUseCaseParams> _borrowersRequest = PublishSubject();

  final BehaviorSubject<Resource<GenerateLoansResponse>> _generateLoansResponse = BehaviorSubject();
  final BehaviorSubject<Resource<CommonResponse>> _commonResponse = BehaviorSubject();
  final BehaviorSubject<Resource<BorrowersResponse>> _borrowersResponse = BehaviorSubject();

  Stream<Resource<GenerateLoansResponse>> get generateLoansStream => _generateLoansResponse.stream;
  Stream<Resource<CommonResponse>> get commonSaveStream => _commonResponse.stream;

  DisbursementsPageViewModel(this._generateLoansUseCase,this._commonUseCase,this._borrowersUseCase) {
    _generateLoansRequest.listen((value) {
      RequestManager(value,
              createCall: () => _generateLoansUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
          showLoader(event.status);
        _generateLoansResponse.safeAdd(event);
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
  }

getGeneratedLoans(){
    if(userInfo != null){
    _generateLoansRequest.safeAdd(
      GenerateLoansUseCaseParams(
        secure: {"create_by":userInfo?.id}
        ));
    } 
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

  saveGenerateLoanData(GenerateLoansResponseData? eachGeneratedLoan){
    _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.generateloans,
        secure: 
          {
            "smtcode": controllerSmtCode.text,
            "branch": eachGeneratedLoan?.branch,
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
            "approvalstatus": eachGeneratedLoan?.approvalstatus,
            "approvalremarks": eachGeneratedLoan?.approvalremarks,
            "approvalby": "",
            "active": true,
            "description": controllerDescription.text,
            "flag": "DISBURSEMENT",
            "create_by": userInfo?.id,
            "borrower": eachGeneratedLoan?.borrower,
            "id": eachGeneratedLoan?.id,
            "paymenttype": selectedPaymentType.value,
            "disbursementstatus": selectedDisbursementStatus.value,
            "disbursementstatusremarks": controllerDisbursementRemarks.text,
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
  selectedPaymentType.value = "";
  selectedDisbursementStatus.value = "";
  controllerDescription.clear();
  controllerbank.clear();
  controllerAccountNo.clear();
  controllerAccountName.clear();
  controllerIfscCode.clear();
  controllerSurityName.clear();
  controllerSurityAadhar.clear();
  controllerSurityContactNo.clear();
  controllerDisbursementRemarks.clear();
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
    selectedPaymentType.value = "";
    selectedDisbursementStatus.value = "";
    controllerbank.clear();
    controllerAccountNo.clear();
    controllerAccountName.clear();
    controllerIfscCode.clear();
    controllerSurityName.clear();
    controllerSurityAadhar.clear();
    controllerSurityContactNo.clear();
    controllerDescription.clear();
    controllerDisbursementRemarks.clear();
    super.dispose();
  }

}