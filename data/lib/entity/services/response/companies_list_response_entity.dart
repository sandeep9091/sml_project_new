import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'companies_list_response_entity.g.dart';

@JsonSerializable()
class CompaniesListResponseEntity
    extends BaseLayerDataTransformer<CompaniesListResponseEntity, CompaniesListResponse> {
@JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<CompaniesListResponseDataEntity> data;

  CompaniesListResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory CompaniesListResponseEntity.fromJson(Map<String, Object?> json) =>
      _$CompaniesListResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CompaniesListResponseEntityToJson(this);

  @override
  CompaniesListResponse transform() {
    return CompaniesListResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class CompaniesListResponseDataEntity
    extends BaseLayerDataTransformer<CompaniesListResponseDataEntity, CompaniesListResponseData> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "cname", defaultValue: "")
  final String cname;
  @JsonKey(name: "countryname", defaultValue: "")
  final String countryname;
  @JsonKey(name: "state", defaultValue: "")
  final String state;
  @JsonKey(name: "cityname", defaultValue: "")
  final String cityname;
  @JsonKey(name: "city", defaultValue: "")
  final String city;
  @JsonKey(name: "cadress", defaultValue: "")
  final String cadress;
  @JsonKey(name: "cLogo", defaultValue: "")
  final String cLogo;
  @JsonKey(name: "ccode", defaultValue: "")
  final String ccode;
  @JsonKey(name: "decs", defaultValue: "")
  final String decs;
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

  CompaniesListResponseDataEntity({
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
    required this.underscoreV
  });

  factory CompaniesListResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$CompaniesListResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CompaniesListResponseDataEntityToJson(this);

  @override
  CompaniesListResponseData transform() {
    return CompaniesListResponseData(id: id, cname: cname, countryname: countryname, state: state, cityname: cityname, city: city, cadress: cadress, cLogo: cLogo, ccode: ccode, decs: decs, active: active, createDt: createDt, modifyBy: modifyBy, modifyDt: modifyDt, underscoreV: underscoreV);
  }
}