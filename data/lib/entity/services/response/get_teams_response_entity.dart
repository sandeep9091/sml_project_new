import 'package:domain/model/get_modules_response/get_teams_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_teams_response_entity.g.dart';

@JsonSerializable()
class GetTeamsResponseEntity
    extends BaseLayerDataTransformer<GetTeamsResponseEntity, GetTeamsResponse> {
  @JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: null)
  final GetTeamsResponseDataEntity? data;

  GetTeamsResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory GetTeamsResponseEntity.fromJson(Map<String, Object?> json) =>
      _$GetTeamsResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetTeamsResponseEntityToJson(this);

  @override
  GetTeamsResponse transform() {
    return GetTeamsResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data?.transform());
  }
}

@JsonSerializable()
class GetTeamsResponseDataEntity
    extends BaseLayerDataTransformer<GetTeamsResponseDataEntity, GetTeamsResponseData> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "branch", defaultValue: "")
  final String branch;
  @JsonKey(name: "cader", defaultValue: [])
  final List<CaderListEntity> caderList;

  GetTeamsResponseDataEntity({
    required this.id,
    required this.branch,
    required this.caderList
  });

  factory GetTeamsResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$GetTeamsResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetTeamsResponseDataEntityToJson(this);

  @override
  GetTeamsResponseData transform() {
    return GetTeamsResponseData(id: id,branch: branch, caderList: caderList.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class CaderListEntity
    extends BaseLayerDataTransformer<CaderListEntity, CaderList> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "cader", defaultValue: "")
  final String cader;
  @JsonKey(name: "users", defaultValue: [])
  final List<UserDataEntity> userData;

  CaderListEntity({
    required this.id,
    required this.cader,
    required this.userData
  });

  factory CaderListEntity.fromJson(Map<String, Object?> json) =>
      _$CaderListEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CaderListEntityToJson(this);

  @override
  CaderList transform() {
    return CaderList(id: id, cader: cader, userData: userData.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class UserDataEntity
    extends BaseLayerDataTransformer<UserDataEntity, UserData> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "isChecked", defaultValue: false)
  final bool isChecked;

  UserDataEntity({
    required this.id,
    required this.isChecked
  });

  factory UserDataEntity.fromJson(Map<String, Object?> json) =>
      _$UserDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataEntityToJson(this);

  @override
  UserData transform() {
    return UserData(id: id, isChecked: isChecked);
  }
}