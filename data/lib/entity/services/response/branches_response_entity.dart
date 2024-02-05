import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branches_response_entity.g.dart';

@JsonSerializable()
class BranchesResponseEntity
    extends BaseLayerDataTransformer<BranchesResponseEntity, BranchesResponse> {
@JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<BranchesResponseDataEntity> data;

  BranchesResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory BranchesResponseEntity.fromJson(Map<String, Object?> json) =>
      _$BranchesResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$BranchesResponseEntityToJson(this);

  @override
  BranchesResponse transform() {
    return BranchesResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class BranchesResponseDataEntity
    extends BaseLayerDataTransformer<BranchesResponseDataEntity, BranchesResponseData> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "bname", defaultValue: "")
  final String bname;
  @JsonKey(name: "bcode", defaultValue: "")
  final String bcode;
  @JsonKey(name: "cId", defaultValue: "")
  final String cId;
  @JsonKey(name: "cname", defaultValue: "")
  final String cname;
  @JsonKey(name: "desc", defaultValue: "")
  final String desc;
  @JsonKey(name: "b_opn_dt", defaultValue: "")
  final String bOpnDt;
  @JsonKey(name: "countryname", defaultValue: "")
  final String countryname;
  @JsonKey(name: "state", defaultValue: "")
  final String state;
  @JsonKey(name: "cityname", defaultValue: "")
  final String cityname;
  @JsonKey(name: "city", defaultValue: "")
  final String city;
  @JsonKey(name: "pincode", defaultValue: "")
  final String pincode;
  @JsonKey(name: "contact_no", defaultValue: "")
  final String contactNo;
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

  BranchesResponseDataEntity({
    required this.id,
    required this.bname,
    required this.bcode,
    required this.cId,
    required this.cname,
    required this.desc,
    required this.bOpnDt,
    required this.countryname,
    required this.state,
    required this.cityname,
    required this.city,
    required this.pincode,
    required this.contactNo,
    required this.active,
    required this.createBy,
    required this.createDt,
    required this.modifyBy,
    required this.modifyDt,
    required this.underscoreV
  });

  factory BranchesResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$BranchesResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$BranchesResponseDataEntityToJson(this);

  @override
  BranchesResponseData transform() {
    return BranchesResponseData(id: id, bname: bname, bcode: bcode, cId: cId, cname: cname, desc: desc, bOpnDt: bOpnDt, countryname: countryname, state: state, cityname: cityname, city: city, pincode: pincode, contactNo: contactNo, active: active, createBy: createBy, createDt: createDt, modifyBy: modifyBy, modifyDt: modifyDt, underscoreV: underscoreV);
  }
}