// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_team_mapper_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTeamMapperResponseEntity _$GetTeamMapperResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetTeamMapperResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: json['DATA'] == null
          ? null
          : GetTeamMapperResponseDataEntity.fromJson(
              json['DATA'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTeamMapperResponseEntityToJson(
        GetTeamMapperResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

GetTeamMapperResponseDataEntity _$GetTeamMapperResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    GetTeamMapperResponseDataEntity(
      caderData: (json['cader'] as List<dynamic>?)
              ?.map((e) => CaderDataEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetTeamMapperResponseDataEntityToJson(
        GetTeamMapperResponseDataEntity instance) =>
    <String, dynamic>{
      'cader': instance.caderData,
    };

CaderDataEntity _$CaderDataEntityFromJson(Map<String, dynamic> json) =>
    CaderDataEntity(
      id: json['id'] as String? ?? '',
      cdname: json['cdname'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      code: json['code'] as String? ?? '',
      usersData: (json['users'] as List<dynamic>?)
              ?.map((e) => UsersDataEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CaderDataEntityToJson(CaderDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cdname': instance.cdname,
      'active': instance.active,
      'code': instance.code,
      'users': instance.usersData,
    };

UsersDataEntity _$UsersDataEntityFromJson(Map<String, dynamic> json) =>
    UsersDataEntity(
      id: json['id'] as String? ?? '',
      uname: json['uname'] as String? ?? '',
      isCheckBoxActive: json['isCheckBoxActive'] as bool? ?? false,
    );

Map<String, dynamic> _$UsersDataEntityToJson(UsersDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uname': instance.uname,
      'isCheckBoxActive': instance.isCheckBoxActive,
    };
