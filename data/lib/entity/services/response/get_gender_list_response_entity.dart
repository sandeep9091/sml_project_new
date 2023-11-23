
import 'package:domain/model/services/get_gender_list_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_gender_list_response_entity.g.dart';

@JsonSerializable()
class GetGenderListResponseEntity
    extends BaseLayerDataTransformer<GetGenderListResponseEntity, GetGenderListResponse> {
  @JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<GetGenderListResponseDataEntity> data;

  GetGenderListResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory GetGenderListResponseEntity.fromJson(Map<String, Object?> json) =>
      _$GetGenderListResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetGenderListResponseEntityToJson(this);

  @override
  GetGenderListResponse transform() {
    return GetGenderListResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class GetGenderListResponseDataEntity
    extends BaseLayerDataTransformer<GetGenderListResponseDataEntity, GetGenderListResponseData> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "gname", defaultValue: "")
  final String gname;
  @JsonKey(name: "active", defaultValue: false)
  final bool active;
  @JsonKey(name: "create_dt", defaultValue: "")
  final String createDt;
  @JsonKey(name: "modify_by", defaultValue: "")
  final String modifyBy;
  @JsonKey(name: "modify_dt", defaultValue: "")
  final String modifyDt;
  @JsonKey(name: "__v", defaultValue: 0)
  final int underscoreV;

  GetGenderListResponseDataEntity({
    required this.id,
    required this.gname,
    required this.active,
    required this.createDt,
    required this.modifyBy,
    required this.modifyDt,
    required this.underscoreV
  });

  factory GetGenderListResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$GetGenderListResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetGenderListResponseDataEntityToJson(this);

  @override
  GetGenderListResponseData transform() {
    return GetGenderListResponseData(id: id, gname: gname, active: active, createDt: createDt, modifyBy: modifyBy, modifyDt: modifyDt, underscoreV: underscoreV);
  }
}