import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

class BranchesUseCase
    extends BaseUseCase<NetworkError, BranchesUseCaseParams, BranchesResponse> {
  final ServicesRepository _repository;

  BranchesUseCase(this._repository);

  @override
  Future<Either<NetworkError, BranchesResponse>> execute(
      {required BranchesUseCaseParams params}) {
    return _repository.getBranchesList(params: params);
  }
}

class BranchesUseCaseParams extends Params {
  final String secure;
  BranchesUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}