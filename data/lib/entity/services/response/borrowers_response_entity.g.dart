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
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      aadhar: json['aadhar'] as String? ?? '',
      ccode: json['ccode'] as String? ?? '',
      description: json['description'] as String? ?? '',
      countryname: json['countryname'] as String? ?? '',
      cityname: json['cityname'] as String? ?? '',
      city: json['city'] as String? ?? '',
      state: json['state'] as String? ?? '',
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
      aadharPhoto: json['A'] as String?,
      rationCardPhoto: json['RC'] as String?,
      houseTaxReceiptPhoto: json['HTR'] as String?,
      loanApplicationPhoto: json['LA'] as String?,
      housePhoto: json['HP'] as String?,
      passportPhoto: json['PPC'] as String?,
      othersPhoto: json['OTHERS'] as String?,
    );

Map<String, dynamic> _$BorrowersResponseDataEntityToJson(
        BorrowersResponseDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'aadhar': instance.aadhar,
      'ccode': instance.ccode,
      'description': instance.description,
      'countryname': instance.countryname,
      'cityname': instance.cityname,
      'city': instance.city,
      'state': instance.state,
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
      'A': instance.aadharPhoto,
      'RC': instance.rationCardPhoto,
      'HTR': instance.houseTaxReceiptPhoto,
      'LA': instance.loanApplicationPhoto,
      'HP': instance.housePhoto,
      'PPC': instance.passportPhoto,
      'OTHERS': instance.othersPhoto,
    };
