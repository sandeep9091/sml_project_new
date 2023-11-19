import 'package:dartz/dartz.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/user_response/user_response.dart';

abstract class ServicesRepository {
  Future<Either<NetworkError, UserData>> getUsers();
}
