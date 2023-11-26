import 'dart:convert';
import 'package:data/entity/services/response/branches_response_entity.dart';
import 'package:data/entity/services/response/companies_list_response_entity.dart';
import 'package:data/entity/services/response/get_caders_response_entity.dart';
import 'package:data/entity/services/response/get_gender_list_response_entity.dart';
import 'package:data/entity/services/response/users_list_response_entity.dart';
import 'package:data/entity/user/request/common_request_entity.dart';
import 'package:data/network/api_service.dart';
import 'package:data/source/services_datasource.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:domain/usecase/services/users_usecase.dart';
import 'package:retrofit/dio.dart';

class ServicesRemoteDSImpl extends ServicesRemoteDataSource {
  final ApiService _apiService;

  ServicesRemoteDSImpl(this._apiService);

  @override
  Future<HttpResponse<GetCadersResponseEntity>> getCaders(
      {required GetCadersUseCaseParams params}) async {
    String secure = base64.encode(params.secure.codeUnits);

    return await _apiService.getCaders(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<GetGenderListResponseEntity>> getGenderList(
      {required GetGenderListUseCaseParams params}) async {
    String secure = base64.encode(params.secure.codeUnits);

    return await _apiService.getGenderList(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<BranchesResponseEntity>> getBranchesList(
      {required BranchesUseCaseParams params}) async {
    String secure = base64.encode(params.secure.codeUnits);

    return await _apiService.getBranchesList(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

    @override
  Future<HttpResponse<CompaniesListResponseEntity>> getCompaniesList(
      {required CompaniesUseCaseParams params}) async {
    String secure = base64.encode(params.secure.codeUnits);

    return await _apiService.getCompaniesList(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

      @override
  Future<HttpResponse<UsersListResponseEntity>> getUsersList(
      {required UsersUseCaseParams params}) async {
    String secure = base64.encode(params.secure.codeUnits);

    return await _apiService.getUsersList(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }
}
