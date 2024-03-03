class GenerateLoansResponse {
  final int sCode;
  final String sMessage;
  final List<GenerateLoansResponseData> data;

  const GenerateLoansResponse(
      {required this.sCode,
      required this.sMessage,
      required this.data});
}

class GenerateLoansResponseData {
  final String id;
  final String borrowername;
  final String borrower;
  final String branch;
  final String branchname;
  final String smtcode;
  final String prodtype;
  final String loanschedule;
  final String tenure;
  final String deposit;
  final String bankname;
  final String accountno;
  final String accountname;
  final String ifsc;
  final String surityname;
  final String surityaadhar;
  final String housetype;
  final String surityhousetype;
  final String contactnumber;
  final String loanamount;
  final String description;
  final String createBy;
  final String createDt;
  final String modifyBy;
  final String modifyDt;
  final String approvalstatus;
  final String approvalremarks;
  final String approvalby;
  final bool active;
  final String disbursementstatus;
  final int paymentcnt;
  final bool hide;
  final bool showhistory;
  final int underscorev;
  final String disbursementstatusremarks;
  final String paymenttype;
  final String dueamount;

  const GenerateLoansResponseData(
      {
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
        required this.dueamount});
        
}