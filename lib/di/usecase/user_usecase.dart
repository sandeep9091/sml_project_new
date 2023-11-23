

import 'package:data/di/network_module.dart';
import 'package:data/di/repository_module.dart';
import 'package:domain/usecase/common_usecase/get_modules_usecase.dart';
import 'package:domain/usecase/common_usecase/login_usecase.dart';
import 'package:domain/usecase/services/get_caders_usecase.dart';
import 'package:domain/usecase/services/get_gender_list_usecase.dart';
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

