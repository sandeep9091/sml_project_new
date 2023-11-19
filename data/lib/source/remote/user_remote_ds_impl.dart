import 'dart:convert';

import 'package:data/entity/user/request/login_request_entity.dart';
import 'package:data/entity/user/response/login_response_entity.dart';
import 'package:data/network/api_service.dart';
import 'package:data/source/user_datasource.dart';
import 'package:domain/usecase/login_usecase/login_usecase.dart';
import 'package:retrofit/dio.dart';

class UserRemoteDSImpl extends UserRemoteDataSource {
  final ApiService _apiService;

  UserRemoteDSImpl(this._apiService);

    @override
  Future<HttpResponse<LoginResponseEntity>> login(
      {required LoginUseCaseParams params}) async {
    String secure = base64.encode(params.secure.codeUnits);

    return await _apiService.login(
      LoginRequestEntity(
        secure: secure //"eyJmbGFnIjoiUyIsInVuYW1lIjoic2EiLCJwYXNzd29yZCI6InNhIn0="
      ),
    );
  }

}