import 'package:domain/model/services/get_team_mapper_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_team_mapper_response_entity.g.dart';

@JsonSerializable()
class GetTeamMapperResponseEntity
    extends BaseLayerDataTransformer<GetTeamMapperResponseEntity, GetTeamMapperResponse> {
  @JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: null)
  final GetTeamMapperResponseDataEntity? data;

  GetTeamMapperResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory GetTeamMapperResponseEntity.fromJson(Map<String, Object?> json) =>
      _$GetTeamMapperResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetTeamMapperResponseEntityToJson(this);

  @override
  GetTeamMapperResponse transform() {
    return GetTeamMapperResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data?.transform());
  }
}

@JsonSerializable()
class GetTeamMapperResponseDataEntity
    extends BaseLayerDataTransformer<GetTeamMapperResponseDataEntity, GetTeamMapperResponseData> {
  @JsonKey(name: "cader", defaultValue: [])
  final List<CaderDataEntity> caderData;

  GetTeamMapperResponseDataEntity({
    required this.caderData
  });

  factory GetTeamMapperResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$GetTeamMapperResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetTeamMapperResponseDataEntityToJson(this);

  @override
  GetTeamMapperResponseData transform() {
    return GetTeamMapperResponseData(caderData: caderData.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class CaderDataEntity
    extends BaseLayerDataTransformer<CaderDataEntity, CaderData> {
  @JsonKey(name: "id", defaultValue: "")
  final String id;
  @JsonKey(name: "cdname", defaultValue: "")
  final String cdname;
  @JsonKey(name: "active", defaultValue: false)
  final bool active;
  @JsonKey(name: "code", defaultValue: "")
  final String code;
  @JsonKey(name: "users", defaultValue: [])
  final List<UsersDataEntity> usersData;

  CaderDataEntity({
    required this.id,
    required this.cdname,
    required this.active,
    required this.code,
    required this.usersData
  });

  factory CaderDataEntity.fromJson(Map<String, Object?> json) =>
      _$CaderDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CaderDataEntityToJson(this);

  @override
  CaderData transform() {
    return CaderData(id: id, cdname: cdname, active: active, code: code, usersData: usersData.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class UsersDataEntity
    extends BaseLayerDataTransformer<UsersDataEntity, UsersData> {
  @JsonKey(name: "id", defaultValue: "")
  final String id;
  @JsonKey(name: "uname", defaultValue: "")
  final String uname;
  @JsonKey(name: "isCheckBoxActive", defaultValue: false)
  final bool isCheckBoxActive;

  UsersDataEntity({
    required this.id,
    required this.uname,
    required this.isCheckBoxActive
  });

  factory UsersDataEntity.fromJson(Map<String, Object?> json) =>
      _$UsersDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UsersDataEntityToJson(this);

  @override
  UsersData transform() {
    return UsersData(id: id, uname: uname,isCheckBoxActive:isCheckBoxActive);
  }
}