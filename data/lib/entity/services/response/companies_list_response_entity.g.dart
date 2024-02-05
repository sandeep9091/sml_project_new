// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_list_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompaniesListResponseEntity _$CompaniesListResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CompaniesListResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => CompaniesListResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CompaniesListResponseEntityToJson(
        CompaniesListResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

CompaniesListResponseDataEntity _$CompaniesListResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    CompaniesListResponseDataEntity(
      id: json['_id'] as String? ?? '',
      cname: json['cname'] as String? ?? '',
      countryname: json['countryname'] as String? ?? '',
      state: json['state'] as String? ?? '',
      cityname: json['cityname'] as String? ?? '',
      city: json['city'] as String? ?? '',
      cadress: json['cadress'] as String? ?? '',
      cLogo: json['cLogo'] as String? ?? '',
      ccode: json['ccode'] as String? ?? '',
      decs: json['decs'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      createDt: json['create_dt'] as String? ?? '',
      modifyBy: json['modify_by'] as String? ?? '',
      modifyDt: json['modify_dt'] as String? ?? '',
      underscoreV: json['__v'] as int? ?? 0,
    );

Map<String, dynamic> _$CompaniesListResponseDataEntityToJson(
        CompaniesListResponseDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cname': instance.cname,
      'countryname': instance.countryname,
      'state': instance.state,
      'cityname': instance.cityname,
      'city': instance.city,
      'cadress': instance.cadress,
      'cLogo': instance.cLogo,
      'ccode': instance.ccode,
      'decs': instance.decs,
      'create_dt': instance.createDt,
      'modify_by': instance.modifyBy,
      'modify_dt': instance.modifyDt,
      'active': instance.active,
      '__v': instance.underscoreV,
    };
