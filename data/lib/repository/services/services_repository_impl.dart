import 'package:data/network/utils/safe_api_call.dart';
import 'package:data/source/services_datasource.dart';
import 'package:domain/error/network_error.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:domain/model/get_modules_response/generate_loans_response.dart';
import 'package:domain/model/get_modules_response/get_only_created_borrowers_response.dart';
import 'package:domain/model/get_modules_response/get_teams_response.dart';
import 'package:domain/model/get_modules_response/recovery_history_response.dart';
import 'package:domain/model/get_modules_response/users_response.dart';
import 'package:domain/model/services/address_master_response.dart';
import 'package:domain/model/services/get_caders_response.dart';
import 'package:domain/model/services/get_gender_list_response.dart';
import 'package:domain/model/services/get_team_mapper_response.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/services/address_master_usecase.dart';
import 'package:domain/usecase/services/borrowers_usecase.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:domain/usecase/services/generate_loans_usecase.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:domain/usecase/services/get_only_created_borrowers_usecase.dart';
import 'package:domain/usecase/services/get_teams_mapper_usecase.dart';
import 'package:domain/usecase/services/get_teams_usecase.dart';
import 'package:domain/usecase/services/recovery_history_usecase.dart';
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

  @override
  Future<Either<NetworkError, BorrowersResponse>> getBorrowersList(
    {required BorrowersUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.getBorrowersList(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }

  @override
  Future<Either<NetworkError, GetTeamMapperResponse>> getTeamMapper(
    {required GetTeamMapperUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.getTeamMapper(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }

  @override
  Future<Either<NetworkError, GetTeamsResponse>> getTeams(
    {required GetTeamsUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.getTeams(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }

  @override
  Future<Either<NetworkError, AddressMasterResponse>> getAddressMaster(
    {required AddressMasterUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.getAddressMaster(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }

    @override
  Future<Either<NetworkError, GenerateLoansResponse>> generateLoans(
    {required GenerateLoansUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.generateLoans(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }

    @override
  Future<Either<NetworkError, GetOnlyCreatedBorrowersResponse>> getOnlyCreatedBorrowers(
    {required GetOnlyCreatedBorrowersUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.getOnlyCreatedBorrowers(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }

    @override
  Future<Either<NetworkError, RecoveryHistoryResponse>> getRecoveryHistory(
    {required RecoveryHistoryUseCaseParams params}) async {
    final response = await safeApiCall(_remoteDS.getRecoveryHistory(params: params));

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }
}
