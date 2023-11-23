import 'package:domain/model/get_modules_response/get_modules_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'getModules_response_entity.g.dart';

@JsonSerializable()
class GetModulesResponseEntity
    extends BaseLayerDataTransformer<GetModulesResponseEntity, GetModulesResponse> {
@JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<GetModulesResponseDataEntity> data;

  GetModulesResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory GetModulesResponseEntity.fromJson(Map<String, Object?> json) =>
      _$GetModulesResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetModulesResponseEntityToJson(this);

  @override
  GetModulesResponse transform() {
    return GetModulesResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class GetModulesResponseDataEntity
    extends BaseLayerDataTransformer<GetModulesResponseDataEntity, GetModulesResponseData> {
  @JsonKey(name: "mdname", defaultValue: "")
  final String mdname;
  @JsonKey(name: "active", defaultValue: false)
  final bool active;
  @JsonKey(name: "mdchilds", defaultValue: [])
  final List<MdChildsEntity> mdchilds;

  GetModulesResponseDataEntity({
    required this.mdname,
    required this.active,
    required this.mdchilds
  });

  factory GetModulesResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$GetModulesResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetModulesResponseDataEntityToJson(this);

  @override
  GetModulesResponseData transform() {
    return GetModulesResponseData(
      mdname: mdname,
      active: active,
      mdchilds: mdchilds.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class MdChildsEntity extends BaseLayerDataTransformer<
    MdChildsEntity, MdChilds> {
  @JsonKey(name: "submdname", defaultValue: '')
  final String submdname;
  @JsonKey(name: "active", defaultValue: false)
  final bool active;
  @JsonKey(name: "create_by", defaultValue: '')
  final String createBy;
  @JsonKey(name: "create_dt", defaultValue: '')
  final String createDt;
  @JsonKey(name: "modify_by", defaultValue: '')
  final String modifyBy;
  @JsonKey(name: "modify_dt", defaultValue: '')
  final String modifyDt;
  @JsonKey(name: "_id", defaultValue: '')
  final String underscoreId;
  @JsonKey(name: "icon", defaultValue: '')
  final String icon;
  @JsonKey(name: "routerLink", defaultValue: '')
  final String routerLink;
  @JsonKey(name: "code", defaultValue: '')
  final String code;

  MdChildsEntity({
    required this.submdname,
    required this.active,
    required this.createBy,
    required this.createDt,
    required this.modifyBy,
    required this.modifyDt,
    required this.underscoreId,
    required this.icon,
    required this.routerLink,
    required this.code
  });

  factory MdChildsEntity.fromJson(Map<String, dynamic> json) =>
      _$MdChildsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MdChildsEntityToJson(this);

  @override
  MdChilds transform() {
    return MdChilds(submdname: submdname, active: active, createBy: createBy, createDt: createDt, modifyBy: modifyBy, modifyDt: modifyDt, underscoreId: underscoreId, icon: icon, routerLink: routerLink, code: code);
  }
}