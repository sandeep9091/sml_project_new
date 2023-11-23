class GetModulesResponse {
  final int sCode;
  final String sMessage;
  final List<GetModulesResponseData> data;

  const GetModulesResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class GetModulesResponseData {
  final String mdname;
  final bool active;
  final List<MdChilds> mdchilds;

  const GetModulesResponseData(
      {
        required this.mdname,
        required this.active,
        required this.mdchilds});
}

class MdChilds {
  final String submdname;
  final bool active;
  final String createBy;
  final String createDt;
  final String modifyBy;
  final String modifyDt;
  final String underscoreId;
  final String icon;
  final String routerLink;
  final String code;

  const MdChilds(
      {required this.submdname,
      required this.active,
      required this.createBy,
      required this.createDt,
      required this.modifyBy,
      required this.modifyDt,
      required this.underscoreId,
      required this.icon,
      required this.routerLink,
      required this.code});
}