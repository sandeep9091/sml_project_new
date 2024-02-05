import 'package:domain/model/get_modules_response/get_modules_new_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'getModulesNew_response_entity.g.dart';

@JsonSerializable()
class GetModulesNewResponseEntity
    extends BaseLayerDataTransformer<GetModulesNewResponseEntity, GetModulesNewResponse> {
@JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<GetModulesNewResponseDataEntity> data;

  GetModulesNewResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory GetModulesNewResponseEntity.fromJson(Map<String, Object?> json) =>
      _$GetModulesNewResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetModulesNewResponseEntityToJson(this);

  @override
  GetModulesNewResponse transform() {
    return GetModulesNewResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class GetModulesNewResponseDataEntity
    extends BaseLayerDataTransformer<GetModulesNewResponseDataEntity, GetModulesNewResponseData> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "code", defaultValue: "")
  final String code;
  @JsonKey(name: "cader", defaultValue: "")
  final String cader;
  @JsonKey(name: "modules", defaultValue: [])
  final List<ModulesEntity> modules;

  GetModulesNewResponseDataEntity({
    required this.id,
    required this.code,
    required this.cader,
    required this.modules
  });

  factory GetModulesNewResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$GetModulesNewResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetModulesNewResponseDataEntityToJson(this);

  @override
  GetModulesNewResponseData transform() {
    return GetModulesNewResponseData(
      id: id,
      code: code,
      cader:cader,
      modules: modules.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class ModulesEntity extends BaseLayerDataTransformer<
    ModulesEntity, Modules> {
  @JsonKey(name: "name", defaultValue: '')
  final String name;
  @JsonKey(name: "isCanDo", defaultValue: '')
  final String isCanDo;
  @JsonKey(name: "path", defaultValue: '')
  final String path;

  ModulesEntity({
    required this.name,
    required this.isCanDo,
    required this.path,
  });

  factory ModulesEntity.fromJson(Map<String, dynamic> json) =>
      _$ModulesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ModulesEntityToJson(this);

  @override
  Modules transform() {
    return Modules(name: name, isCanDo: isCanDo, path: path);
  }
}