import 'package:dartz/dartz.dart';
import 'package:data/network/utils/safe_api_call.dart';
import 'package:data/source/user_datasource.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:domain/usecase/login_usecase/login_usecase.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _remoteDS;

  UserRepositoryImpl(this._remoteDS);

    @override
  Future<Either<NetworkError, LoginResponse>> login(
      {required LoginUseCaseParams params}) async {
    final loginResponse = await safeApiCall(_remoteDS.login(params: params));

    return loginResponse!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }
}