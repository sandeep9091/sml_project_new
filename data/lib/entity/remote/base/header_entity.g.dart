// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeaderEntity _$HeaderEntityFromJson(Map<String, dynamic> json) => HeaderEntity(
      contentType: json['Content-Type'] as String? ?? 'application/json',
    );

Map<String, dynamic> _$HeaderEntityToJson(HeaderEntity instance) =>
    <String, dynamic>{
      'Content-Type': instance.contentType,
    };
