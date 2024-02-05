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
  final String contactNo;
  final String countryname;
  final String state;
  final String cityname;
  final String city;
  final String pincode;
  final bool active;
  final String byemployee;
  final String byemployeename;
  final String createBy;
  final String createDt;
  final String modifyBy;
  final String modifyDt;
  final int underscoreV;
  final String? aadharPhoto;  
  final String? rationCardPhoto;  
  final String? houseTaxReceiptPhoto;  
  final String? loanApplicationPhoto;  
  final String? housePhoto;  
  final String? passportPhoto;  
  final String? othersPhoto;  


  const BorrowersResponseData(
      {
        required this.id,
        required this.name,
        required this.aadhar,
        required this.ccode,
        required this.description,
        required this.countryname,
        required this.cityname,
        required this.state,
        required this.city,
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
        this.aadharPhoto, 
        this.rationCardPhoto,
        this.houseTaxReceiptPhoto,  
        this.loanApplicationPhoto,  
        this.housePhoto,  
        this.passportPhoto,  
        this.othersPhoto,  
        });
}