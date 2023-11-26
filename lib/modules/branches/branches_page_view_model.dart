

import 'dart:convert';

import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/base/base_page_view_model.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

class BranchesPageViewModel extends BasePageViewModel {
  final BranchesUseCase _branchesUseCase;

  final PublishSubject<BranchesUseCaseParams> _branchesRequest = PublishSubject();

  /// Handle response and states for  content
  final BehaviorSubject<Resource<BranchesResponse>> _branchesResponse = BehaviorSubject();

  /// Stream for content
  Stream<Resource<BranchesResponse>> get branchesStream => _branchesResponse.stream;


  BranchesPageViewModel(this._branchesUseCase) {
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
    }




  getBranchesList(){
  _branchesRequest.safeAdd(
      BranchesUseCaseParams(
        secure: jsonEncode({})));
  }

}