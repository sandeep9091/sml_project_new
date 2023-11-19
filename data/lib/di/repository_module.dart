import 'package:data/di/network_module.dart';
import 'package:data/repository/services/services_repository_impl.dart';
import 'package:data/repository/user/user_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

final servicesRepositoryProvider = Provider.autoDispose(
  (ref) {
    return ServicesRepositoryImpl(ref.read(servicesRemoteDsProvider));
  },
);

final userRepositoryProvider = Provider.autoDispose(
  (ref) {
    return UserRepositoryImpl(ref.read(userRemoteDsProvider));
  },
);
