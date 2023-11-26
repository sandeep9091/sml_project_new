import 'dart:convert';

import 'package:data/entity/user/request/common_request_entity.dart';
import 'package:data/entity/user/response/common_response_entity.dart';
import 'package:data/entity/user/response/getModules_response_entity.dart';
import 'package:data/entity/user/response/login_response_entity.dart';
import 'package:data/network/api_service.dart';
import 'package:data/source/user_datasource.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/common_usecase/get_modules_usecase.dart';
import 'package:domain/usecase/common_usecase/login_usecase.dart';
import 'package:retrofit/dio.dart';

class UserRemoteDSImpl extends UserRemoteDataSource {
  final ApiService _apiService;

  UserRemoteDSImpl(this._apiService);

  @override
  Future<HttpResponse<LoginResponseEntity>> login(
      {required LoginUseCaseParams params}) async {
    String secure = base64.encode(params.secure.codeUnits);

    return await _apiService.login(
      CommonRequestEntity(
        secure: secure //"eyJmbGFnIjoiUyIsInVuYW1lIjoic2EiLCJwYXNzd29yZCI6InNhIn0="
      ),
    );
  }

  @override
  Future<HttpResponse<GetModulesResponseEntity>> getModules(
      {required GetModulesUseCaseParams params}) async {
    String secure = base64.encode(params.secure.codeUnits);

    return await _apiService.getModules(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

  @override
  Future<HttpResponse<CommonResponseEntity>> saveFormData(
      {required CommonUseCaseParams params}) async {
    String secure = base64.encode(params.secure.codeUnits);

    return await _apiService.saveFormData(
      CommonRequestEntity(
        secure: secure
      ),
    );
  }

}