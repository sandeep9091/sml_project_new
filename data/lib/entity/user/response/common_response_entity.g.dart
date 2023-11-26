// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponseEntity _$CommonResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CommonResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: json['DATA'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$CommonResponseEntityToJson(
        CommonResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };
