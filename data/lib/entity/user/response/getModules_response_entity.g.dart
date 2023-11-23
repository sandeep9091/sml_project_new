// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getModules_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetModulesResponseEntity _$GetModulesResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetModulesResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => GetModulesResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetModulesResponseEntityToJson(
        GetModulesResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

GetModulesResponseDataEntity _$GetModulesResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    GetModulesResponseDataEntity(
      mdname: json['mdname'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      mdchilds: (json['mdchilds'] as List<dynamic>?)
              ?.map((e) => MdChildsEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetModulesResponseDataEntityToJson(
        GetModulesResponseDataEntity instance) =>
    <String, dynamic>{
      'mdname': instance.mdname,
      'active': instance.active,
      'mdchilds': instance.mdchilds,
    };

MdChildsEntity _$MdChildsEntityFromJson(Map<String, dynamic> json) =>
    MdChildsEntity(
      submdname: json['submdname'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      createBy: json['create_by'] as String? ?? '',
      createDt: json['create_dt'] as String? ?? '',
      modifyBy: json['modify_by'] as String? ?? '',
      modifyDt: json['modify_dt'] as String? ?? '',
      underscoreId: json['_id'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      routerLink: json['routerLink'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$MdChildsEntityToJson(MdChildsEntity instance) =>
    <String, dynamic>{
      'submdname': instance.submdname,
      'active': instance.active,
      'create_by': instance.createBy,
      'create_dt': instance.createDt,
      'modify_by': instance.modifyBy,
      'modify_dt': instance.modifyDt,
      '_id': instance.underscoreId,
      'icon': instance.icon,
      'routerLink': instance.routerLink,
      'code': instance.code,
    };
