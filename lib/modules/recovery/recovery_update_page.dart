
import 'package:domain/model/get_modules_response/generate_loans_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spoorthymactcs/modules/recovery/recovery_page_view_model.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

import '../../base/base_widget.dart';
import '../../common_utils/appButton.dart';
import '../../common_utils/appTextField.dart';
import '../../di/login/login_modules.dart';
import '../../ui/molecules/app_radiobutton.dart';
import '../../ui/molecules/common_app_bar.dart';
import '../../ui/molecules/common_edit_view_button.dart';
import '../../ui/molecules/common_title_value_widget.dart';
import '../../utils/common_lists.dart';


class RecoveryUpdatePage extends StatelessWidget {
    const RecoveryUpdatePage({super.key,required this.eachGeneratedLoan});
    final GenerateLoansResponseData eachGeneratedLoan;


    @override
    Widget build(BuildContext context) {

    renderRadioButtons(model){
      
      List<Widget> paymentWidget = [];
      for (var element in CommonLists.paymentTypeList) { 
        paymentWidget.add(SizedBox(
          width: MediaQuery.of(context).size.width * .45,
          height: 35,
          child: AppRadioButton(title: element['label'],groupValue: model!.selectedPaymentType.value,value: element['value'].toString(),onChanged: (value){
                              model.selectedPaymentType.value = value;
                            }),
        ),);
      }

      return Wrap(
        children: paymentWidget);
    }

      return Scaffold(
        appBar: const CommonAppBar(
      titleWidget: Text("Recovery Update"),
      enalbeTitle: true,
    ),
        body: BaseWidget<RecoveryPageViewModel>(
        providerBase: recoveryViewModelProvider,
          builder: (context, model, child) {
            return SingleChildScrollView(
              child: Container(
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
                            CommonTitleValueWidget(title: "Name",value: eachGeneratedLoan.borrower,width: MediaQuery.of(context).size.width *.70,),
                            CommonTitleValueWidget(title: "SMT CODE",value: eachGeneratedLoan.smtcode),
                            const CommonTitleValueWidget(title: "Repay mode",value: "Repay mode"),
                            CommonTitleValueWidget(title: "Tenure",value: eachGeneratedLoan.tenure),
                            CommonTitleValueWidget(title: "Borrowed Amount",value: eachGeneratedLoan.loanamount),
                            CommonTitleValueWidget(title: "Total Due",value: eachGeneratedLoan.dueamount),
                            const SizedBox(height: 5),
                            
                            ValueListenableBuilder(valueListenable: model!.selectedPaymentType, builder:(context, dynamic, child){
                    return renderRadioButtons(model);
                  }),
                            const SizedBox(height: 5),
                            AppTextField(
                              labelText: "Collected Amount",
                              hintText: "Amount",
                              inputType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                              borderRadius: 5,
                              maxLines: 10,
                              controller: model.collectedAmountController,
                              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                              enabled: true,
                              onChanged: (String value){
                                if(value.isNotEmpty){
                                  model.enableSave.value = true;
                                }else{
                                  model.enableSave.value = false;
                                }
                              },             
                              ),
                            const SizedBox(height: 5),
                            AppTextField(
                              labelText: "Remarks",
                              hintText: "Remarks",
                              inputType: TextInputType.multiline,
                              borderRadius: 5,
                              maxLines: 10,
                              controller: model.remarksController,
                              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                              enabled: true,
                              onChanged: (String value){
                              },             
                              ),
                              const SizedBox(height: 5),
                            AppStreamBuilder<Resource>(
                            stream: model.commonSaveStream,
                            initialData: Resource.none(),
                            onError: (error) {},
                            dataBuilder: ((context, data) {
                              return ValueListenableBuilder(valueListenable: model.enableSave, builder: (context,bool isEnable,chld){
                                return AppButton(
                              title: "Save",
                              width: 100,
                              height: 30,
                              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                              busy: data?.status == Status.LOADING,
                              isEnable: isEnable,
                              onPressed: (){
                                try{
                                    if(int.parse(model.collectedAmountController.text)>int.parse(eachGeneratedLoan.dueamount)){
                                  model.showToastWithString("Collection amount should not be greater than due amount");
                                }else if(model.selectedPaymentType.value.isEmpty){
                                    model.showToastWithString("Please select Payment Type");
                                }else{
                                    model.saveData(eachGeneratedLoan);
                                }
                                }catch(e){
                                    model.showToastWithString("Something Went wrong, please try after some time");
                                }
                                      
                                    },);
                              });
                                  }),
                                ),
                                        ],
                                    )
                                    ),
            );
          },),
      );
        }
}