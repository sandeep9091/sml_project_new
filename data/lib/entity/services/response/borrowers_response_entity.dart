import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'borrowers_response_entity.g.dart';

@JsonSerializable()
class BorrowersResponseEntity
    extends BaseLayerDataTransformer<BorrowersResponseEntity, BorrowersResponse> {
@JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<BorrowersResponseDataEntity> data;

  BorrowersResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory BorrowersResponseEntity.fromJson(Map<String, Object?> json) =>
      _$BorrowersResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$BorrowersResponseEntityToJson(this);

  @override
  BorrowersResponse transform() {
    return BorrowersResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class BorrowersResponseDataEntity
    extends BaseLayerDataTransformer<BorrowersResponseDataEntity, BorrowersResponseData> {
  @JsonKey(name: "id", defaultValue: "")
  final String id;
  @JsonKey(name: "name", defaultValue: "")
  final String name;
  @JsonKey(name: "aadhar", defaultValue: "")
  final String aadhar;
  @JsonKey(name: "ccode", defaultValue: "")
  final String ccode;
  @JsonKey(name: "description", defaultValue: "")
  final String description;
  @JsonKey(name: "countryname", defaultValue: "")
  final String countryname;
  @JsonKey(name: "cityname", defaultValue: "")
  final String cityname;
  @JsonKey(name: "city", defaultValue: "")
  final String city;
  @JsonKey(name: "state", defaultValue: "")
  final String state;
  @JsonKey(name: "pincode", defaultValue: "")
  final String pincode;
  @JsonKey(name: "contact_no", defaultValue: "")
  final String contactNo;
  @JsonKey(name: "byemployee", defaultValue: "")
  final String byemployee;
  @JsonKey(name: "byemployeename", defaultValue: "")
  final String byemployeename;
  @JsonKey(name: "create_by", defaultValue: "")
  final String createBy;
  @JsonKey(name: "create_dt", defaultValue: "")
  final String createDt;
  @JsonKey(name: "modify_by", defaultValue: "")
  final String modifyBy;
  @JsonKey(name: "modify_dt", defaultValue: "")
  final String modifyDt;
  @JsonKey(name: "active", defaultValue: false)
  final bool active;
   @JsonKey(name: "__v", defaultValue: 0)
  final int underscoreV;
  @JsonKey(name: "A", defaultValue: null)
  final String? aadharPhoto;
  @JsonKey(name: "RC", defaultValue: null)
  final String? rationCardPhoto;
  @JsonKey(name: "HTR", defaultValue: null)
  final String? houseTaxReceiptPhoto;
  @JsonKey(name: "LA", defaultValue: null)
  final String? loanApplicationPhoto;
  @JsonKey(name: "HP", defaultValue: null)
  final String? housePhoto;
  @JsonKey(name: "PPC", defaultValue: null)
  final String? passportPhoto;
  @JsonKey(name: "OTHERS", defaultValue: null)
  final String? othersPhoto;

  BorrowersResponseDataEntity({
    required this.id,
    required this.name,
    required this.aadhar,
    required this.ccode,
    required this.description,
    required this.countryname,
    required this.cityname,
    required this.city,
    required this.state,
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

  factory BorrowersResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$BorrowersResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$BorrowersResponseDataEntityToJson(this);

  @override
  BorrowersResponseData transform() {
    return BorrowersResponseData(id: id, name: name, aadhar: aadhar, ccode: ccode, description: description, countryname: countryname, cityname: cityname,city:city, state: state, pincode: pincode, contactNo: contactNo, active: active, byemployee: byemployee, byemployeename: byemployeename, createBy: createBy, createDt: createDt, modifyBy: modifyBy, modifyDt: modifyDt, underscoreV: underscoreV, aadharPhoto: aadharPhoto, rationCardPhoto: rationCardPhoto, houseTaxReceiptPhoto: houseTaxReceiptPhoto, loanApplicationPhoto: loanApplicationPhoto, housePhoto: housePhoto, passportPhoto: passportPhoto, othersPhoto: othersPhoto);
  }
}