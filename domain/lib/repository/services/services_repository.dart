import 'package:dartz/dartz.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/services/get_caders_response.dart';
import 'package:domain/model/services/get_gender_list_response.dart';
import 'package:domain/model/user_response/user_response.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';

abstract class ServicesRepository {
  Future<Either<NetworkError, UserData>> getUsers();

  Future<Either<NetworkError, GetCadersResponse>> getCaders(
      {required GetCadersUseCaseParams params});

  Future<Either<NetworkError, GetGenderListResponse>> getGenderList(
      {required GetGenderListUseCaseParams params});
}
