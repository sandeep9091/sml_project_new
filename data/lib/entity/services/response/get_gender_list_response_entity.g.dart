// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_gender_list_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGenderListResponseEntity _$GetGenderListResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetGenderListResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => GetGenderListResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetGenderListResponseEntityToJson(
        GetGenderListResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

GetGenderListResponseDataEntity _$GetGenderListResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    GetGenderListResponseDataEntity(
      id: json['_id'] as String? ?? '',
      gname: json['gname'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      createDt: json['create_dt'] as String? ?? '',
      modifyBy: json['modify_by'] as String? ?? '',
      modifyDt: json['modify_dt'] as String? ?? '',
      underscoreV: json['__v'] as int? ?? 0,
    );

Map<String, dynamic> _$GetGenderListResponseDataEntityToJson(
        GetGenderListResponseDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'gname': instance.gname,
      'active': instance.active,
      'create_dt': instance.createDt,
      'modify_by': instance.modifyBy,
      'modify_dt': instance.modifyDt,
      '__v': instance.underscoreV,
    };
