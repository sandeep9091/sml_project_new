import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

import '../../model/get_modules_response/recovery_history_response.dart';

class RecoveryHistoryUseCase
    extends BaseUseCase<NetworkError, RecoveryHistoryUseCaseParams, RecoveryHistoryResponse> {
  final ServicesRepository _repository;

  RecoveryHistoryUseCase(this._repository);

  @override
  Future<Either<NetworkError, RecoveryHistoryResponse>> execute(
      {required RecoveryHistoryUseCaseParams params}) {
    return _repository.getRecoveryHistory(params: params);
  }
}

class RecoveryHistoryUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  RecoveryHistoryUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}