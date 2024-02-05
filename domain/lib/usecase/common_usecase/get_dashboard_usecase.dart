
import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/model/get_modules_response/dashboard_response.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

import '../../error/network_error.dart';

class GetDashboardUseCase
    extends BaseUseCase<NetworkError, GetDashboardUseCaseParams, GetDashboardResponse> {
  final UserRepository _repository;

  GetDashboardUseCase(this._repository);

  @override
  Future<Either<NetworkError, GetDashboardResponse>> execute(
      {required GetDashboardUseCaseParams params}) {
    return _repository.getDashboardData(params: params);
  }
}

class GetDashboardUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  GetDashboardUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}