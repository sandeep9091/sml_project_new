
import 'package:data/di/repository_module.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/common_usecase/get_modules_usecase.dart';
import 'package:domain/usecase/common_usecase/login_usecase.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:domain/usecase/services/users_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUseCaseProvider = Provider.autoDispose<LoginUseCase>(
  (ref) => LoginUseCase(ref.read(userRepositoryProvider)),
);

final getModulesUseCaseProvider = Provider<GetModulesUseCase>(
  (ref) => GetModulesUseCase(ref.read(userRepositoryProvider)),
);

final getGenderListUseCaseProvider = Provider<GetGenderListUseCase>(
  (ref) => GetGenderListUseCase(ref.read(servicesRepositoryProvider)),
);

final getCadersUseCaseProvider = Provider<GetCadersUseCase>(
  (ref) => GetCadersUseCase(ref.read(servicesRepositoryProvider)),
);

final branchesUseCaseProvider = Provider<BranchesUseCase>(
  (ref) => BranchesUseCase(ref.read(servicesRepositoryProvider)),
);

final companiesUseCaseProvider = Provider<CompaniesUseCase>(
  (ref) => CompaniesUseCase(ref.read(servicesRepositoryProvider)),
);

final usersUseCaseProvider = Provider<UsersUseCase>(
  (ref) => UsersUseCase(ref.read(servicesRepositoryProvider)),
);

final commonUseCaseProvider = Provider<CommonUseCase>(
  (ref) => CommonUseCase(ref.read(userRepositoryProvider)),
);

