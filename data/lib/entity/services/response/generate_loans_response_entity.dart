import 'package:domain/model/get_modules_response/generate_loans_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate_loans_response_entity.g.dart';

@JsonSerializable()
class GenerateLoansResponseEntity
    extends BaseLayerDataTransformer<GenerateLoansResponseEntity, GenerateLoansResponse> {
@JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<GenerateLoansResponseDataEntity> data;

  GenerateLoansResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory GenerateLoansResponseEntity.fromJson(Map<String, Object?> json) =>
      _$GenerateLoansResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GenerateLoansResponseEntityToJson(this);

  @override
  GenerateLoansResponse transform() {
    return GenerateLoansResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class GenerateLoansResponseDataEntity
    extends BaseLayerDataTransformer<GenerateLoansResponseDataEntity, GenerateLoansResponseData> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "borrowername", defaultValue: "")
  final String borrowername;
  @JsonKey(name: "borrower", defaultValue: "")
  final String borrower;
  @JsonKey(name: "branch", defaultValue: "")
  final String branch;
  @JsonKey(name: "branchname", defaultValue: "")
  final String branchname;
  @JsonKey(name: "smtcode", defaultValue: "")
  final String smtcode;
  @JsonKey(name: "prodtype", defaultValue: "")
  final String prodtype;
  @JsonKey(name: "loanschedule", defaultValue: "")
  final String loanschedule;
  @JsonKey(name: "tenure", defaultValue: "")
  final String tenure;
  @JsonKey(name: "deposit", defaultValue: "")
  final String deposit;
  @JsonKey(name: "bankname", defaultValue: "")
  final String bankname;
  @JsonKey(name: "accountno", defaultValue: "")
  final String accountno;
  @JsonKey(name: "accountname", defaultValue: "")
  final String accountname;
  @JsonKey(name: "ifsc", defaultValue: "")
  final String ifsc;
  @JsonKey(name: "surityname", defaultValue: "")
  final String surityname;
  @JsonKey(name: "surityaadhar", defaultValue: "")
  final String surityaadhar;
  @JsonKey(name: "housetype", defaultValue: "")
  final String housetype;
  @JsonKey(name: "surityhousetype", defaultValue: "")
  final String surityhousetype;
  @JsonKey(name: "contactnumber", defaultValue: "")
  final String contactnumber;
  @JsonKey(name: "loanamount", defaultValue: "")
  final String loanamount;
  @JsonKey(name: "description", defaultValue: "")
  final String description;
  @JsonKey(name: "create_by", defaultValue: "")
  final String createBy;
  @JsonKey(name: "create_dt", defaultValue: "")
  final String createDt;
  @JsonKey(name: "modify_by", defaultValue: "")
  final String modifyBy;
  @JsonKey(name: "modify_dt", defaultValue: "")
  final String modifyDt;
  @JsonKey(name: "approvalstatus", defaultValue: "")
  final String approvalstatus;
  @JsonKey(name: "approvalremarks", defaultValue: "")
  final String approvalremarks;
  @JsonKey(name: "approvalby", defaultValue: "")
  final String approvalby;
  @JsonKey(name: "active", defaultValue: false)
  final bool active;
  @JsonKey(name: "disbursementstatus", defaultValue: "")
  final String disbursementstatus;
  @JsonKey(name: "paymentcnt", defaultValue: 0)
  final int paymentcnt;
  @JsonKey(name: "hide", defaultValue: false)
  final bool hide;
  @JsonKey(name: "showhistory", defaultValue: false)
  final bool showhistory;
  @JsonKey(name: "__v", defaultValue: 0)
  final int underscorev;
  @JsonKey(name: "disbursementstatusremarks", defaultValue: "")
  final String disbursementstatusremarks;
  @JsonKey(name: "paymenttype", defaultValue: "")
  final String paymenttype;
  @JsonKey(name: "dueamount", defaultValue: "")
  final String dueamount;

  GenerateLoansResponseDataEntity({
    required this.id,
    required this.borrowername,
    required this.borrower,
    required this.branch,
    required this.branchname,
    required this.smtcode,
    required this.prodtype,
    required this.loanschedule,
    required this.tenure,
    required this.deposit,
    required this.bankname,
    required this.accountno,
    required this.accountname,
    required this.ifsc,
    required this.surityname,
    required this.surityaadhar,
    required this.housetype,
    required this.surityhousetype,
    required this.contactnumber,
    required this.loanamount,
    required this.description,
    required this.createBy,
    required this.createDt,
    required this.modifyBy,
    required this.modifyDt,
    required this.approvalstatus,
    required this.approvalremarks,
    required this.approvalby,
    required this.active,
    required this.disbursementstatus,
    required this.paymentcnt,
    required this.hide,
    required this.showhistory,
    required this.underscorev,
    required this.disbursementstatusremarks,
    required this.paymenttype,
    required this.dueamount,
  });

  factory GenerateLoansResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$GenerateLoansResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GenerateLoansResponseDataEntityToJson(this);

  @override
  GenerateLoansResponseData transform() {
    return GenerateLoansResponseData(id: id, borrowername: borrowername, borrower: borrower, branch: branch, branchname: branchname, smtcode: smtcode, prodtype: prodtype, loanschedule: loanschedule, tenure: tenure, deposit: deposit, bankname: bankname, accountno: accountno, accountname: accountname, ifsc: ifsc, surityname: surityname, surityaadhar: surityaadhar, housetype: housetype, surityhousetype: surityhousetype, contactnumber: contactnumber, loanamount: loanamount, description: description, createBy: createBy, createDt: createDt, modifyBy: modifyBy, modifyDt: modifyDt, approvalstatus: approvalstatus, approvalremarks: approvalremarks, approvalby: approvalby, active: active, disbursementstatus: disbursementstatus, paymentcnt: paymentcnt, hide: hide, showhistory: showhistory, underscorev: underscorev, disbursementstatusremarks: disbursementstatusremarks, paymenttype: paymenttype, dueamount: dueamount);
  }
}