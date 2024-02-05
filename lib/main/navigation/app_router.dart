import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spoorthymactcs/modules/borrowers/borrowers_page.dart';
import 'package:spoorthymactcs/modules/branches/branches_page.dart';
import 'package:spoorthymactcs/modules/companies/companies_page.dart';
import 'package:spoorthymactcs/modules/create_team/create_team_page.dart';
import 'package:spoorthymactcs/modules/users/users_page.dart';
import '../../modules/dashboard/dashboard_page.dart';
import '../../modules/login/login_page.dart';

import '../../modules/splash/splash_page.dart';
import 'route_paths.dart';

enum AppRoute {
  splash,
  login,
  dashboard,
  branches,
  companies,
  users,
  borrowers,
  createTeam
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RoutePaths.splash,
    errorBuilder: (context, state) {
      return Container(alignment: Alignment.center, child: const Text("Sorry, Page Not Found"),);
    },
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
      GoRoute(
        path: RoutePaths.branches,
        name: AppRoute.branches.name,
        builder: (context, state) => const BranchesPage(),
      ),
      GoRoute(
        path: RoutePaths.companies,
        name: AppRoute.companies.name,
        builder: (context, state) => const CompaniesPage(),
      ),
      GoRoute(
        path: RoutePaths.users,
        name: AppRoute.users.name,
        builder: (context, state) => const UsersPage(),
      ),
      GoRoute(
        path: RoutePaths.borrowers,
        name: AppRoute.borrowers.name,
        builder: (context, state) => const BorrowersPage(),
      ),
      GoRoute(
        path: RoutePaths.createTeam,
        name: AppRoute.createTeam.name,
        builder: (context, state) => const CreateTeamPage(),
      ),
    ],
  );
});
