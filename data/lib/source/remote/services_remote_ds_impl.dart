import 'dart:convert';
import 'package:data/entity/services/response/address_master_response_entity.dart';
import 'package:data/entity/services/response/borrowers_response_entity.dart';
import 'package:data/entity/services/response/branches_response_entity.dart';
import 'package:data/entity/services/response/companies_list_response_entity.dart';
import 'package:data/entity/services/response/get_caders_response_entity.dart';
import 'package:data/entity/services/response/get_gender_list_response_entity.dart';
import 'package:data/entity/services/response/get_team_mapper_response_entity.dart';
import 'package:data/entity/services/response/get_teams_response_entity.dart';
import 'package:data/entity/services/response/users_list_response_entity.dart';
import 'package:data/entity/user/request/common_request_entity.dart';
import 'package:data/network/api_service.dart';
import 'package:data/source/services_datasource.dart';
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

import '../../entity/services/response/generate_loans_response_entity.dart';
import '../../entity/services/response/get_only_created_borrowers_response_entity.dart';
import '../../entity/services/response/recover_history_response_entity.dart';

class ServicesRemoteDSImpl extends ServicesRemoteDataSource {
  final ApiService _apiService;

  ServicesRemoteDSImpl(this._apiService);

  @override
  Future<HttpResponse<GetCadersResponseEntity>> getCaders(
      {required GetCadersUseCaseParams params}) async {
    //String secure = base64.encode(params.secure.codeUnits);
    Map<String,dynamic> secure = params.secure;

    return await _apiService.getCaders(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<GetGenderListResponseEntity>> getGenderList(
      {required GetGenderListUseCaseParams params}) async {
    // String secure = base64.encode(params.secure.codeUnits);
    Map<String,dynamic> secure = params.secure;

    return await _apiService.getGenderList(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<BranchesResponseEntity>> getBranchesList(
      {required BranchesUseCaseParams params}) async {
    // String secure = base64.encode(params.secure.codeUnits);
    Map<String,dynamic> secure = params.secure;

    return await _apiService.getBranchesList(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

    @override
  Future<HttpResponse<CompaniesListResponseEntity>> getCompaniesList(
      {required CompaniesUseCaseParams params}) async {
    // String secure = base64.encode(params.secure.codeUnits);
    Map<String,dynamic> secure = params.secure;

    return await _apiService.getCompaniesList(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

      @override
  Future<HttpResponse<UsersListResponseEntity>> getUsersList(
      {required UsersUseCaseParams params}) async {
    Map<String,dynamic> secure = params.secure;

    return await _apiService.getUsersList(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<BorrowersResponseEntity>> getBorrowersList(
      {required BorrowersUseCaseParams params}) async {
    Map<String,dynamic> secure = params.secure;

    return await _apiService.getBorrowersList(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<GetTeamMapperResponseEntity>> getTeamMapper(
      {required GetTeamMapperUseCaseParams params}) async {
    Map<String,dynamic> secure = params.secure;

    return await _apiService.getTeamMapper(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<GetTeamsResponseEntity>> getTeams(
      {required GetTeamsUseCaseParams params}) async {
    Map<String,dynamic> secure = params.secure;

    return await _apiService.getTeams(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<AddressMasterResponseEntity>> getAddressMaster(
      {required AddressMasterUseCaseParams params}) async {
    Map<String,dynamic> secure = params.secure;

    return await _apiService.getAddressMaster(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<GenerateLoansResponseEntity>> generateLoans(
      {required GenerateLoansUseCaseParams params}) async {
    Map<String,dynamic> secure = params.secure;

    return await _apiService.generateLoans(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<GetOnlyCreatedBorrowersResponseEntity>> getOnlyCreatedBorrowers(
      {required GetOnlyCreatedBorrowersUseCaseParams params}) async {
    Map<String,dynamic> secure = params.secure;

    return await _apiService.getOnlyCreatedBorrowers(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<RecoveryHistoryResponseEntity>> getRecoveryHistory(
      {required RecoveryHistoryUseCaseParams params}) async {
    Map<String,dynamic> secure = params.secure;

    return await _apiService.getRecoveryHistory(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }
}
