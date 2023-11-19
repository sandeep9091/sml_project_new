import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../modules/splash/splash_page_model.dart';

final splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
  (ref) => SplashViewModel(),
);
