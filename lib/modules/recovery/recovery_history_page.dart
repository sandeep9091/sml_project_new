
import 'package:domain/model/get_modules_response/generate_loans_response.dart';
import 'package:domain/model/get_modules_response/recovery_history_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spoorthymactcs/modules/recovery/recovery_page_view_model.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

import '../../base/base_widget.dart';
import '../../common_utils/appStyles.dart';
import '../../di/login/login_modules.dart';
import '../../ui/molecules/app_error_widget.dart';
import '../../ui/molecules/common_app_bar.dart';
import '../../ui/molecules/common_title_value_widget.dart';
import '../../utils/common_lists.dart';


class RecoveryHistoryPage extends StatelessWidget {
    const RecoveryHistoryPage({super.key,required this.eachGeneratedLoan});
    final GenerateLoansResponseData eachGeneratedLoan;


    @override
    Widget build(BuildContext context) {
    
    

      return Scaffold(
        appBar: const CommonAppBar(
      titleWidget: Text("Recovery History"),
      enalbeTitle: true,
    ),
        body: BaseWidget<RecoveryPageViewModel>(
        providerBase: recoveryViewModelProvider,
          builder: (context, model, child) {
            model!.getRecoveryHistory(eachGeneratedLoan.smtcode,eachGeneratedLoan.id);
            return AppStreamBuilder<Resource<RecoveryHistoryResponse>>(
                            stream: model.recoveryHistoryStream,
                            initialData: Resource.none(),
                            onError: (error) {},
                            dataBuilder: ((context, data) {
                              if(data?.status == Status.SUCCESS){
                                if((data?.data?.data ?? []).isNotEmpty){
                                  List<RecoveryHistoryResponseData>? historyData = data?.data?.data;
                                  return Column(
                                  children: [
                                    Column(children: [
                                      Text("Payment History :- ${eachGeneratedLoan.borrower} with SMTCODE: ${historyData?[0].smtcode??""}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColor.semiBlack,
                                            fontFamily: FontUtils.primary,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.visible
                                          ),
                                        ),
                                        Text("Borrowed Amount: ${historyData?[0].borrwedamount??""}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColor.semiBlack,
                                            fontFamily: FontUtils.primary,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.visible
                                          ),
                                        ),
                                        Text("Collected Amount: ${model.collectedAmount(historyData)}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColor.semiBlack,
                                            fontFamily: FontUtils.primary,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.visible
                                          ),
                                        )
                                    ],),
                                    Expanded(
                      child: ListView.builder(
                itemCount: historyData?.length,
                itemBuilder: (context, index){
                  RecoveryHistoryResponseData eachHistory = historyData![index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  decoration: BoxDecoration(
                    //color: AppColor.red,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 2.0,color: AppColor.blue)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTitleValueWidget(title: "Collected Amount",value: eachHistory.collectedAmount),
                      CommonTitleValueWidget(title: "Payment Type",value: CommonLists.getPaymentType(eachHistory.paymenttype)),
                      CommonTitleValueWidget(title: "Date",value: eachHistory.modifyDt),
                      CommonTitleValueWidget(title: "Remars",value: eachHistory.remarks),
                      
                                  ],
                              )
                              );
                            }),
                        ),
                                  ],
                                );
                                }else{
                                  return const AppErrorWidget();
                                }
                              }else if(data?.status == Status.SUCCESS){
                               return const AppErrorWidget();
                                }else{
                              return const SizedBox.shrink();}
                                  }),
                                );
            
          },),
      );
        }
}