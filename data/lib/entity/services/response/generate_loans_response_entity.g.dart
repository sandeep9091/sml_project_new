// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_loans_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateLoansResponseEntity _$GenerateLoansResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GenerateLoansResponseEntity(
      sCode: json['S_CODE'] as int? ?? 0,
      sMessage: json['S_MSG'] as String? ?? '',
      data: (json['DATA'] as List<dynamic>?)
              ?.map((e) => GenerateLoansResponseDataEntity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GenerateLoansResponseEntityToJson(
        GenerateLoansResponseEntity instance) =>
    <String, dynamic>{
      'S_CODE': instance.sCode,
      'S_MSG': instance.sMessage,
      'DATA': instance.data,
    };

GenerateLoansResponseDataEntity _$GenerateLoansResponseDataEntityFromJson(
        Map<String, dynamic> json) =>
    GenerateLoansResponseDataEntity(
      id: json['_id'] as String? ?? '',
      borrowername: json['borrowername'] as String? ?? '',
      borrower: json['borrower'] as String? ?? '',
      branch: json['branch'] as String? ?? '',
      branchname: json['branchname'] as String? ?? '',
      smtcode: json['smtcode'] as String? ?? '',
      prodtype: json['prodtype'] as String? ?? '',
      loanschedule: json['loanschedule'] as String? ?? '',
      tenure: json['tenure'] as String? ?? '',
      deposit: json['deposit'] as String? ?? '',
      bankname: json['bankname'] as String? ?? '',
      accountno: json['accountno'] as String? ?? '',
      accountname: json['accountname'] as String? ?? '',
      ifsc: json['ifsc'] as String? ?? '',
      surityname: json['surityname'] as String? ?? '',
      surityaadhar: json['surityaadhar'] as String? ?? '',
      housetype: json['housetype'] as String? ?? '',
      surityhousetype: json['surityhousetype'] as String? ?? '',
      contactnumber: json['contactnumber'] as String? ?? '',
      loanamount: json['loanamount'] as String? ?? '',
      description: json['description'] as String? ?? '',
      createBy: json['create_by'] as String? ?? '',
      createDt: json['create_dt'] as String? ?? '',
      modifyBy: json['modify_by'] as String? ?? '',
      modifyDt: json['modify_dt'] as String? ?? '',
      approvalstatus: json['approvalstatus'] as String? ?? '',
      approvalremarks: json['approvalremarks'] as String? ?? '',
      approvalby: json['approvalby'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      disbursementstatus: json['disbursementstatus'] as String? ?? '',
      paymentcnt: json['paymentcnt'] as int? ?? 0,
      hide: json['hide'] as bool? ?? false,
      showhistory: json['showhistory'] as bool? ?? false,
      underscorev: json['__v'] as int? ?? 0,
      disbursementstatusremarks:
          json['disbursementstatusremarks'] as String? ?? '',
      paymenttype: json['paymenttype'] as String? ?? '',
      dueamount: json['dueamount'] as String? ?? '',
    );

Map<String, dynamic> _$GenerateLoansResponseDataEntityToJson(
        GenerateLoansResponseDataEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'borrowername': instance.borrowername,
      'borrower': instance.borrower,
      'branch': instance.branch,
      'branchname': instance.branchname,
      'smtcode': instance.smtcode,
      'prodtype': instance.prodtype,
      'loanschedule': instance.loanschedule,
      'tenure': instance.tenure,
      'deposit': instance.deposit,
      'bankname': instance.bankname,
      'accountno': instance.accountno,
      'accountname': instance.accountname,
      'ifsc': instance.ifsc,
      'surityname': instance.surityname,
      'surityaadhar': instance.surityaadhar,
      'housetype': instance.housetype,
      'surityhousetype': instance.surityhousetype,
      'contactnumber': instance.contactnumber,
      'loanamount': instance.loanamount,
      'description': instance.description,
      'create_by': instance.createBy,
      'create_dt': instance.createDt,
      'modify_by': instance.modifyBy,
      'modify_dt': instance.modifyDt,
      'approvalstatus': instance.approvalstatus,
      'approvalremarks': instance.approvalremarks,
      'approvalby': instance.approvalby,
      'active': instance.active,
      'disbursementstatus': instance.disbursementstatus,
      'paymentcnt': instance.paymentcnt,
      'hide': instance.hide,
      'showhistory': instance.showhistory,
      '__v': instance.underscorev,
      'disbursementstatusremarks': instance.disbursementstatusremarks,
      'paymenttype': instance.paymenttype,
      'dueamount': instance.dueamount,
    };
