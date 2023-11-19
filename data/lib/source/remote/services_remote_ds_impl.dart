import 'package:data/entity/remote/response/users_entity/users_response_entity.dart';
import 'package:data/network/api_service.dart';
import 'package:data/source/services_datasource.dart';
import 'package:retrofit/dio.dart';

class ServicesRemoteDSImpl extends ServicesRemoteDataSource {
  final ApiService _apiService;

  ServicesRemoteDSImpl(this._apiService);

  @override
  Future<HttpResponse<UserDataEntity>> getUsers() async {
    return await _apiService.getUsers();
  }
}
