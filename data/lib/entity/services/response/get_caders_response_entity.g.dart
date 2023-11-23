// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_caders_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCadersResponseEntity _$GetCadersResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetCadersResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => GetCadersResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetCadersResponseEntityToJson(
        GetCadersResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

GetCadersResponseDataEntity _$GetCadersResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    GetCadersResponseDataEntity(
      id: json['_id'] as String? ?? '',
      cdname: json['cdname'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$GetCadersResponseDataEntityToJson(
        GetCadersResponseDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cdname': instance.cdname,
      'active': instance.active,
      'code': instance.code,
    };
