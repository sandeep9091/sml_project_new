// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      sCode: json['sCode'] as int,
      sMessage: json['sMessage'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => LoginResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'sCode': instance.sCode,
      'sMessage': instance.sMessage,
      'data': instance.data,
    };

_$LoginResponseDataImpl _$$LoginResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResponseDataImpl(
      userInfo: json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseDataImplToJson(
        _$LoginResponseDataImpl instance) =>
    <String, dynamic>{
      'userInfo': instance.userInfo,
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: json['id'] as String,
      uname: json['uname'] as String,
      password: json['password'] as String,
      gender: json['gender'] as String,
      description: json['description'] as String,
      cader: json['cader'] as String,
      cadername: json['cadername'] as String,
      department: json['department'] as String,
      createDt: json['createDt'] as String,
      modifyDt: json['modifyDt'] as String,
      active: json['active'] as bool,
      underscoreV: json['underscoreV'] as int,
      secure: json['secure'] as String,
      loggTime: json['loggTime'] as int,
      userCader: json['userCader'] == null
          ? null
          : UserCader.fromJson(json['userCader'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uname': instance.uname,
      'password': instance.password,
      'gender': instance.gender,
      'description': instance.description,
      'cader': instance.cader,
      'cadername': instance.cadername,
      'department': instance.department,
      'createDt': instance.createDt,
      'modifyDt': instance.modifyDt,
      'active': instance.active,
      'underscoreV': instance.underscoreV,
      'secure': instance.secure,
      'loggTime': instance.loggTime,
      'userCader': instance.userCader,
    };

_$UserCaderImpl _$$UserCaderImplFromJson(Map<String, dynamic> json) =>
    _$UserCaderImpl(
      id: json['id'] as String,
      cdname: json['cdname'] as String,
      active: json['active'] as bool,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$UserCaderImplToJson(_$UserCaderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cdname': instance.cdname,
      'active': instance.active,
      'code': instance.code,
    };
