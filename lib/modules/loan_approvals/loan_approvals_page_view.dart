
import 'package:domain/model/get_modules_response/generate_loans_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/ui/molecules/active_status_widget.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

import '../../ui/molecules/app_error_widget.dart';
import '../../ui/molecules/approve_status_widget.dart';
import '../../ui/molecules/common_edit_view_button.dart';
import '../../ui/molecules/common_title_value_widget.dart';
import '../../utils/common_lists.dart';
import '../../utils/common_utils.dart';
import 'loan_approvals_action_page.dart';
import 'loan_approvals_page_view_model.dart';


class LoanApprovalsPageView extends BasePageViewWidget<LoanApprovalsPageViewModel> {
    const LoanApprovalsPageView(ProviderBase model, {Key? key}) : super(model, key: key);


    @override
    Widget build(BuildContext context, model) {
            return AppStreamBuilder<Resource<GenerateLoansResponse>>(
        stream: model.generateLoansStream, 
        initialData: Resource.none(), 
        dataBuilder: (context, data){
          if(data?.status == Status.SUCCESS){
            if((data?.data?.data??[]).isNotEmpty){
    
              return ListView.builder(
                itemCount: data?.data?.data.length,
                itemBuilder: (context, index){
                  GenerateLoansResponseData eachGeneratedLoan = data!.data!.data[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  decoration: BoxDecoration(
                    //color: AppColor.red,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 2.0,color: AppColor.primary)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTitleValueWidget(title: "Name",value: eachGeneratedLoan.borrower,width: MediaQuery.of(context).size.width *.70,),
                          CommonEditViewButton(
                            showEditButton: false,
                            showViewButton: eachGeneratedLoan.approvalstatus == "P",
                            editButtonAction: () {
                            //Navigator.push(context,MaterialPageRoute(builder: (context) => BorrowersActionPage(singleBorrower: eachBorrower,type: "EDIT",))).then((value) => model.disposeAllVariables());
                          },viewButtonAction: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => LoanApprovalsActionPage(eachGeneratedLoan: eachGeneratedLoan,type: "VIEW",))).then((value) => model.disposeAllVariables());
                          },),
                        ],
                      ),
                      CommonTitleValueWidget(title: "HouseType",value: "${CommonLists.getHouseType(eachGeneratedLoan.housetype)} / ${CommonLists.getProductType(eachGeneratedLoan.prodtype)} / ${CommonLists.getdespositType(eachGeneratedLoan.deposit)}",),
                      CommonTitleValueWidget(title: "Loan",value: "${eachGeneratedLoan.loanamount} / ${CommonLists.getRepayModeValue(eachGeneratedLoan.loanschedule)} / ${CommonLists.getTenureValue(eachGeneratedLoan.tenure)}",),
                      CommonTitleValueWidget(title: "Bank",value: "${eachGeneratedLoan.bankname} / ${eachGeneratedLoan.ifsc}",),
                      CommonTitleValueWidget(title: "Account",value: "${eachGeneratedLoan.accountname} / ${eachGeneratedLoan.accountno}",),
                      CommonTitleValueWidget(title: "Surity",value: "${eachGeneratedLoan.surityname} / ${eachGeneratedLoan.surityaadhar}",),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTitleValueWidget(title: "Surity contact",value: "${CommonLists.getHouseType(eachGeneratedLoan.surityhousetype)} / ${eachGeneratedLoan.contactnumber}",width: MediaQuery.of(context).size.width *.70,),
                          ActiveStatusWidget(status: eachGeneratedLoan.active),
                        ],
                      ),
                      CommonTitleValueWidget(title: "Description",value: eachGeneratedLoan.description),
                      
                      const SizedBox(height: 5),
                      const Divider(height: 2,color: AppColor.grey,endIndent: 10,indent: 10,),
                      const SizedBox(height: 5),
                      CommonTitleValueWidget(title: "SMT",value: "${eachGeneratedLoan.smtcode} / ${eachGeneratedLoan.branchname}",),
                      CommonTitleValueWidget(title: "Generated By",value: CommonLists.getUserName(context,eachGeneratedLoan.createBy)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTitleValueWidget(title: "Generated Date",value: AppCommonUtils.formatDateToDate(eachGeneratedLoan.createDt),width: MediaQuery.of(context).size.width *.70,),
                          ApproveStatusWidget(status: eachGeneratedLoan.approvalstatus),
                        ],
                      ),
                      CommonTitleValueWidget(title: "Approval Remarks",value: eachGeneratedLoan.approvalremarks),
                    ],
                  )
                  );
                });
            }else{
              return const AppErrorWidget();
            }
          }else if(data?.status == Status.ERROR){
            return const AppErrorWidget();
          }else{
            return const SizedBox.shrink();
          }
        });
    }
}

  