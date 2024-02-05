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
      gendername: json['gendername'] as String,
      cader: json['cader'] as String,
      branchid: json['branchid'] as String,
      branchname: json['branchname'] as String,
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
      'gendername': instance.gendername,
      'cader': instance.cader,
      'branchid': instance.branchid,
      'branchname': instance.branchname,
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
