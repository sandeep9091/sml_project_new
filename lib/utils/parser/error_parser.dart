import 'package:domain/constants/error_types.dart';
import 'package:domain/error/app_error.dart';

import '../../generated/l10n.dart';

class ErrorParser {
  ErrorParser._();

  static String getLocalisedStringError(
      {AppError? error, required S localisedHelper}) {
    switch (error?.type) {
      case ErrorType.IOEXCEPTION:
        return localisedHelper.genericError;
      case ErrorType.UI:
        return localisedHelper.genericError;
      case ErrorType.NETWORK:
        return localisedHelper.genericError;
      case ErrorType.NET_SERVER_MESSAGE:
      // TODO: Handle this case.
      case ErrorType.UNAUTHORIZED_USER:
      // TODO: Handle this case.
      case ErrorType.NET_NO_INTERNET_CONNECTION:
      // TODO: Handle this case.
      case ErrorType.INVALID_BENEFICIARY:
      // TODO: Handle this case.
      case ErrorType.DATABASE:
      // TODO: Handle this case.
      case ErrorType.DATABASE_NOT_SUPPORTED:
      // TODO: Handle this case.
      case ErrorType.DB_ERROR1:
      // TODO: Handle this case.
      case ErrorType.DB_USER_NOT_FOUND:
      // TODO: Handle this case.
      default:
        return "";
    }
  }
}
