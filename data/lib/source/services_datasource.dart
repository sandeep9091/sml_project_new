
import 'package:data/entity/services/response/address_master_response_entity.dart';
import 'package:data/entity/services/response/borrowers_response_entity.dart';
import 'package:data/entity/services/response/branches_response_entity.dart';
import 'package:data/entity/services/response/companies_list_response_entity.dart';
import 'package:data/entity/services/response/get_caders_response_entity.dart';
import 'package:data/entity/services/response/get_gender_list_response_entity.dart';
import 'package:data/entity/services/response/get_team_mapper_response_entity.dart';
import 'package:data/entity/services/response/get_teams_response_entity.dart';
import 'package:data/entity/services/response/users_list_response_entity.dart';
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
import 'package:retrofit/dio.dart';

import '../entity/services/response/generate_loans_response_entity.dart';
import '../entity/services/response/get_only_created_borrowers_response_entity.dart';
import '../entity/services/response/recover_history_response_entity.dart';

abstract class ServicesRemoteDataSource {

  Future<HttpResponse<GetCadersResponseEntity>> getCaders(
      {required GetCadersUseCaseParams params});

  Future<HttpResponse<GetGenderListResponseEntity>> getGenderList(
      {required GetGenderListUseCaseParams params});

  Future<HttpResponse<BranchesResponseEntity>> getBranchesList(
      {required BranchesUseCaseParams params});

  Future<HttpResponse<CompaniesListResponseEntity>> getCompaniesList(
      {required CompaniesUseCaseParams params});

  Future<HttpResponse<UsersListResponseEntity>> getUsersList(
      {required UsersUseCaseParams params});

    Future<HttpResponse<BorrowersResponseEntity>> getBorrowersList(
      {required BorrowersUseCaseParams params});

  Future<HttpResponse<GetTeamMapperResponseEntity>> getTeamMapper(
      {required GetTeamMapperUseCaseParams params});

  Future<HttpResponse<GetTeamsResponseEntity>> getTeams(
    {required GetTeamsUseCaseParams params});

  Future<HttpResponse<AddressMasterResponseEntity>> getAddressMaster(
    {required AddressMasterUseCaseParams params});

  Future<HttpResponse<GenerateLoansResponseEntity>> generateLoans(
    {required GenerateLoansUseCaseParams params});

  Future<HttpResponse<GetOnlyCreatedBorrowersResponseEntity>> getOnlyCreatedBorrowers(
    {required GetOnlyCreatedBorrowersUseCaseParams params});

  Future<HttpResponse<RecoveryHistoryResponseEntity>> getRecoveryHistory(
    {required RecoveryHistoryUseCaseParams params});
}
