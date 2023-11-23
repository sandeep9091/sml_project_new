class GetCadersResponse {
  final int sCode;
  final String sMessage;
  final List<GetCadersResponseData> data;

  const GetCadersResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class GetCadersResponseData {
  final String id;
  final String cdname;
  final bool active;
  final String code;

  const GetCadersResponseData(
      {required this.id,
      required this.cdname,
      required this.active,
      required this.code});
}