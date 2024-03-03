import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

import '../../model/get_modules_response/get_only_created_borrowers_response.dart';

class GetOnlyCreatedBorrowersUseCase
    extends BaseUseCase<NetworkError, GetOnlyCreatedBorrowersUseCaseParams, GetOnlyCreatedBorrowersResponse> {
  final ServicesRepository _repository;

  GetOnlyCreatedBorrowersUseCase(this._repository);

  @override
  Future<Either<NetworkError, GetOnlyCreatedBorrowersResponse>> execute(
      {required GetOnlyCreatedBorrowersUseCaseParams params}) {
    return _repository.getOnlyCreatedBorrowers(params: params);
  }
}

class GetOnlyCreatedBorrowersUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  GetOnlyCreatedBorrowersUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}