import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

class BorrowersUseCase
    extends BaseUseCase<NetworkError, BorrowersUseCaseParams, BorrowersResponse> {
  final ServicesRepository _repository;

  BorrowersUseCase(this._repository);

  @override
  Future<Either<NetworkError, BorrowersResponse>> execute(
      {required BorrowersUseCaseParams params}) {
    return _repository.getBorrowersList(params: params);
  }
}

class BorrowersUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  BorrowersUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}