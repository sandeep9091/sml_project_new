class FontFamilyEnum {
  final String _value;

  const FontFamilyEnum._(this._value);

  @override
  String toString() {
    return _value.toString();
  }

  static const FontFamilyEnum montserrat = FontFamilyEnum._("Montserrat");

  static const FontFamilyEnum neotech = FontFamilyEnum._("NeoTech");
}
