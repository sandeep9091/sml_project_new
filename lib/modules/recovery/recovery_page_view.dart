
import 'package:domain/model/get_modules_response/generate_loans_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/modules/recovery/recovery_history_page.dart';
import 'package:spoorthymactcs/modules/recovery/recovery_page_view_model.dart';
import 'package:spoorthymactcs/modules/recovery/recovery_update_page.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';
import '../../ui/molecules/app_error_widget.dart';
import '../../ui/molecules/common_edit_view_button.dart';
import '../../ui/molecules/common_title_value_widget.dart';
import '../../utils/common_lists.dart';


class RecoveryPageView extends BasePageViewWidget<RecoveryPageViewModel> {
    const RecoveryPageView(ProviderBase model, {Key? key}) : super(model, key: key);


    @override
    Widget build(BuildContext context, model) {
        return AppStreamBuilder<Resource<GenerateLoansResponse>>(
        stream: model.generateLoansStream, 
        initialData: Resource.none(), 
        dataBuilder: (context, data){
          if(data?.status == Status.SUCCESS){
            if(data!.data!.data.isNotEmpty){
              return DefaultTabController(
                length: 2,
                child:  Column(
                  children: [
                    const TabBar(
                    tabs: [
                      Tab(text: "Recovery Postings",),
                      Tab(text: "Completed Payments",),
                    ],
                  ),
                  Expanded(child: TabBarView(
                    children: <Widget>[
                      RecoveryPostingsWidget(model:model,generatedLoans: data.data?.data??[]),
                      CompletedPaymentsWidget(model:model,generatedLoans: data.data?.data??[])
                    ],
                  ))
                  ],
                ),
              );
              
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

class RecoveryPostingsWidget extends StatelessWidget {
  const RecoveryPostingsWidget({super.key,required this.model,required this.generatedLoans});
  final List<GenerateLoansResponseData> generatedLoans;
  final RecoveryPageViewModel model;

  @override
  Widget build(BuildContext context) {
    List<GenerateLoansResponseData> filteredLoans = [];
    filteredLoans = generatedLoans.where((element) => (element.dueamount!="0" && element.dueamount.isNotEmpty)).toList();
    
  if(filteredLoans.isNotEmpty){
        return ListView.builder(
                itemCount: filteredLoans.length,
                itemBuilder: (context, index){
                  GenerateLoansResponseData eachGeneratedLoan = filteredLoans[index];
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
                            isHistoryIcon: true,
                            editButtonAction: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => RecoveryUpdatePage(eachGeneratedLoan: eachGeneratedLoan,))).then((value) => model.disposeAllVariables());
                          },viewButtonAction: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => RecoveryHistoryPage(eachGeneratedLoan: eachGeneratedLoan,)));
                          },),
                        ],
                      ),
                      CommonTitleValueWidget(title: "SMT CODE",value: eachGeneratedLoan.smtcode),
                      CommonTitleValueWidget(title: "Tenure",value: CommonLists.getTenureValue(eachGeneratedLoan.tenure)),
                      CommonTitleValueWidget(title: "Repay Mode",value: CommonLists.getRepayModeValue(eachGeneratedLoan.loanschedule)),
                      CommonTitleValueWidget(title: "Borrowed Amount",value: eachGeneratedLoan.loanamount),
                      CommonTitleValueWidget(title: "Total Due",value: eachGeneratedLoan.dueamount),
                      
                                  ],
                              )
                              );
                            });
  }else{
    return const AppErrorWidget();
  }
  }
}

class CompletedPaymentsWidget extends StatelessWidget {
  const CompletedPaymentsWidget({super.key,required this.model,required this.generatedLoans});
  final List<GenerateLoansResponseData> generatedLoans;
  final RecoveryPageViewModel model;

  @override
  Widget build(BuildContext context) {
        List<GenerateLoansResponseData> filteredLoans = [];
    filteredLoans = generatedLoans.where((element) => element.dueamount=="0").toList();
    
 if(filteredLoans.isNotEmpty){
       return ListView.builder(
                itemCount: filteredLoans.length,
                itemBuilder: (context, index){
                  GenerateLoansResponseData eachGeneratedLoan = filteredLoans[index];
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
                            isHistoryIcon: true,
                            editButtonAction: () {
                            //Navigator.push(context,MaterialPageRoute(builder: (context) => RecoveryUpdatePage(eachGeneratedLoan: eachGeneratedLoan,))).then((value) => model.disposeAllVariables());
                          },viewButtonAction: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => RecoveryHistoryPage(eachGeneratedLoan: eachGeneratedLoan,)));
                          },),
                        ],
                      ),
                      CommonTitleValueWidget(title: "SMT CODE",value: eachGeneratedLoan.smtcode),
                      CommonTitleValueWidget(title: "Tenure",value: CommonLists.getTenureValue(eachGeneratedLoan.tenure)),
                      CommonTitleValueWidget(title: "Repay Mode",value: CommonLists.getRepayModeValue(eachGeneratedLoan.loanschedule)),
                      CommonTitleValueWidget(title: "Borrowed Amount",value: eachGeneratedLoan.loanamount),
                      CommonTitleValueWidget(title: "Total Due",value: eachGeneratedLoan.dueamount),
                      
                                  ],
                              )
                              );
                            });
 }else{
  return const AppErrorWidget();
 }
  }
}