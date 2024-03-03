import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

import '../../model/get_modules_response/generate_loans_response.dart';

class GenerateLoansUseCase
    extends BaseUseCase<NetworkError, GenerateLoansUseCaseParams, GenerateLoansResponse> {
  final ServicesRepository _repository;

  GenerateLoansUseCase(this._repository);

  @override
  Future<Either<NetworkError, GenerateLoansResponse>> execute(
      {required GenerateLoansUseCaseParams params}) {
    return _repository.generateLoans(params: params);
  }
}

class GenerateLoansUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  GenerateLoansUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}