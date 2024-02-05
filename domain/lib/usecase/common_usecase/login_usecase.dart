
import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

import '../../error/network_error.dart';
import '../../model/login/login_response.dart';

class LoginUseCase
    extends BaseUseCase<NetworkError, LoginUseCaseParams, LoginResponse> {
  final UserRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<NetworkError, LoginResponse>> execute(
      {required LoginUseCaseParams params}) {
    return _repository.login(params: params);
  }
}

class LoginUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  LoginUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}