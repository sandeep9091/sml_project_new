

import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/generate_loans_response.dart';
import 'package:domain/model/get_modules_response/recovery_history_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/services/generate_loans_usecase.dart';
import 'package:domain/usecase/services/recovery_history_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';

import '../../di/notifier/login_notifier.dart';
import '../../main/navigation/route_paths.dart';
import '../../utils/common_lists.dart';
import '../../utils/status.dart';

class RecoveryPageViewModel extends BasePageViewModel {
  TextEditingController collectedAmountController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  ValueNotifier<bool> enableSave = ValueNotifier(false);
  ValueNotifier<String> selectedPaymentType = ValueNotifier("");

  final GenerateLoansUseCase _generateLoansUseCase;
  final CommonUseCase _commonUseCase;
  final RecoveryHistoryUseCase _recoveryHistoryUseCase;

  final PublishSubject<GenerateLoansUseCaseParams> _generateLoansRequest = PublishSubject();
  final PublishSubject<CommonUseCaseParams> _commonRequest = PublishSubject();
  final PublishSubject<RecoveryHistoryUseCaseParams> _recoveryHistoryRequest = PublishSubject();

  final BehaviorSubject<Resource<GenerateLoansResponse>> _generateLoansResponse = BehaviorSubject();
  final BehaviorSubject<Resource<CommonResponse>> _commonResponse = BehaviorSubject();
  final BehaviorSubject<Resource<RecoveryHistoryResponse>> _recoveryHistoryResponse = BehaviorSubject();

  Stream<Resource<GenerateLoansResponse>> get generateLoansStream => _generateLoansResponse.stream;
    Stream<Resource<CommonResponse>> get commonSaveStream => _commonResponse.stream;
    Stream<Resource<RecoveryHistoryResponse>> get recoveryHistoryStream => _recoveryHistoryResponse.stream;

  RecoveryPageViewModel(this._generateLoansUseCase,this._commonUseCase,this._recoveryHistoryUseCase) {
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
            await getGeneratedLoans(modelcontext!);
            modelcontext?.pop();
          }
        _commonResponse.safeAdd(event);
      });
    });

    _recoveryHistoryRequest.listen((value) {
      RequestManager(value,
              createCall: () => _recoveryHistoryUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        _recoveryHistoryResponse.safeAdd(event);
      });
    });
  }

  getGeneratedLoans(BuildContext context){
    UserInfo? userInfo = ProviderScope.containerOf(context).read(loginUserInfoNotifierProvider);
  _generateLoansRequest.safeAdd(
      GenerateLoansUseCaseParams(
        secure: {
          "create_by": userInfo?.id
        }
        ));
  }

  getRecoveryHistory(String smtcode,String loanid){
  _recoveryHistoryRequest.safeAdd(
      RecoveryHistoryUseCaseParams(
        secure: {
          "smtcode": smtcode,
          "loanid": loanid
        }
        ));
  }

  saveData(GenerateLoansResponseData each){
    UserInfo? userInfo = ProviderScope.containerOf(modelcontext!).read(loginUserInfoNotifierProvider);
    _commonRequest.safeAdd(
      CommonUseCaseParams(
        endPointUrl: RoutePaths.recoverypayment,
        secure: 
          {
            "flag": "S",
            "loanid": each.id,
            "smtcode": each.smtcode,
            "borrwedamount": each.loanamount,
            "collectedAmount": collectedAmountController.text,
            "paymenttype": selectedPaymentType.value.isNotEmpty?int.parse(selectedPaymentType.value):0,
            "remarks": remarksController.text,
            "create_by": userInfo?.id,
            "paymentcnt": each.paymentcnt
          }
        ));
  }

  String collectedAmount(List<RecoveryHistoryResponseData>? historyData){
    try{
      int collectedAmount = 0;
      for(var each in historyData!){
        collectedAmount += int.parse(each.collectedAmount);
      }
      return collectedAmount.toString();
    }catch(e){
      return "";
    }
  }

  disposeAllVariables(){
    collectedAmountController.clear();
    remarksController.clear();
    enableSave.value = false;
    selectedPaymentType.value = "";
  }
}