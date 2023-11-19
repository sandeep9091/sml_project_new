import 'package:data/entity/remote/response/users_entity/users_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entity/user/request/login_request_entity.dart';
import '../entity/user/response/login_response_entity.dart';

part 'api_service.g.dart';

//flutter pub run build_runner build
@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {required String baseUrl}) = _ApiService;

  /// login with username and password
  @POST("/smlsignin")
  Future<HttpResponse<LoginResponseEntity>> login(
      @Body() LoginRequestEntity loginRequestEntity);

  @GET('/api/users')
  Future<HttpResponse<UserDataEntity>> getUsers();
}
