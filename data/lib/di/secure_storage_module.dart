import 'package:riverpod/riverpod.dart';

import '../source/secure_storage/secure_storage_ds.dart';

final secureStorageDataSourceProvider = Provider<SecureStorageDataSource>(
  (ref) {
    return SecureStorageDataSourceImpl();
  },
);
