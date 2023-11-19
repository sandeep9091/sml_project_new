// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataEntity _$UserDataEntityFromJson(Map<String, dynamic> json) =>
    UserDataEntity(
      page: json['page'] as int? ?? 0,
      perPage: json['per_page'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      totalPages: json['total_pages'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => DataEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      support: json['support'] == null
          ? null
          : SupportEntity.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataEntityToJson(UserDataEntity instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
      'support': instance.support,
    };

DataEntity _$DataEntityFromJson(Map<String, dynamic> json) => DataEntity(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$DataEntityToJson(DataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };

SupportEntity _$SupportEntityFromJson(Map<String, dynamic> json) =>
    SupportEntity(
      url: json['url'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$SupportEntityToJson(SupportEntity instance) =>
    <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
