class GetGenderListResponse {
  final int sCode;
  final String sMessage;
  final List<GetGenderListResponseData> data;

  const GetGenderListResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class GetGenderListResponseData {
  final String id;
  final String gname;
  final bool active;
  final String createDt;
  final String modifyBy;
  final String modifyDt;
  final int underscoreV;

  const GetGenderListResponseData(
      {required this.id,
      required this.gname,
      required this.active,
      required this.createDt,
      required this.modifyBy,
      required this.modifyDt,
      required this.underscoreV});
}