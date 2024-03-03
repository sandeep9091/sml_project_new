// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_only_created_borrowers_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOnlyCreatedBorrowersResponseEntity
    _$GetOnlyCreatedBorrowersResponseEntityFromJson(
            Map<String, dynamic> json) =>
        GetOnlyCreatedBorrowersResponseEntity(
          sCode: json['S_CODE'] as int? ?? 0,
          sMessage: json['S_MSG'] as String? ?? '',
          data: (json['DATA'] as List<dynamic>?)
                  ?.map((e) =>
                      GetOnlyCreatedBorrowersResponseDataEntity.fromJson(
                          e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$GetOnlyCreatedBorrowersResponseEntityToJson(
        GetOnlyCreatedBorrowersResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

GetOnlyCreatedBorrowersResponseDataEntity
    _$GetOnlyCreatedBorrowersResponseDataEntityFromJson(
            Map<String, dynamic> json) =>
        GetOnlyCreatedBorrowersResponseDataEntity(
          id: json['_id'] as String? ?? '',
          name: json['name'] as String? ?? '',
        );

Map<String, dynamic> _$GetOnlyCreatedBorrowersResponseDataEntityToJson(
        GetOnlyCreatedBorrowersResponseDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
