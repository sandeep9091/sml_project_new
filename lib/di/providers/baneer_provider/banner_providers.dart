import 'package:domain/usecase/users_uscase/users_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:data/di/repository_module.dart';
import '../../../modules/dashboard/dashboard_page_view_model.dart';

final userDataUseCaseProvider = Provider.autoDispose<UsersUseCase>(
  (ref) => UsersUseCase(
    ref.read(servicesRepositoryProvider),
  ),
);

// final bannerViewModelProvider =
//     ChangeNotifierProvider.autoDispose<BannerPageViewModel>(
//   (ref) => BannerPageViewModel(ref.read(userDataUseCaseProvider)),
// );
