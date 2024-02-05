import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/services/get_caders_response.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

class GetCadersUseCase
    extends BaseUseCase<NetworkError, GetCadersUseCaseParams, GetCadersResponse> {
  final ServicesRepository _repository;

  GetCadersUseCase(this._repository);

  @override
  Future<Either<NetworkError, GetCadersResponse>> execute(
      {required GetCadersUseCaseParams params}) {
    return _repository.getCaders(params: params);
  }
}

class GetCadersUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  GetCadersUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}