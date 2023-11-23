import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../modules/dashboard/dashboard_page_view_model.dart';
import '../../modules/login/login_page_view_model.dart';
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
    ref.read(getModulesUseCaseProvider),
    ref.read(getGenderListUseCaseProvider),
    ref.read(getCadersUseCaseProvider),
    ref
  ),
);


