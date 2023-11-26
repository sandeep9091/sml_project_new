

import 'package:dartz/dartz.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/get_modules_response.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/common_usecase/get_modules_usecase.dart';
import 'package:domain/usecase/common_usecase/login_usecase.dart';

abstract class UserRepository{
  Future<Either<NetworkError, LoginResponse>> login(
      {required LoginUseCaseParams params});

  Future<Either<NetworkError, GetModulesResponse>> getModules(
      {required GetModulesUseCaseParams params});

  Future<Either<NetworkError, CommonResponse>> saveFormData(
      {required CommonUseCaseParams params});
}