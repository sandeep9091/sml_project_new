// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_teams_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTeamsResponseEntity _$GetTeamsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetTeamsResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: json['DATA'] == null
          ? null
          : GetTeamsResponseDataEntity.fromJson(
              json['DATA'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTeamsResponseEntityToJson(
        GetTeamsResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

GetTeamsResponseDataEntity _$GetTeamsResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    GetTeamsResponseDataEntity(
      id: json['_id'] as String? ?? '',
      branch: json['branch'] as String? ?? '',
      caderList: (json['cader'] as List<dynamic>?)
              ?.map((e) => CaderListEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetTeamsResponseDataEntityToJson(
        GetTeamsResponseDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'branch': instance.branch,
      'cader': instance.caderList,
    };

CaderListEntity _$CaderListEntityFromJson(Map<String, dynamic> json) =>
    CaderListEntity(
      id: json['_id'] as String? ?? '',
      cader: json['cader'] as String? ?? '',
      userData: (json['users'] as List<dynamic>?)
              ?.map((e) => UserDataEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CaderListEntityToJson(CaderListEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cader': instance.cader,
      'users': instance.userData,
    };

UserDataEntity _$UserDataEntityFromJson(Map<String, dynamic> json) =>
    UserDataEntity(
      id: json['_id'] as String? ?? '',
      isChecked: json['isChecked'] as bool? ?? false,
    );

Map<String, dynamic> _$UserDataEntityToJson(UserDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'isChecked': instance.isChecked,
    };
