
import 'package:data/di/repository_module.dart';
import 'package:domain/usecase/common_usecase/common_forms_usecase.dart';
import 'package:domain/usecase/common_usecase/get_dashboard_usecase.dart';
import 'package:domain/usecase/common_usecase/get_modules_new_usecase.dart';
import 'package:domain/usecase/common_usecase/get_modules_usecase.dart';
import 'package:domain/usecase/common_usecase/login_usecase.dart';
import 'package:domain/usecase/services/address_master_usecase.dart';
import 'package:domain/usecase/services/borrowers_usecase.dart';
import 'package:domain/usecase/services/branches_usecase.dart';
import 'package:domain/usecase/services/companies_usecase.dart';
import 'package:domain/usecase/services/generate_loans_usecase.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
import 'package:domain/usecase/services/get_teams_mapper_usecase.dart';
import 'package:domain/usecase/services/get_teams_usecase.dart';
import 'package:domain/usecase/services/recovery_history_usecase.dart';
import 'package:domain/usecase/services/users_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUseCaseProvider = Provider.autoDispose<LoginUseCase>(
  (ref) => LoginUseCase(ref.read(userRepositoryProvider)),
);

final getDashboardUseCaseProvider = Provider<GetDashboardUseCase>(
  (ref) => GetDashboardUseCase(ref.read(userRepositoryProvider)),
);

final getModulesUseCaseProvider = Provider<GetModulesUseCase>(
  (ref) => GetModulesUseCase(ref.read(userRepositoryProvider)),
);

final getModulesNewUseCaseProvider = Provider<GetModulesNewUseCase>(
  (ref) => GetModulesNewUseCase(ref.read(userRepositoryProvider)),
);

final commonUseCaseProvider = Provider<CommonUseCase>(
  (ref) => CommonUseCase(ref.read(userRepositoryProvider)),
);

final getGenderListUseCaseProvider = Provider<GetGenderListUseCase>(
  (ref) => GetGenderListUseCase(ref.read(servicesRepositoryProvider)),
);

final getCadersUseCaseProvider = Provider<GetCadersUseCase>(
  (ref) => GetCadersUseCase(ref.read(servicesRepositoryProvider)),
);

final addressMasterUseCaseProvider = Provider<AddressMasterUseCase>(
  (ref) => AddressMasterUseCase(ref.read(servicesRepositoryProvider)),
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

final borrowersUseCaseProvider = Provider<BorrowersUseCase>(
  (ref) => BorrowersUseCase(ref.read(servicesRepositoryProvider)),
);

final getTeamMapperUseCaseProvider = Provider<GetTeamMapperUseCase>(
  (ref) => GetTeamMapperUseCase(ref.read(servicesRepositoryProvider)),
);

final getTeamsUseCaseProvider = Provider<GetTeamsUseCase>(
  (ref) => GetTeamsUseCase(ref.read(servicesRepositoryProvider)),
);

final generateLoansUseCaseProvider = Provider<GenerateLoansUseCase>(
  (ref) => GenerateLoansUseCase(ref.read(servicesRepositoryProvider)),
);

final recoveryHistoryUseCaseProvider = Provider<RecoveryHistoryUseCase>(
  (ref) => RecoveryHistoryUseCase(ref.read(servicesRepositoryProvider)),
);

