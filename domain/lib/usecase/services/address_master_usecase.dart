import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/services/address_master_response.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

class AddressMasterUseCase
    extends BaseUseCase<NetworkError, AddressMasterUseCaseParams, AddressMasterResponse> {
  final ServicesRepository _repository;

  AddressMasterUseCase(this._repository);

  @override
  Future<Either<NetworkError, AddressMasterResponse>> execute(
      {required AddressMasterUseCaseParams params}) {
    return _repository.getAddressMaster(params: params);
  }
}

class AddressMasterUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  AddressMasterUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}