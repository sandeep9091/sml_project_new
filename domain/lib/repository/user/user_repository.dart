

import 'package:dartz/dartz.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/usecase/login_usecase/login_usecase.dart';

abstract class UserRepository{
  Future<Either<NetworkError, LoginResponse>> login(
      {required LoginUseCaseParams params});
}