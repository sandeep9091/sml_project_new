
import 'package:data/entity/services/response/branches_response_entity.dart';
import 'package:data/entity/services/response/companies_list_response_entity.dart';
import 'package:data/entity/services/response/get_caders_response_entity.dart';
import 'package:data/entity/services/response/get_gender_list_response_entity.dart';
import 'package:data/entity/services/response/users_list_response_entity.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:domain/usecase/services/users_usecase.dart';
import 'package:retrofit/dio.dart';

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
}
