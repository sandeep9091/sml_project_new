// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrowers_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowersResponseEntity _$BorrowersResponseEntityFromJson(
        Map<String, dynamic> json) =>
    BorrowersResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => BorrowersResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BorrowersResponseEntityToJson(
        BorrowersResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

BorrowersResponseDataEntity _$BorrowersResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    BorrowersResponseDataEntity(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      aadhar: json['aadhar'] as String? ?? '',
      ccode: json['ccode'] as String? ?? '',
      description: json['description'] as String? ?? '',
      branchId: json['branch_id'] as String? ?? '',
      branchName: json['branch_name'] as String? ?? '',
      state: json['state'] as String? ?? '',
      district: json['district'] as String? ?? '',
      pincode: json['pincode'] as String? ?? '',
      contactNo: json['contact_no'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      byemployee: json['byemployee'] as String? ?? '',
      byemployeename: json['byemployeename'] as String? ?? '',
      createBy: json['create_by'] as String? ?? '',
      createDt: json['create_dt'] as String? ?? '',
      modifyBy: json['modify_by'] as String? ?? '',
      modifyDt: json['modify_dt'] as String? ?? '',
      underscoreV: json['__v'] as int? ?? 0,
    );

Map<String, dynamic> _$BorrowersResponseDataEntityToJson(
        BorrowersResponseDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'aadhar': instance.aadhar,
      'ccode': instance.ccode,
      'description': instance.description,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
      'state': instance.state,
      'district': instance.district,
      'pincode': instance.pincode,
      'contact_no': instance.contactNo,
      'byemployee': instance.byemployee,
      'byemployeename': instance.byemployeename,
      'create_by': instance.createBy,
      'create_dt': instance.createDt,
      'modify_by': instance.modifyBy,
      'modify_dt': instance.modifyDt,
      'active': instance.active,
      '__v': instance.underscoreV,
    };
