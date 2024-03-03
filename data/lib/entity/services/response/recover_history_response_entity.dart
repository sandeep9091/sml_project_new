import 'package:domain/model/get_modules_response/recovery_history_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recover_history_response_entity.g.dart';

@JsonSerializable()
class RecoveryHistoryResponseEntity
    extends BaseLayerDataTransformer<RecoveryHistoryResponseEntity, RecoveryHistoryResponse> {
@JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<RecoveryHistoryResponseDataEntity> data;

  RecoveryHistoryResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory RecoveryHistoryResponseEntity.fromJson(Map<String, Object?> json) =>
      _$RecoveryHistoryResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RecoveryHistoryResponseEntityToJson(this);

  @override
  RecoveryHistoryResponse transform() {
    return RecoveryHistoryResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class RecoveryHistoryResponseDataEntity
    extends BaseLayerDataTransformer<RecoveryHistoryResponseDataEntity, RecoveryHistoryResponseData> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "loanid", defaultValue: "")
  final String loanid;
  @JsonKey(name: "borrwedamount", defaultValue: "")
  final String borrwedamount;
  @JsonKey(name: "collectedAmount", defaultValue: "")
  final String collectedAmount;
  @JsonKey(name: "remarks", defaultValue: "")
  final String remarks;
  @JsonKey(name: "smtcode", defaultValue: "")
  final String smtcode;
  @JsonKey(name: "paymentcnt", defaultValue: "")
  final String paymentcnt;
  @JsonKey(name: "paymenttype", defaultValue: "")
  final String paymenttype;
  @JsonKey(name: "create_by", defaultValue: "")
  final String createBy;
  @JsonKey(name: "create_dt", defaultValue: "")
  final String createDt;
  @JsonKey(name: "modify_by", defaultValue: "")
  final String modifyBy;
  @JsonKey(name: "modify_dt", defaultValue: "")
  final String modifyDt;
  @JsonKey(name: "active", defaultValue: false)
  final bool active;
  @JsonKey(name: "__v", defaultValue: 0)
  final int underscorev;

  RecoveryHistoryResponseDataEntity({
    required this.id,
    required this.smtcode,
    required this.borrwedamount,
    required this.collectedAmount,
    required this.loanid,
    required this.remarks,
    required this.createBy,
    required this.createDt,
    required this.modifyBy,
    required this.modifyDt,
    required this.active,
    required this.paymentcnt,
    required this.paymenttype,
    required this.underscorev,
  });

  factory RecoveryHistoryResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$RecoveryHistoryResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RecoveryHistoryResponseDataEntityToJson(this);

  @override
  RecoveryHistoryResponseData transform() {
    return RecoveryHistoryResponseData(id: id, smtcode: smtcode, createBy: createBy, createDt: createDt, modifyBy: modifyBy, modifyDt: modifyDt, active: active, paymentcnt: paymentcnt, borrwedamount: borrwedamount, collectedAmount: collectedAmount, loanid: loanid, paymenttype: paymenttype, underscorev: underscorev, remarks: remarks);
  }
}