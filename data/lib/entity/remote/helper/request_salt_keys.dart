class SaltKey {
  final String key;
  final String value;
  SaltKey({required this.key, required this.value});
}

class RequestSaltKeys {
  static final RequestSaltKeys _instance = RequestSaltKeys._();
  static List<SaltKey> _saltKeys = [];
  RequestSaltKeys._();
  factory RequestSaltKeys() {
    return _instance;
  }

  static void addKey(String key, String value) {
    int index = _saltKeys.indexWhere((element) => element.key == key);
    if (index == -1) {
      _saltKeys.add(SaltKey(key: key, value: value));
    } else {
      _saltKeys[index] = SaltKey(key: key, value: value);
    }
  }

  static String? getValue(String key) {
    int index = _saltKeys.indexWhere((element) => element.key == key);
    if (index != -1) {
      return _saltKeys[index].value;
    }
    return null;
  }

  static void remove(String key) {
    int index = _saltKeys.indexWhere((element) => element.key == key);
    if (index != -1) {
      _saltKeys.removeAt(index);
    }
  }
}
