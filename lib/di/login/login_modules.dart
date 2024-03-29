import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/di/notifier/get_modules_notifier.dart';
import 'package:spoorthymactcs/modules/borrowers/borrowers_page_view_model.dart';
import 'package:spoorthymactcs/modules/branches/branches_page_view_model.dart';
import 'package:spoorthymactcs/modules/companies/companies_page_view_model.dart';
import 'package:spoorthymactcs/modules/create_team/create_team_page_view_model.dart';
import 'package:spoorthymactcs/modules/users/users_page_view_model.dart';

import '../../modules/dashboard/dashboard_page_view_model.dart';
import '../../modules/disbursements/disbursements_page_view_model.dart';
import '../../modules/generate_loans/generate_loans_page_view_model.dart';
import '../../modules/loan_approvals/loan_approvals_page_view_model.dart';
import '../../modules/login/login_page_view_model.dart';
import '../../modules/recovery/recovery_page_view_model.dart';
import '../usecase/user_usecase.dart';


final loginViewModelProvider =
    ChangeNotifierProvider.autoDispose<LoginPageViewModel>(
  (ref) => LoginPageViewModel(
    ref.read(loginUseCaseProvider),
  ),
);

final dashboardViewModelProvider =
    ChangeNotifierProvider.autoDispose<DashboardPageViewModel>(
  (ref) => DashboardPageViewModel(
    ref.read(getDashboardUseCaseProvider),
    ref.read(getModulesUseCaseProvider),
    ref.read(getModulesNewUseCaseProvider),
    ref.read(getGenderListUseCaseProvider),
    ref.read(getCadersUseCaseProvider),
    ref.read(addressMasterUseCaseProvider),
    ref.read(usersUseCaseProvider),
    ref
  ),
);

final branchesViewModelProvider =
    ChangeNotifierProvider.autoDispose<BranchesPageViewModel>(
  (ref) => BranchesPageViewModel(
    ref.read(branchesUseCaseProvider),
    ref.read(companiesUseCaseProvider),
    ref.read(commonUseCaseProvider)
  ),
);

final companiesViewModelProvider =
    ChangeNotifierProvider.autoDispose<CompaniesPageViewModel>(
  (ref) => CompaniesPageViewModel(
    ref.read(companiesUseCaseProvider),
    ref.read(commonUseCaseProvider)
  ),
);

final usersViewModelProvider =
    ChangeNotifierProvider.autoDispose<UsersPageViewModel>(
  (ref) => UsersPageViewModel(
    ref.read(usersUseCaseProvider),
    ref.read(commonUseCaseProvider)
  ),
);

final borrowersViewModelProvider =
    ChangeNotifierProvider.autoDispose<BorrowersPageViewModel>(
  (ref) => BorrowersPageViewModel(
    ref.read(branchesUseCaseProvider),
    ref.read(borrowersUseCaseProvider),
    ref.read(commonUseCaseProvider)
  ),
);

final createTeamViewModelProvider =
    ChangeNotifierProvider.autoDispose<CreateTeamPageViewModel>(
  (ref) => CreateTeamPageViewModel(
    ref.read(branchesUseCaseProvider),
    ref.read(getTeamMapperUseCaseProvider),
    ref.read(getTeamsUseCaseProvider),
    ref.read(commonUseCaseProvider)
  ),
);

final generateLoansViewModelProvider =
    ChangeNotifierProvider.autoDispose<GenerateLoansPageViewModel>(
  (ref) => GenerateLoansPageViewModel(
    ref.read(generateLoansUseCaseProvider),
    ref.read(getTeamMapperUseCaseProvider),
    ref.read(getTeamsUseCaseProvider),
    ref.read(commonUseCaseProvider),
    ref.read(borrowersUseCaseProvider),
    ref.read(branchesUseCaseProvider)
  ),
);

final loanApprovalsViewModelProvider =
    ChangeNotifierProvider.autoDispose<LoanApprovalsPageViewModel>(
  (ref) => LoanApprovalsPageViewModel(
    ref.read(generateLoansUseCaseProvider),
    ref.read(commonUseCaseProvider),
    ref.read(borrowersUseCaseProvider)
  ),
);

final disbursementsViewModelProvider =
    ChangeNotifierProvider.autoDispose<DisbursementsPageViewModel>(
  (ref) => DisbursementsPageViewModel(
    ref.read(generateLoansUseCaseProvider),
    ref.read(commonUseCaseProvider),
    ref.read(borrowersUseCaseProvider)
  ),
);

final recoveryViewModelProvider =
    ChangeNotifierProvider.autoDispose<RecoveryPageViewModel>(
  (ref) => RecoveryPageViewModel(
    ref.read(generateLoansUseCaseProvider),
    ref.read(commonUseCaseProvider),
    ref.read(recoveryHistoryUseCaseProvider)
  ),
);
