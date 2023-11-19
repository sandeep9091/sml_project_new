import 'package:data/network/utils/safe_api_call.dart';
import 'package:data/source/services_datasource.dart';
import 'package:domain/error/network_error.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/model/user_response/user_response.dart';
import 'package:domain/repository/services/services_repository.dart';

class ServicesRepositoryImpl extends ServicesRepository {
  final ServicesRemoteDataSource _remoteDS;

  ServicesRepositoryImpl(this._remoteDS);

  @override
  Future<Either<NetworkError, UserData>> getUsers() async {
    final response = await safeApiCall(_remoteDS.getUsers());

    return response!.fold(
      (l) => Left(l),
      (r) {
        return Right(r.data.transform());
      },
    );
  }
}
