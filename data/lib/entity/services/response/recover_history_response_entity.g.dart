// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_history_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoveryHistoryResponseEntity _$RecoveryHistoryResponseEntityFromJson(
        Map<String, dynamic> json) =>
    RecoveryHistoryResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => RecoveryHistoryResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$RecoveryHistoryResponseEntityToJson(
        RecoveryHistoryResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

RecoveryHistoryResponseDataEntity _$RecoveryHistoryResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    RecoveryHistoryResponseDataEntity(
      id: json['_id'] as String? ?? '',
      smtcode: json['smtcode'] as String? ?? '',
      borrwedamount: json['borrwedamount'] as String? ?? '',
      collectedAmount: json['collectedAmount'] as String? ?? '',
      loanid: json['loanid'] as String? ?? '',
      remarks: json['remarks'] as String? ?? '',
      createBy: json['create_by'] as String? ?? '',
      createDt: json['create_dt'] as String? ?? '',
      modifyBy: json['modify_by'] as String? ?? '',
      modifyDt: json['modify_dt'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      paymentcnt: json['paymentcnt'] as String? ?? '',
      paymenttype: json['paymenttype'] as String? ?? '',
      underscorev: json['__v'] as int? ?? 0,
    );

Map<String, dynamic> _$RecoveryHistoryResponseDataEntityToJson(
        RecoveryHistoryResponseDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'loanid': instance.loanid,
      'borrwedamount': instance.borrwedamount,
      'collectedAmount': instance.collectedAmount,
      'remarks': instance.remarks,
      'smtcode': instance.smtcode,
      'paymentcnt': instance.paymentcnt,
      'paymenttype': instance.paymenttype,
      'create_by': instance.createBy,
      'create_dt': instance.createDt,
      'modify_by': instance.modifyBy,
      'modify_dt': instance.modifyDt,
      'active': instance.active,
      '__v': instance.underscorev,
    };
