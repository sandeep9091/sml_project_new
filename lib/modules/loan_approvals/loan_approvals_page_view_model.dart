

import 'package:domain/model/get_modules_response/generate_loans_response.dart';
import 'package:domain/usecase/services/generate_loans_usecase.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';

class LoanApprovalsPageViewModel extends BasePageViewModel {

  final GenerateLoansUseCase _generateLoansUseCase;

  final PublishSubject<GenerateLoansUseCaseParams> _generateLoansRequest = PublishSubject();

  final BehaviorSubject<Resource<GenerateLoansResponse>> _generateLoansResponse = BehaviorSubject();

  Stream<Resource<GenerateLoansResponse>> get generateLoansStream => _generateLoansResponse.stream;

  LoanApprovalsPageViewModel(this._generateLoansUseCase) {
    _generateLoansRequest.listen((value) {
      RequestManager(value,
              createCall: () => _generateLoansUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
          showLoader(event.status);
        _generateLoansResponse.safeAdd(event);
      });
    });
  }

  getGeneratedLoans(){
  _generateLoansRequest.safeAdd(
      GenerateLoansUseCaseParams(
        secure: {}
        ));
  }

}