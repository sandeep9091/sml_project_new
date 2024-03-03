import 'package:dartz/dartz.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:domain/model/get_modules_response/get_teams_response.dart';
import 'package:domain/model/get_modules_response/users_response.dart';
import 'package:domain/model/services/address_master_response.dart';
import 'package:domain/model/services/get_caders_response.dart';
import 'package:domain/model/services/get_gender_list_response.dart';
import 'package:domain/model/services/get_team_mapper_response.dart';
import 'package:domain/usecase/services/address_master_usecase.dart';
import 'package:domain/usecase/services/borrowers_usecase.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:domain/usecase/services/get_teams_mapper_usecase.dart';
import 'package:domain/usecase/services/get_teams_usecase.dart';
import 'package:domain/usecase/services/users_usecase.dart';

import '../../model/get_modules_response/generate_loans_response.dart';
import '../../model/get_modules_response/get_only_created_borrowers_response.dart';
import '../../model/get_modules_response/recovery_history_response.dart';
import '../../usecase/services/generate_loans_usecase.dart';
import '../../usecase/services/get_only_created_borrowers_usecase.dart';
import '../../usecase/services/recovery_history_usecase.dart';

abstract class ServicesRepository {

  Future<Either<NetworkError, GetCadersResponse>> getCaders(
      {required GetCadersUseCaseParams params});

  Future<Either<NetworkError, GetGenderListResponse>> getGenderList(
      {required GetGenderListUseCaseParams params});

  Future<Either<NetworkError, BranchesResponse>> getBranchesList(
      {required BranchesUseCaseParams params});

  Future<Either<NetworkError, CompaniesListResponse>> getCompaniesList(
      {required CompaniesUseCaseParams params});

  Future<Either<NetworkError, UsersListResponse>> getUsersList(
      {required UsersUseCaseParams params});

  Future<Either<NetworkError, BorrowersResponse>> getBorrowersList(
      {required BorrowersUseCaseParams params});

  Future<Either<NetworkError, GetTeamMapperResponse>> getTeamMapper(
      {required GetTeamMapperUseCaseParams params});

  Future<Either<NetworkError, GetTeamsResponse>> getTeams(
      {required GetTeamsUseCaseParams params});

  Future<Either<NetworkError, AddressMasterResponse>> getAddressMaster(
    {required AddressMasterUseCaseParams params});

  Future<Either<NetworkError, GenerateLoansResponse>> generateLoans(
    {required GenerateLoansUseCaseParams params});

  Future<Either<NetworkError, GetOnlyCreatedBorrowersResponse>> getOnlyCreatedBorrowers(
    {required GetOnlyCreatedBorrowersUseCaseParams params});

  Future<Either<NetworkError, RecoveryHistoryResponse>> getRecoveryHistory(
    {required RecoveryHistoryUseCaseParams params});
}
