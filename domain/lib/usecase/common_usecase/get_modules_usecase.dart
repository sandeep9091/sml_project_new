
import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/model/get_modules_response/get_modules_response.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

import '../../error/network_error.dart';

class GetModulesUseCase
    extends BaseUseCase<NetworkError, GetModulesUseCaseParams, GetModulesResponse> {
  final UserRepository _repository;

  GetModulesUseCase(this._repository);

  @override
  Future<Either<NetworkError, GetModulesResponse>> execute(
      {required GetModulesUseCaseParams params}) {
    return _repository.getModules(params: params);
  }
}

class GetModulesUseCaseParams extends Params {
  final String secure;
  GetModulesUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}