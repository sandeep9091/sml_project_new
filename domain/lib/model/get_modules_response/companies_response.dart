class CompaniesListResponse {
  final int sCode;
  final String sMessage;
  final List<CompaniesListResponseData> data;

  const CompaniesListResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class CompaniesListResponseData {
  final String id;
  final String cname;
  final String countryname;
  final String state;
  final String cityname;
  final String city;
  final String cadress;
  final String cLogo;
  final String ccode;
  final bool active;
  final String decs;
  final String createDt;
  final String modifyBy;
  final String modifyDt;
  final int underscoreV;

  const CompaniesListResponseData(
      {
        required this.id,
        required this.cname,
        required this.countryname,
        required this.state,
        required this.cityname,
        required this.city,
        required this.cadress,
        required this.cLogo,
        required this.ccode,
        required this.decs,
        required this.active,
        required this.createDt,
        required this.modifyBy,
        required this.modifyDt,
        required this.underscoreV,
        });
}