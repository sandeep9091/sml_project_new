import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/get_modules_response/users_response.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

class UsersUseCase
    extends BaseUseCase<NetworkError, UsersUseCaseParams, UsersListResponse> {
  final ServicesRepository _repository;

  UsersUseCase(this._repository);

  @override
  Future<Either<NetworkError, UsersListResponse>> execute(
      {required UsersUseCaseParams params}) {
    return _repository.getUsersList(params: params);
  }
}

class UsersUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  UsersUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}