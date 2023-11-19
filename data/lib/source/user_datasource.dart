import 'package:retrofit/dio.dart';
import 'package:data/entity/user/response/login_response_entity.dart';
import 'package:domain/usecase/login_usecase/login_usecase.dart';

abstract class UserRemoteDataSource {
  
  Future<HttpResponse<LoginResponseEntity>> login(
      {required LoginUseCaseParams params});

}