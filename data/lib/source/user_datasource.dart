import 'package:data/entity/user/response/common_response_entity.dart';
import 'package:data/entity/user/response/getModules_response_entity.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/common_usecase/get_modules_usecase.dart';
import 'package:domain/usecase/common_usecase/login_usecase.dart';
import 'package:retrofit/dio.dart';
import 'package:data/entity/user/response/login_response_entity.dart';

abstract class UserRemoteDataSource {
  
  Future<HttpResponse<LoginResponseEntity>> login(
      {required LoginUseCaseParams params});
  
  Future<HttpResponse<GetModulesResponseEntity>> getModules(
      {required GetModulesUseCaseParams params});

  Future<HttpResponse<CommonResponseEntity>> saveFormData(
      {required CommonUseCaseParams params});

}