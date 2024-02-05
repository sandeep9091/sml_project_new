import 'package:dartz/dartz.dart';
import 'package:domain/error/app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/services/get_gender_list_response.dart';
import 'package:domain/repository/services/services_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';

class GetGenderListUseCase
    extends BaseUseCase<NetworkError, GetGenderListUseCaseParams, GetGenderListResponse> {
  final ServicesRepository _repository;

  GetGenderListUseCase(this._repository);

  @override
  Future<Either<NetworkError, GetGenderListResponse>> execute(
      {required GetGenderListUseCaseParams params}) {
    return _repository.getGenderList(params: params);
  }
}

class GetGenderListUseCaseParams extends Params {
  final Map<String,dynamic> secure;
  GetGenderListUseCaseParams({required this.secure});

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}