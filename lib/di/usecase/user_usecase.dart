

import 'package:data/di/repository_module.dart';
import 'package:domain/usecase/login_usecase/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUseCaseProvider = Provider.autoDispose<LoginUseCase>(
  (ref) => LoginUseCase(ref.read(userRepositoryProvider)),
);