class RC4 {
  String _text = "";
  String _password = "";

  final int _n = 256;
  late List<int> _sbox;

  RC4() {
    _sbox = List.generate(_n, (index) => 0);
  }

  String encode(String plainText, String passcode) {
    _text = plainText;
    _password = passcode;
    return _strToHexStr(_enDeCrypt());
  }

  String decode(String encryptedText, String passcode) {
    _text = _hexStrToStr(encryptedText);
    _password = passcode;
    return _enDeCrypt();
  }

  static String _strToHexStr(String str) {
    List<String> sb = [];
    for (int i = 0; i < str.length; i++) {
      int v = str.codeUnitAt(i);
      String sRadix = v.toRadixString(16);
      if (sRadix.length == 1) sRadix = "0$sRadix";
      sb.add(sRadix);
    }
    return sb.join().toUpperCase();
  }

  String _hexStrToStr(String hexStr) {
    List<String> sb = [];
    for (int i = 0; i < hexStr.length; i += 2) {
      String sCode = hexStr.substring(i, i + 2);
      int v = int.parse(sCode, radix: 16);
      sb.add(String.fromCharCode(v));
    }

    return sb.join();
  }

  String _enDeCrypt() {
    _rc4Initialize();
    List<String> cipher = [];
    int i = 0, j = 0, k = 0;
    for (int a = 0; a < _text.length; a++) {
      i = (i + 1) % _n;
      j = (j + _sbox[i]) % _n;
      int tempSwap = _sbox[i];
      _sbox[i] = _sbox[j];
      _sbox[j] = tempSwap;

      k = _sbox[(_sbox[i] + _sbox[j]) % _n];
      int cipherBy = (_text.codeUnitAt(a)) ^ k;
      cipher.add(String.fromCharCode(cipherBy));
    }

    return cipher.join();
  }

  void _rc4Initialize() {
    _sbox = List.generate(_n, (index) => 0);
    List<int> key = List.generate(_n, (index) => 0);
    int n = _password.length;
    for (int a = 0; a < _n; a++) {
      key[a] = _password.codeUnitAt(a % n);
      _sbox[a] = a;
    }

    int b = 0;
    for (int a = 0; a < _n; a++) {
      b = (b + _sbox[a] + key[a]) % _n;
      int tempSwap = _sbox[a];
      _sbox[a] = _sbox[b];
      _sbox[b] = tempSwap;
    }
  }
}
