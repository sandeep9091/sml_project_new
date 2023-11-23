

import 'dart:convert';

import 'package:domain/usecase/common_usecase/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/subjects.dart';
import 'package:spoorthymactcs/utils/extension/stream_extention.dart';
import 'package:spoorthymactcs/utils/request_manager.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:domain/model/login/login_response.dart';
import '../../base/base_page_view_model.dart';
import '../../di/notifier/login_notifier.dart';
import '../../utils/common_utils.dart';
import '../../utils/status.dart';

class LoginPageViewModel extends BasePageViewModel {
  
TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  ValueNotifier<bool> showPassword = ValueNotifier(false);
  ValueNotifier<bool> suffixIconVisible = ValueNotifier(false);

  final LoginUseCase _loginUseCase;
  final PublishSubject<LoginUseCaseParams> _loginRequest = PublishSubject();

  /// Handle response and states for  content
  final PublishSubject<Resource<LoginResponse>> _loginResponse =
      PublishSubject();
      
  /// Stream for content
  Stream<Resource<LoginResponse>> get loginStream => _loginResponse.stream;

  LoginPageViewModel(
    this._loginUseCase,
  ) {
    _loginRequest.listen((value) {
      RequestManager(value,
              createCall: () => _loginUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        showLoader(event.status);
        if(event.status == Status.SUCCESS){
          if(event.data!.data.isNotEmpty){
            AppCommonUtils().secureStorage().setValue(key: 'loginResponse',value: event.data!.data.toString());
            ProviderScope.containerOf(modelcontext!).
            read(loginNotifierProvider.notifier).setData(event.data!.data);
          }
        }
        _loginResponse.safeAdd(event);
      });
    });
  }

  login() async{
    _loginRequest.safeAdd(
      LoginUseCaseParams(
        secure: jsonEncode({
          'flag':'S',
          'uname': controllerUserName.text.toString(),
          'password': controllerPassword.text.toString()
          })
      ),
    );
  }

}