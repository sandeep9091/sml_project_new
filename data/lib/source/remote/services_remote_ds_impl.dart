import 'dart:convert';

import 'package:data/entity/remote/response/users_entity/users_response_entity.dart';
import 'package:data/entity/services/response/get_caders_response_entity.dart';
import 'package:data/entity/services/response/get_gender_list_response_entity.dart';
import 'package:data/entity/user/request/common_request_entity.dart';
import 'package:data/network/api_service.dart';
import 'package:data/source/services_datasource.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:retrofit/dio.dart';

class ServicesRemoteDSImpl extends ServicesRemoteDataSource {
  final ApiService _apiService;

  ServicesRemoteDSImpl(this._apiService);

  @override
  Future<HttpResponse<UserDataEntity>> getUsers() async {
    return await _apiService.getUsers();
  }

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
}
