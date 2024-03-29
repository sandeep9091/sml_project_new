import 'package:data/entity/services/response/address_master_response_entity.dart';
import 'package:data/entity/services/response/borrowers_response_entity.dart';
import 'package:data/entity/services/response/branches_response_entity.dart';
import 'package:data/entity/services/response/companies_list_response_entity.dart';
import 'package:data/entity/services/response/get_caders_response_entity.dart';
import 'package:data/entity/services/response/get_gender_list_response_entity.dart';
import 'package:data/entity/services/response/get_team_mapper_response_entity.dart';
import 'package:data/entity/services/response/get_teams_response_entity.dart';
import 'package:data/entity/services/response/users_list_response_entity.dart';
import 'package:data/entity/user/response/common_response_entity.dart';
import 'package:data/entity/user/response/getDashboard_response_entity.dart';
import 'package:data/entity/user/response/getModulesNew_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entity/services/response/generate_loans_response_entity.dart';
import '../entity/services/response/get_only_created_borrowers_response_entity.dart';
import '../entity/services/response/recover_history_response_entity.dart';
import '../entity/user/request/common_request_entity.dart';
import '../entity/user/response/getModules_response_entity.dart';
import '../entity/user/response/login_response_entity.dart';

part 'api_service.g.dart';

//flutter pub run build_runner build
@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {required String baseUrl}) = _ApiService;

  /// login with username and password
  @POST("/smlsignin")
  Future<HttpResponse<LoginResponseEntity>> login(
      @Body() CommonRequestEntity commonRequestEntity);

  /// get Dashboard Data
  @POST("/get-dasboard")
  Future<HttpResponse<GetDashboardResponseEntity>> getDashboardData(
      @Body() CommonRequestEntity commonRequestEntity);
  
  /// get modules
  @POST("/get-moduleslist")
  Future<HttpResponse<GetModulesResponseEntity>> getModules(
      @Body() CommonRequestEntity commonRequestEntity);

  /// get modules
  @POST("/onlypages")
  Future<HttpResponse<GetModulesNewResponseEntity>> getModulesNew(
      @Body() CommonRequestEntity commonRequestEntity);

  /// get Caders
  @POST("/post-get-caders")
  Future<HttpResponse<GetCadersResponseEntity>> getCaders(
      @Body() CommonRequestEntity commonRequestEntity);

  /// get Gender List
  @POST("/genderlist")
  Future<HttpResponse<GetGenderListResponseEntity>> getGenderList(
      @Body() CommonRequestEntity commonRequestEntity);

  /// get Branches
  @POST("/branchlist")
  Future<HttpResponse<BranchesResponseEntity>> getBranchesList(
      @Body() CommonRequestEntity branchesRequestEntity);

  /// get Companies List
  @POST("/companylist")
  Future<HttpResponse<CompaniesListResponseEntity>> getCompaniesList(
      @Body() CommonRequestEntity companiesListRequestEntity);

  /// get Users List
  @POST("/smlGetUsers")
  Future<HttpResponse<UsersListResponseEntity>> getUsersList(
      @Body() CommonRequestEntity usersListRequestEntity);

  /// save Users Data
  @POST("/smlcreateuser")
  Future<HttpResponse<CommonResponseEntity>> saveFormData(
      @Body() CommonRequestEntity createUserRequestEntity);

  /// get Borrowers
  @POST("/borrowerlist")
  Future<HttpResponse<BorrowersResponseEntity>> getBorrowersList(
      @Body() CommonRequestEntity borrowersRequestEntity);

    /// save Forms Data
  @POST("{endPointUrl}")
  Future<HttpResponse<CommonResponseEntity>> saveFormsData(
      @Path("endPointUrl") endPointUrl,
      @Body() CommonRequestEntity createUserRequestEntity);

  /// get Team mapper
  @POST("/teammapper")
  Future<HttpResponse<GetTeamMapperResponseEntity>> getTeamMapper(
      @Body() CommonRequestEntity getTeamMapperRequestEntity);

  /// get Teams
  @POST("/getteams")
  Future<HttpResponse<GetTeamsResponseEntity>> getTeams(
      @Body() CommonRequestEntity getTeamsRequestEntity);

  /// Address Masters
  @POST("/addressmasters")
  Future<HttpResponse<AddressMasterResponseEntity>> getAddressMaster(
      @Body() CommonRequestEntity getTeamsRequestEntity);

  /// get loans list
  @POST("/gnloanslist")
  Future<HttpResponse<GenerateLoansResponseEntity>> generateLoans(
      @Body() CommonRequestEntity generateLoansRequestEntity);

  /// get Only Created Borrowers
  @POST("/getOnlyCreatedBorrowers")
  Future<HttpResponse<GetOnlyCreatedBorrowersResponseEntity>> getOnlyCreatedBorrowers(
      @Body() CommonRequestEntity getOnlyCreatedBorrowersRequestEntity);

  /// get history payments
  @POST("/historypayments")
  Future<HttpResponse<RecoveryHistoryResponseEntity>> getRecoveryHistory(
      @Body() CommonRequestEntity getRecoveryHistoryRequestEntity);
}
