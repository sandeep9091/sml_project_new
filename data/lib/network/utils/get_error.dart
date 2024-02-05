import 'dart:convert';

import 'package:data/entity/remote/error/error.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/network_error.dart';
import 'package:flutter/material.dart';

NetworkError getError({Response? apiResponse}) {
  if (apiResponse?.data != null) {
    try {
      final errorResponseEntity = Error.fromJson((apiResponse?.data) is String
          ? jsonDecode(apiResponse?.data)
          : apiResponse?.data as Map<String, dynamic>);
      return NetworkError(
        httpError: apiResponse!.statusCode!,
        errorCode: errorResponseEntity.code.toString(),
        description: errorResponseEntity.message,
        cause: Exception("Server Response Error"),
      );
    } catch (exception) {
      debugPrint(" NetworkError exception ::: $exception");
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
