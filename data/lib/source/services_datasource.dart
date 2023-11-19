import 'package:data/entity/remote/response/users_entity/users_response_entity.dart';
import 'package:retrofit/dio.dart';

abstract class ServicesRemoteDataSource {
  Future<HttpResponse<UserDataEntity>> getUsers();
}
