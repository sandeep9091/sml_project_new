import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../modules/dashboard/dashboard_page.dart';
import '../../modules/login/login_page.dart';

import '../../modules/splash/splash_page.dart';
import 'route_paths.dart';

enum AppRoute {
  splash,
  login,
  dashboard,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RoutePaths.splash,
    routes: [
      GoRoute(
        path: RoutePaths.splash,
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RoutePaths.login,
        name: AppRoute.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RoutePaths.dashboard,
        name: AppRoute.dashboard.name,
        builder: (context, state) => const DashboardPage(),
      ),
    ],
  );
});
