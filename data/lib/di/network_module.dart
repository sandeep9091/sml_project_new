import 'package:data/entity/remote/helper/device_helper.dart';
import 'package:data/network/api_interceptor.dart';
import 'package:data/network/api_service.dart';
import 'package:data/network/network_properties.dart';
import 'package:data/source/remote/services_remote_ds_impl.dart';
import 'package:data/source/remote/user_remote_ds_impl.dart';
import 'package:data/source/services_datasource.dart';
import 'package:data/source/user_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod/riverpod.dart';

import 'secure_storage_module.dart';

final baseOptions = Provider<BaseOptions>(
    (ref) => BaseOptions(
    baseUrl: NetworkProperties.BASE_URL,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 90),
    ));

final prettyDioLoggerProvider = Provider<PrettyDioLogger>(
  (ref) => PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    logPrint: (log) {
      return debugPrint(log as String);
    },
  ),
);

final dioProvider = Provider<Dio>(
  (ref) {
    Dio dio = Dio(ref.read(baseOptions));
    if (kDebugMode) {
      dio.interceptors.add(
        ref.read(prettyDioLoggerProvider),
      );
    }
    dio.interceptors.add(
      ApiInterceptor(
        ref.read(deviceInfoHelperProvider),
        ref.read(secureStorageDataSourceProvider),
      ),
    );
    return dio;
  },
);

final apiServiceProvider = Provider.family<ApiService, String?>(
  (ref, baseUrl) => ApiService(ref.read(dioProvider),
      baseUrl: baseUrl ?? NetworkProperties.BASE_URL),
);

final servicesRemoteDsProvider = Provider<ServicesRemoteDataSource>(
  (ref) {
    return ServicesRemoteDSImpl(
      ref.read(
        apiServiceProvider(
          NetworkProperties.BASE_URL,
        ),
      ),
    );
  },
);

var deviceInfoHelperProvider = Provider<DeviceInfoHelper>(
    (ref) => DeviceInfoHelper(ref.read(secureStorageDataSourceProvider)));

final userRemoteDsProvider = Provider<UserRemoteDataSource>(
  (ref) {
    return UserRemoteDSImpl(ref.read(
      apiServiceProvider(
        NetworkProperties.BASE_URL,
      ),
    ));
  },
);
