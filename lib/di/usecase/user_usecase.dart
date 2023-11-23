

import 'package:data/di/repository_module.dart';
import 'package:domain/usecase/common_usecase/get_modules_usecase.dart';
import 'package:domain/usecase/common_usecase/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUseCaseProvider = Provider.autoDispose<LoginUseCase>(
  (ref) => LoginUseCase(ref.read(userRepositoryProvider)),
);

final getModulesUseCaseProvider = Provider.autoDispose<GetModulesUseCase>(
  (ref) => GetModulesUseCase(ref.read(userRepositoryProvider)),
);