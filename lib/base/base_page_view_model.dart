import 'package:domain/error/app_error.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spoorthymactcs/utils/status.dart';

import 'base_view_model.dart';

class BasePageViewModel extends BaseViewModel {
  final PublishSubject<AppError> _error = PublishSubject<AppError>();
  final PublishSubject<String> _toast = PublishSubject<String>();
  final PublishSubject<Status> _status = PublishSubject<Status>();

  Stream<AppError> get error => _error.stream;

  Stream<String> get toast => _toast.stream;
   Stream<Status> get status => _status.stream;

  void showToastWithError(AppError? error) {
    try {
      _error.sink.add(error!);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  void showToastWithString(String message) {
    _toast.sink.add(message);
  }

  void showLoader(Status status) {
    _status.sink.add(status);
    //_status.add(status);
  }

  void notify() {
    notifyListeners();
  }

  @override
  void dispose() {
    _error.close();
    _toast.close();
    super.dispose();
  }
}
