class AddressMasterResponse {
  final int sCode;
  final String sMessage;
  final List<AddressMasterResponseData> data;

  const AddressMasterResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class AddressMasterResponseData {
  final String id;
  final List<AddressData> addressData;

  const AddressMasterResponseData(
      {required this.id,
      required this.addressData});
}

class AddressData {
  final String name;
  final String code;
  final List<States> states;

  const AddressData(
      {required this.name,
      required this.code,
      required this.states});
}

class States {
  final String name;
  final List<Cities> cities;

  const States(
      {required this.name,
      required this.cities});
}

class Cities {
  final String cname;
  final String code;

  const Cities(
      {required this.cname,
      required this.code});
}