import 'package:domain/model/login/login_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_entity.g.dart';

@JsonSerializable()
class LoginResponseEntity
    extends BaseLayerDataTransformer<LoginResponseEntity, LoginResponse> {
@JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<LoginResponseDataEntity> data;

  LoginResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory LoginResponseEntity.fromJson(Map<String, Object?> json) =>
      _$LoginResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseEntityToJson(this);

  @override
  LoginResponse transform() {
    return LoginResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class LoginResponseDataEntity
    extends BaseLayerDataTransformer<LoginResponseDataEntity, LoginResponseData> {
  @JsonKey(name: "userInfo", defaultValue: null)
  final UserInfoEntity? userInfo;

  LoginResponseDataEntity({
    this.userInfo,
  });

  factory LoginResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$LoginResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseDataEntityToJson(this);

  @override
  LoginResponseData transform() {
    return LoginResponseData(
      userInfo: userInfo?.transform());
  }
}


@JsonSerializable()
class UserInfoEntity extends BaseLayerDataTransformer<
    UserInfoEntity, UserInfo> {
  @JsonKey(name: "_id", defaultValue: '')
  final String id;
  @JsonKey(name: "uname", defaultValue: '')
  final String uname;
  @JsonKey(name: "password", defaultValue: '')
  final String password;
  @JsonKey(name: "gendername", defaultValue: '')
  final String gendername;
  @JsonKey(name: "cader", defaultValue: '')
  final String cader;
  @JsonKey(name: "branchid", defaultValue: '')
  final String branchid;
  @JsonKey(name: "branchname", defaultValue: '')
  final String branchname;
  @JsonKey(name: "secure", defaultValue: '')
  final String secure;
  @JsonKey(name: "loggTime", defaultValue: 0)
  final int loggTime;
  @JsonKey(name: "userCader", defaultValue: null)
  final UserCaderEntity? userCader;

  UserInfoEntity({
    required this.id,
    required this.uname,
    required this.password,
    required this.gendername,
    required this.cader,
    required this.branchid,
    required this.branchname,
    required this.secure,
    required this.loggTime,
    this.userCader
  });

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoEntityToJson(this);

  @override
  UserInfo transform() {
    return UserInfo(id: id, uname: uname, password: password, gendername: gendername, cader: cader, branchid: branchid, branchname: branchname, loggTime: loggTime, userCader: userCader?.transform(), secure: secure);
  }
}

@JsonSerializable()
class UserCaderEntity
    extends BaseLayerDataTransformer<UserCaderEntity, UserCader> {
  @JsonKey(name: "_id", defaultValue: '')
  final String id;
  @JsonKey(name: "cdname", defaultValue: '')
  final String cdname;
  @JsonKey(name: "active", defaultValue: false)
  final bool active;
  @JsonKey(name: "code", defaultValue: '')
  final String code;

  UserCaderEntity({
    required this.id,
    required this.cdname,
    required this.active,
    required this.code
  });

  factory UserCaderEntity.fromJson(Map<String, Object?> json) =>
      _$UserCaderEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserCaderEntityToJson(this);

  @override
  UserCader transform() {
    return UserCader(id: id, cdname: cdname, active: active, code: code);
  }
}