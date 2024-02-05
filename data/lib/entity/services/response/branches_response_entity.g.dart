// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchesResponseEntity _$BranchesResponseEntityFromJson(
        Map<String, dynamic> json) =>
    BranchesResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => BranchesResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BranchesResponseEntityToJson(
        BranchesResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

BranchesResponseDataEntity _$BranchesResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    BranchesResponseDataEntity(
      id: json['_id'] as String? ?? '',
      bname: json['bname'] as String? ?? '',
      bcode: json['bcode'] as String? ?? '',
      cId: json['cId'] as String? ?? '',
      cname: json['cname'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      bOpnDt: json['b_opn_dt'] as String? ?? '',
      countryname: json['countryname'] as String? ?? '',
      state: json['state'] as String? ?? '',
      cityname: json['cityname'] as String? ?? '',
      city: json['city'] as String? ?? '',
      pincode: json['pincode'] as String? ?? '',
      contactNo: json['contact_no'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      createBy: json['create_by'] as String? ?? '',
      createDt: json['create_dt'] as String? ?? '',
      modifyBy: json['modify_by'] as String? ?? '',
      modifyDt: json['modify_dt'] as String? ?? '',
      underscoreV: json['__v'] as int? ?? 0,
    );

Map<String, dynamic> _$BranchesResponseDataEntityToJson(
        BranchesResponseDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bname': instance.bname,
      'bcode': instance.bcode,
      'cId': instance.cId,
      'cname': instance.cname,
      'desc': instance.desc,
      'b_opn_dt': instance.bOpnDt,
      'countryname': instance.countryname,
      'state': instance.state,
      'cityname': instance.cityname,
      'city': instance.city,
      'pincode': instance.pincode,
      'contact_no': instance.contactNo,
      'create_by': instance.createBy,
      'create_dt': instance.createDt,
      'modify_by': instance.modifyBy,
      'modify_dt': instance.modifyDt,
      'active': instance.active,
      '__v': instance.underscoreV,
    };
