import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/get_modules_response/get_teams_response.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

class GetTeamsUseCase
    extends BaseUseCase<NetworkError, GetTeamsUseCaseParams, GetTeamsResponse> {
  final ServicesRepository _repository;

  GetTeamsUseCase(this._repository);

  @override
  Future<Either<NetworkError, GetTeamsResponse>> execute(
      {required GetTeamsUseCaseParams params}) {
    return _repository.getTeams(params: params);
  }
}

class GetTeamsUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  GetTeamsUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}