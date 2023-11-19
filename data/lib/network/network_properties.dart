enum EnvTypeEnum {
  DEV,
  STAGE,
  PROD,
}

class NetworkProperties {
  static EnvTypeEnum envTypeEnum = EnvTypeEnum.PROD;
  
  static String BASE_URL = _getBaseUrl(envType: envTypeEnum);
  static String AKEY = _getAKey(envType: envTypeEnum);
  static String AUTH_KEY = _getAuthKey(envType: envTypeEnum);
  static String ENKEY = _getEnvKey(envType: envTypeEnum);

    static String _getBaseUrl({required EnvTypeEnum envType}) {
    return const String.fromEnvironment('BASE_URL');
  }

  static String _getAKey({required EnvTypeEnum envType}) {
    return const String.fromEnvironment('AKEY');
  }

  static String _getAuthKey({required EnvTypeEnum envType}) {
    return const String.fromEnvironment('AUTHKEY');
  }

  static String _getEnvKey({required EnvTypeEnum envType}) {
    return const String.fromEnvironment('ENKEY');
  }
}
