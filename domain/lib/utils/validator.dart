class Validator {
  static bool validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }

  static bool hasUpperCase(String password) {
    Pattern pattern = '[A-Z]';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(password);
  }

  static bool hasSymbol(String password) {
    Pattern pattern = '[!@#\$%^&*(),.?":{}|<>]';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(password);
  }

  static bool containsDigit(String password) {
    Pattern pattern = '[0-9]';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(password);
  }

  static bool isEmpty(String data) {
    return data.isEmpty;
  }

  static bool isEqual(String data1, String data2) {
    return data1 == data2;
  }

  static bool isNotEmptyNull(String? data) {
    return ((data != null) && (data.isNotEmpty));
  }
}
