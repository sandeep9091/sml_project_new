// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_master_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressMasterResponseEntity _$AddressMasterResponseEntityFromJson(
        Map<String, dynamic> json) =>
    AddressMasterResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => AddressMasterResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AddressMasterResponseEntityToJson(
        AddressMasterResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

AddressMasterResponseDataEntity _$AddressMasterResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    AddressMasterResponseDataEntity(
      id: json['_id'] as String? ?? '',
      addressData: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => AddressDataEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AddressMasterResponseDataEntityToJson(
        AddressMasterResponseDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'data': instance.addressData,
    };

AddressDataEntity _$AddressDataEntityFromJson(Map<String, dynamic> json) =>
    AddressDataEntity(
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      states: (json['states'] as List<dynamic>?)
              ?.map((e) => StatesEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AddressDataEntityToJson(AddressDataEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'states': instance.states,
    };

StatesEntity _$StatesEntityFromJson(Map<String, dynamic> json) => StatesEntity(
      name: json['name'] as String? ?? '',
      cities: (json['cities'] as List<dynamic>?)
              ?.map((e) => CitiesEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$StatesEntityToJson(StatesEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cities': instance.cities,
    };

CitiesEntity _$CitiesEntityFromJson(Map<String, dynamic> json) => CitiesEntity(
      cname: json['cname'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$CitiesEntityToJson(CitiesEntity instance) =>
    <String, dynamic>{
      'cname': instance.cname,
      'code': instance.code,
    };
