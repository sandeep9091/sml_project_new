// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseEntity _$LoginResponseEntityFromJson(Map<String, dynamic> json) =>
    LoginResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) =>
                  LoginResponseDataEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$LoginResponseEntityToJson(
        LoginResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

LoginResponseDataEntity _$LoginResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    LoginResponseDataEntity(
      userInfo: json['userInfo'] == null
          ? null
          : UserInfoEntity.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseDataEntityToJson(
        LoginResponseDataEntity instance) =>
    <String, dynamic>{
      'userInfo': instance.userInfo,
    };

UserInfoEntity _$UserInfoEntityFromJson(Map<String, dynamic> json) =>
    UserInfoEntity(
      id: json['_id'] as String? ?? '',
      uname: json['uname'] as String? ?? '',
      password: json['password'] as String? ?? '',
      gendername: json['gendername'] as String? ?? '',
      cader: json['cader'] as String? ?? '',
      branchid: json['branchid'] as String? ?? '',
      branchname: json['branchname'] as String? ?? '',
      secure: json['secure'] as String? ?? '',
      loggTime: json['loggTime'] as int? ?? 0,
      userCader: json['userCader'] == null
          ? null
          : UserCaderEntity.fromJson(json['userCader'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoEntityToJson(UserInfoEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uname': instance.uname,
      'password': instance.password,
      'gendername': instance.gendername,
      'cader': instance.cader,
      'branchid': instance.branchid,
      'branchname': instance.branchname,
      'secure': instance.secure,
      'loggTime': instance.loggTime,
      'userCader': instance.userCader,
    };

UserCaderEntity _$UserCaderEntityFromJson(Map<String, dynamic> json) =>
    UserCaderEntity(
      id: json['_id'] as String? ?? '',
      cdname: json['cdname'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$UserCaderEntityToJson(UserCaderEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cdname': instance.cdname,
      'active': instance.active,
      'code': instance.code,
    };
