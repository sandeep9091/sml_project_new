import 'package:dartz/dartz.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:domain/model/get_modules_response/users_response.dart';
import 'package:domain/model/services/get_caders_response.dart';
import 'package:domain/model/services/get_gender_list_response.dart';
import 'package:domain/usecase/services/borrowers_usecase.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:domain/usecase/services/users_usecase.dart';

abstract class ServicesRepository {

  Future<Either<NetworkError, GetCadersResponse>> getCaders(
      {required GetCadersUseCaseParams params});

  Future<Either<NetworkError, GetGenderListResponse>> getGenderList(
      {required GetGenderListUseCaseParams params});

  Future<Either<NetworkError, BranchesResponse>> getBranchesList(
      {required BranchesUseCaseParams params});

  Future<Either<NetworkError, CompaniesListResponse>> getCompaniesList(
      {required CompaniesUseCaseParams params});

  Future<Either<NetworkError, UsersListResponse>> getUsersList(
      {required UsersUseCaseParams params});

  Future<Either<NetworkError, BorrowersResponse>> getBorrowersList(
      {required BorrowersUseCaseParams params});
}
