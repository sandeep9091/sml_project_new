import 'package:data/entity/remote/response/users_entity/users_response_entity.dart';
import 'package:data/entity/services/response/get_caders_response_entity.dart';
import 'package:data/entity/services/response/get_gender_list_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

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
  
  /// get modules
  @POST("/get-moduleslist")
  Future<HttpResponse<GetModulesResponseEntity>> getModules(
      @Body() CommonRequestEntity commonRequestEntity);

  /// get Caders
  @POST("/post-get-caders")
  Future<HttpResponse<GetCadersResponseEntity>> getCaders(
      @Body() CommonRequestEntity commonRequestEntity);

  /// get Gender List
  @POST("/genderlist")
  Future<HttpResponse<GetGenderListResponseEntity>> getGenderList(
      @Body() CommonRequestEntity commonRequestEntity);

  @GET('/api/users')
  Future<HttpResponse<UserDataEntity>> getUsers();
}
