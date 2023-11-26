

import 'dart:convert';

import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

class CompaniesPageViewModel extends BasePageViewModel {
  final CompaniesUseCase _companiesUseCase;

  final PublishSubject<CompaniesUseCaseParams> _companiesRequest = PublishSubject();

  /// Handle response and states for  content
  final BehaviorSubject<Resource<CompaniesListResponse>> _companiesResponse = BehaviorSubject();

  /// Stream for content
  Stream<Resource<CompaniesListResponse>> get companiesStream => _companiesResponse.stream;


  CompaniesPageViewModel(this._companiesUseCase) {
    _companiesRequest.listen((value) {
      RequestManager(value,
              createCall: () => _companiesUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        _companiesResponse.safeAdd(event);
      });
    });
    }




  getCompaniesList(){
  _companiesRequest.safeAdd(
      CompaniesUseCaseParams(
        secure: jsonEncode({})));
  }


}