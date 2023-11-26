// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_list_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersListResponseEntity _$UsersListResponseEntityFromJson(
        Map<String, dynamic> json) =>
    UsersListResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => UsersListResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UsersListResponseEntityToJson(
        UsersListResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

UsersListResponseDataEntity _$UsersListResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    UsersListResponseDataEntity(
      id: json['id'] as String? ?? '',
      uname: json['uname'] as String? ?? '',
      cadername: json['cadername'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      gendername: json['gendername'] as String? ?? '',
      cader: json['cader'] as String? ?? '',
      password: json['password'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      active: json['active'] as bool? ?? false,
    );

Map<String, dynamic> _$UsersListResponseDataEntityToJson(
        UsersListResponseDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uname': instance.uname,
      'cadername': instance.cadername,
      'gender': instance.gender,
      'gendername': instance.gendername,
      'cader': instance.cader,
      'password': instance.password,
      'desc': instance.desc,
      'active': instance.active,
    };
