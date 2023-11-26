
import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

import '../../error/network_error.dart';

class CommonUseCase
    extends BaseUseCase<NetworkError, CommonUseCaseParams, CommonResponse> {
  final UserRepository _repository;

  CommonUseCase(this._repository);

  @override
  Future<Either<NetworkError, CommonResponse>> execute(
      {required CommonUseCaseParams params}) {
    return _repository.saveFormData(params: params);
  }
}

class CommonUseCaseParams extends Params {
  final String secure;
  CommonUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}