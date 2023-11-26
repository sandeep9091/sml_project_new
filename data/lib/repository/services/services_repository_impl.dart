import 'package:data/network/utils/safe_api_call.dart';
import 'package:data/source/services_datasource.dart';
import 'package:domain/error/network_error.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:domain/model/get_modules_response/users_response.dart';
import 'package:domain/model/services/get_caders_response.dart';
import 'package:domain/model/services/get_gender_list_response.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:domain/usecase/services/users_usecase.dart';

class ServicesRepositoryImpl extends ServicesRepository {
  final ServicesRemoteDataSource _remoteDS;

  ServicesRepositoryImpl(this._remoteDS);

    @override
  Future<Either<NetworkError, GetCadersResponse>> getCaders(
    {required GetCadersUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.getCaders(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }

    @override
  Future<Either<NetworkError, GetGenderListResponse>> getGenderList(
    {required GetGenderListUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.getGenderList(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }

    @override
  Future<Either<NetworkError, BranchesResponse>> getBranchesList(
    {required BranchesUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.getBranchesList(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }

  @override
  Future<Either<NetworkError, CompaniesListResponse>> getCompaniesList(
    {required CompaniesUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.getCompaniesList(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }

    @override
  Future<Either<NetworkError, UsersListResponse>> getUsersList(
    {required UsersUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.getUsersList(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }
}
