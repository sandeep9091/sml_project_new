import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';
part 'login_response.freezed.dart';

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    required int sCode,
    required String sMessage,
    required List<LoginResponseData> data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginResponseData with _$LoginResponseData {
  factory LoginResponseData({
    UserInfo? userInfo,
  }) = _LoginResponseData;

  factory LoginResponseData.fromJson(Map<String, Object?> json) =>
      _$LoginResponseDataFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {


    factory UserInfo({
      required String id,
  required String uname,
  required String password,
  required String gendername,
  required String cader,
  required String branchid,
  required String branchname,
  required String secure,
  required int loggTime,
  UserCader? userCader,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, Object?> json) =>
      _$UserInfoFromJson(json);
}

@freezed
class UserCader with _$UserCader{
  factory UserCader({
    required String id,
      required String cdname,
      required bool active,
      required String code
  }) = _UserCader;

  factory UserCader.fromJson(Map<String, Object?> json) =>
      _$UserCaderFromJson(json);
}