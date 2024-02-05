// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getDashboard_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDashboardResponseEntity _$GetDashboardResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetDashboardResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => GetDashboardResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetDashboardResponseEntityToJson(
        GetDashboardResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

GetDashboardResponseDataEntity _$GetDashboardResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    GetDashboardResponseDataEntity(
      header: json['header'] as String? ?? '',
      cnt: json['cnt'] as int? ?? -1,
      newCnt: json['newCnt'] as int? ?? -1,
      last7Cnt: json['last7Cnt'] as int? ?? -1,
      activeCnt: json['activeCnt'] as int? ?? -1,
      inActiveCnt: json['inActiveCnt'] as int? ?? -1,
    );

Map<String, dynamic> _$GetDashboardResponseDataEntityToJson(
        GetDashboardResponseDataEntity instance) =>
    <String, dynamic>{
      'header': instance.header,
      'cnt': instance.cnt,
      'newCnt': instance.newCnt,
      'last7Cnt': instance.last7Cnt,
      'activeCnt': instance.activeCnt,
      'inActiveCnt': instance.inActiveCnt,
    };
