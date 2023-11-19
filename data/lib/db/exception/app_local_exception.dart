class AppLocalException implements Exception {
  final AppLocalExceptionType appLocalExceptionType;

  AppLocalException({required this.appLocalExceptionType});
}

class AppLocalExceptionType {
  final int _value;

  const AppLocalExceptionType._(this._value);

  int get value => _value;

  static const AppLocalExceptionType NO_DATA_FOUND = AppLocalExceptionType._(1);
  static const AppLocalExceptionType FILE_PICKER_ERROR =
      AppLocalExceptionType._(2);
}
