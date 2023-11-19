import 'dart:convert';

import 'package:data/entity/remote/error/error.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/network_error.dart';

NetworkError getError({Response? apiResponse}) {
  if (apiResponse?.data != null) {
    try {
      final errorResponseEntity = Error.fromJson((apiResponse?.data) is String
          ? jsonDecode(apiResponse?.data)
          : apiResponse?.data as Map<String, dynamic>);
      if (errorResponseEntity != null) {
        return NetworkError(
            httpError: apiResponse!.statusCode!,
            errorCode: errorResponseEntity.message,
            description: errorResponseEntity.code.toString(),
            cause: Exception("Server Response Error"));
      } else {
        return NetworkError(
            httpError: apiResponse!.statusCode!,
            cause: Exception("Server Response Error"),
            message: apiResponse.statusMessage!);
      }
    } catch (exception) {
      return NetworkError(
          cause: Exception("Server Response Error"),
          httpError: apiResponse!.statusCode!,
          message: apiResponse.statusMessage!);
    }
  } else {
    return NetworkError(
        cause: Exception("Server Response Error"),
        httpError: apiResponse!.statusCode!,
        message: apiResponse.statusMessage!);
  }
}
