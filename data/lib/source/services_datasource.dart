import 'package:data/entity/remote/response/users_entity/users_response_entity.dart';
import 'package:data/entity/services/response/get_caders_response_entity.dart';
import 'package:data/entity/services/response/get_gender_list_response_entity.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:retrofit/dio.dart';

abstract class ServicesRemoteDataSource {
  Future<HttpResponse<UserDataEntity>> getUsers();

  Future<HttpResponse<GetCadersResponseEntity>> getCaders(
      {required GetCadersUseCaseParams params});

  Future<HttpResponse<GetGenderListResponseEntity>> getGenderList(
      {required GetGenderListUseCaseParams params});
}
