import 'package:domain/model/user_response/user_response.dart';
import '../../utils/extension/stream_extention.dart';
import 'package:flutter/material.dart';
import "package:domain/usecase/users_uscase/users_usecase.dart";
import 'package:rxdart/rxdart.dart';

import '../../base/base_page_view_model.dart';
import '../../utils/request_manager.dart';
import '../../utils/resource.dart';

class DashboardPageViewModel extends BasePageViewModel {
  // ValueNotifier<int> myValue = ValueNotifier(0);
  // final UsersUseCase _usersUseCase;

  // final PublishSubject<UsersUseCaseParams> _userstRequest = PublishSubject();

  // /// Handle response and states for  content
  // final BehaviorSubject<Resource<UserData>> _usersResponse = BehaviorSubject();

  // /// Stream for content
  // Stream<Resource<UserData>> get userData => _usersResponse.stream;

  // DashboardPageViewModel(this._usersUseCase) {
  //   _userstRequest.listen((value) {
  //     RequestManager(value,
  //             createCall: () => _usersUseCase.execute(params: value))
  //         .asFlow()
  //         .listen((event) {
  //       _usersResponse.safeAdd(event);
  //     });
  //   });
  //   Future<void>.delayed(const Duration(seconds: 2), () {
  //     getUsersData();
  //   });
  // }

  // getUsersData() {
  //   _userstRequest.safeAdd(UsersUseCaseParams());
  // }
}
