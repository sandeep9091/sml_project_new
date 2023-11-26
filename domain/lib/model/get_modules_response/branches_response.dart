class BranchesResponse {
  final int sCode;
  final String sMessage;
  final List<BranchesResponseData> data;

  const BranchesResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class BranchesResponseData {
  final String id;
  final String bname;
  final String bcode;
  final String cId;
  final String cname;
  final String desc;
  final String bOpnDt;
  final String state;
  final String district;
  final String pincode;
  final String contactNo;
  final bool active;
  final String createDt;
  final String modifyBy;
  final String modifyDt;
  final int underscoreV;

  const BranchesResponseData(
      {
        required this.id,
        required this.bname,
        required this.bcode,
        required this.cId,
        required this.cname,
        required this.desc,
        required this.bOpnDt,
        required this.state,
        required this.district,
        required this.pincode,
        required this.contactNo,
        required this.active,
        required this.createDt,
        required this.modifyBy,
        required this.modifyDt,
        required this.underscoreV,
        });
}