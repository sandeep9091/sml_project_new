import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

class CompaniesUseCase
    extends BaseUseCase<NetworkError, CompaniesUseCaseParams, CompaniesListResponse> {
  final ServicesRepository _repository;

  CompaniesUseCase(this._repository);

  @override
  Future<Either<NetworkError, CompaniesListResponse>> execute(
      {required CompaniesUseCaseParams params}) {
    return _repository.getCompaniesList(params: params);
  }
}

class CompaniesUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  CompaniesUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}