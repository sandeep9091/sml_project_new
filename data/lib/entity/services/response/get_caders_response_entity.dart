import 'package:domain/model/services/get_caders_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_caders_response_entity.g.dart';

@JsonSerializable()
class GetCadersResponseEntity
    extends BaseLayerDataTransformer<GetCadersResponseEntity, GetCadersResponse> {
  @JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<GetCadersResponseDataEntity> data;

  GetCadersResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory GetCadersResponseEntity.fromJson(Map<String, Object?> json) =>
      _$GetCadersResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetCadersResponseEntityToJson(this);

  @override
  GetCadersResponse transform() {
    return GetCadersResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class GetCadersResponseDataEntity
    extends BaseLayerDataTransformer<GetCadersResponseDataEntity, GetCadersResponseData> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "cdname", defaultValue: "")
  final String cdname;
  @JsonKey(name: "active", defaultValue: false)
  final bool active;
  @JsonKey(name: "code", defaultValue: "")
  final String code;

  GetCadersResponseDataEntity({
    required this.id,
    required this.cdname,
    required this.active,
    required this.code
  });

  factory GetCadersResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$GetCadersResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetCadersResponseDataEntityToJson(this);

  @override
  GetCadersResponseData transform() {
    return GetCadersResponseData(id: id, cdname: cdname, active: active, code: code);
  }
}