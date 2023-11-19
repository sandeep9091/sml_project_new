import 'package:dartz/dartz.dart';
import 'package:domain/model/user_response/user_response.dart';

import '../../error/app_error.dart';
import '../../error/network_error.dart';
import '../../repository/services/services_repository.dart';
import '../base/base_usecase.dart';
import '../base/params.dart';

class UsersUseCase
    extends BaseUseCase<NetworkError, UsersUseCaseParams, UserData> {
  final ServicesRepository _repository;

  UsersUseCase(this._repository);

  @override
  Future<Either<NetworkError, UserData>> execute(
      {required UsersUseCaseParams params}) async {
    return _repository.getUsers();
  }
}

class UsersUseCaseParams extends Params {
  UsersUseCaseParams();

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}
