import 'package:domain/model/get_modules_response/users_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_list_response_entity.g.dart';

@JsonSerializable()
class UsersListResponseEntity
    extends BaseLayerDataTransformer<UsersListResponseEntity, UsersListResponse> {
@JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<UsersListResponseDataEntity> data;

  UsersListResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory UsersListResponseEntity.fromJson(Map<String, Object?> json) =>
      _$UsersListResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UsersListResponseEntityToJson(this);

  @override
  UsersListResponse transform() {
    return UsersListResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class UsersListResponseDataEntity
    extends BaseLayerDataTransformer<UsersListResponseDataEntity, UsersListResponseData> {
  @JsonKey(name: "id", defaultValue: "")
  final String id;
  @JsonKey(name: "uname", defaultValue: "")
  final String uname;
  @JsonKey(name: "cadername", defaultValue: "")
  final String cadername;
  @JsonKey(name: "gender", defaultValue: "")
  final String gender;
  @JsonKey(name: "gendername", defaultValue: "")
  final String gendername;
  @JsonKey(name: "cader", defaultValue: "")
  final String cader;
  @JsonKey(name: "password", defaultValue: "")
  final String password;
  @JsonKey(name: "desc", defaultValue: "")
  final String desc;
  @JsonKey(name: "active", defaultValue: false)
  final bool active;

  UsersListResponseDataEntity({
    required this.id,
    required this.uname,
    required this.cadername,
    required this.gender,
    required this.gendername,
    required this.cader,
    required this.password,
    required this.desc,
    required this.active
  });

  factory UsersListResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$UsersListResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UsersListResponseDataEntityToJson(this);

  @override
  UsersListResponseData transform() {
    return UsersListResponseData(id: id, uname: uname, cadername: cadername, gender: gender, gendername: gendername, active: active, cader: cader, password: password, desc: desc);
  }
}