import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/services/get_team_mapper_response.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

class GetTeamMapperUseCase
    extends BaseUseCase<NetworkError, GetTeamMapperUseCaseParams, GetTeamMapperResponse> {
  final ServicesRepository _repository;

  GetTeamMapperUseCase(this._repository);

  @override
  Future<Either<NetworkError, GetTeamMapperResponse>> execute(
      {required GetTeamMapperUseCaseParams params}) {
    return _repository.getTeamMapper(params: params);
  }
}

class GetTeamMapperUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  GetTeamMapperUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}