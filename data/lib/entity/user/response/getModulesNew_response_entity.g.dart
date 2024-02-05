// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getModulesNew_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetModulesNewResponseEntity _$GetModulesNewResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetModulesNewResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => GetModulesNewResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetModulesNewResponseEntityToJson(
        GetModulesNewResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

GetModulesNewResponseDataEntity _$GetModulesNewResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    GetModulesNewResponseDataEntity(
      id: json['_id'] as String? ?? '',
      code: json['code'] as String? ?? '',
      cader: json['cader'] as String? ?? '',
      modules: (json['modules'] as List<dynamic>?)
              ?.map((e) => ModulesEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetModulesNewResponseDataEntityToJson(
        GetModulesNewResponseDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'code': instance.code,
      'cader': instance.cader,
      'modules': instance.modules,
    };

ModulesEntity _$ModulesEntityFromJson(Map<String, dynamic> json) =>
    ModulesEntity(
      name: json['name'] as String? ?? '',
      isCanDo: json['isCanDo'] as String? ?? '',
      path: json['path'] as String? ?? '',
    );

Map<String, dynamic> _$ModulesEntityToJson(ModulesEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isCanDo': instance.isCanDo,
      'path': instance.path,
    };
