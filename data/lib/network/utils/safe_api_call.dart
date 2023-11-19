import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:data/network/utils/get_error.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/network_error.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

Future<Either<NetworkError, T>?> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      return Left(getError(apiResponse: eitherResponse.response));
    } else if (!eitherResponse.isValidResponse()) {
      return Left(getError(apiResponse: eitherResponse.response));
    } else {
      return Right(originalResponse);
    }
  } on Exception catch (throwable) {
    debugPrint("SafeAPICall Error: ${throwable.toString()}");
    switch (throwable.runtimeType) {
      case DioException:
        switch ((throwable as DioException).type) {
          case DioExceptionType.connectionTimeout:
            break;
          case DioExceptionType.badResponse:
            return Left(NetworkError(
              message: "Bad Response",
              httpError: 500,
              cause: throwable,
            ));
          case DioExceptionType.sendTimeout:
            break;
          case DioExceptionType.receiveTimeout:
            break;
          case DioExceptionType.cancel:
            break;
          case DioExceptionType.connectionError:
            return Left(NetworkError(
              message: throwable.toString(),
              httpError: 503,
              cause: throwable,
            ));

          case DioExceptionType.unknown:
            break;
          case DioExceptionType.badCertificate:
            return Left(
              NetworkError(
                message: throwable.toString(),
                httpError: 403,
                cause: throwable,
              ),
            );
        }
        break;
      case IOException:
        return Left(NetworkError(
          message: throwable.toString(),
          httpError: 502,
          cause: throwable,
        ));

      default:
        return Left(NetworkError(
          message: throwable.toString(),
          httpError: 502,
          cause: throwable,
        ));
    }
    return Left(NetworkError(
      message: throwable.toString(),
      httpError: 500,
      cause: throwable,
    ));
  } catch (error) {
    debugPrint("Unhandeled Error: ${error.toString()}");
    return Left(NetworkError(
      message: error.toString(),
      httpError: 500,
      cause: Exception(
        error.toString(),
      ),
    ));
  }
}

extension RetrofitResponse on HttpResponse {
  ///
  /// Returns true if the code is in [200..300), which means the request was successfully received,
  /// understood, and accepted.
  ///
  bool isSuccessful() {
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }

  bool isValidResponse() {
    try {
      var responseData = response.data as Map<String, dynamic>;
      debugPrint(
          "check isValidResponse >> ${responseData.containsKey("S_CODE")}");
      return (responseData.containsKey("S_CODE") &&
          responseData["S_CODE"] == 200 );
    } catch (e) {
      return false;
    }
  }
}

