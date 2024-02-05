
import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/model/get_modules_response/get_modules_new_response.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

import '../../error/network_error.dart';

class GetModulesNewUseCase
    extends BaseUseCase<NetworkError, GetModulesNewUseCaseParams, GetModulesNewResponse> {
  final UserRepository _repository;

  GetModulesNewUseCase(this._repository);

  @override
  Future<Either<NetworkError, GetModulesNewResponse>> execute(
      {required GetModulesNewUseCaseParams params}) {
    return _repository.getModulesNew(params: params);
  }
}

class GetModulesNewUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  GetModulesNewUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}