class RecoveryHistoryResponse {
  final int sCode;
  final String sMessage;
  final List<RecoveryHistoryResponseData> data;

  const RecoveryHistoryResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class RecoveryHistoryResponseData {
  final String id;
  final String loanid;
  final String smtcode;
  final String borrwedamount;
  final String collectedAmount;
  final String paymenttype;
  final String remarks;
  final String paymentcnt;
  final bool active;
  final String createBy;
  final String createDt;
  final String modifyBy;
  final String modifyDt;
  final int underscorev;

  const RecoveryHistoryResponseData(
      {
        required this.id,
        required this.smtcode,
        required this.createBy,
        required this.createDt,
        required this.modifyBy,
        required this.modifyDt,
        required this.active,
        required this.paymentcnt,
        required this.borrwedamount,
        required this.collectedAmount,
        required this.loanid,
        required this.paymenttype,
        required this.underscorev,
        required this.remarks});
        
}