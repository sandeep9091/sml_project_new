class BorrowersResponse {
  final int sCode;
  final String sMessage;
  final List<BorrowersResponseData> data;

  const BorrowersResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class BorrowersResponseData {
  final String id;
  final String name;
  final String aadhar;
  final String ccode;
  final String description;
  final String branchId;
  final String branchName;
  final String state;
  final String district;
  final String pincode;
  final String contactNo;
  final bool active;
  final String byemployee;
  final String byemployeename;
  final String createBy;
  final String createDt;
  final String modifyBy;
  final String modifyDt;
  final int underscoreV;

  const BorrowersResponseData(
      {
        required this.id,
        required this.name,
        required this.aadhar,
        required this.ccode,
        required this.description,
        required this.branchId,
        required this.branchName,
        required this.state,
        required this.district,
        required this.pincode,
        required this.contactNo,
        required this.active,
        required this.byemployee,
        required this.byemployeename,
        required this.createBy,
        required this.createDt,
        required this.modifyBy,
        required this.modifyDt,
        required this.underscoreV,
        });
}