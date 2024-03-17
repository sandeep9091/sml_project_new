import 'package:domain/model/get_modules_response/generate_loans_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/common_utils/appButton.dart';
import 'package:spoorthymactcs/common_utils/appTextField.dart';
import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/ui/molecules/app_checkbox.dart';
import 'package:spoorthymactcs/ui/molecules/app_dropdown.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/common_lists.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

import 'disbursements_page_view_model.dart';


class DisbursementsActionPage extends StatelessWidget {
  const DisbursementsActionPage({super.key,this.eachGeneratedLoan,required this.type});
  final GenerateLoansResponseData? eachGeneratedLoan;
  final String type;

  @override
  Widget build(BuildContext context) {
    DisbursementsPageViewModel model = ProviderScope.containerOf(context).read(disbursementsViewModelProvider);
    final bool formEnabled = (type == "EDIT" || type == "ADD");
    if(type == "EDIT" || type == "VIEW"){
      model.controllerDescription.text = eachGeneratedLoan?.description ?? "";
      model.controllerSmtCode.text = eachGeneratedLoan?.smtcode ?? "";
      model.controllerbank.text = eachGeneratedLoan?.bankname ?? "";
      model.controllerAccountNo.text = eachGeneratedLoan?.accountno ?? "";
      model.controllerAccountName.text = eachGeneratedLoan?.accountname ?? "";
      model.controllerIfscCode.text = eachGeneratedLoan?.ifsc ?? "";
      model.controllerSurityName.text = eachGeneratedLoan?.surityname ?? "";
      model.controllerSurityAadhar.text = eachGeneratedLoan?.surityaadhar ?? "";
      model.controllerSurityContactNo.text = eachGeneratedLoan?.contactnumber ?? "";
      model.isActive.value = eachGeneratedLoan?.active ?? false;
      model.selectedBorrowerName.value = eachGeneratedLoan?.borrowername ?? "";
      model.selectedHouseType.value = model.getValueFromId(eachGeneratedLoan?.housetype) ;
      model.selectedProductType.value = model.getValueFromId(eachGeneratedLoan?.prodtype) ;
      model.selectedDeposit.value = model.getValueFromId(eachGeneratedLoan?.deposit) ;
      model.selectedLoanAmount.value = model.getValueFromId(eachGeneratedLoan?.loanamount) ;
      model.selectedRepayMode.value = model.getValueFromId(eachGeneratedLoan?.loanschedule) ;
      model.selectedLoanTenure.value = model.getValueFromId(eachGeneratedLoan?.tenure) ;
      model.selectedSurityHouseType.value = model.getValueFromId(eachGeneratedLoan?.surityhousetype) ;
    }else{
      model.controllerSmtCode.text = "";
      model.controllerDescription.text = "";
      model.controllerbank.text = "";
      model.controllerAccountNo.text = "";
      model.controllerAccountName.text = "";
      model.controllerIfscCode.text = "";
      model.controllerSurityName.text = "";
      model.controllerSurityAadhar.text = "";
      model.controllerSurityContactNo.text = "";
      model.isActive.value = true;
      model.selectedBorrowerName.value = "";
      model.selectedBorrower = "";
      model.selectedHouseType.value = 0;
      model.selectedProductType.value = 0;
      model.selectedDeposit.value = 0;
      model.selectedLoanAmount.value = 0;
      model.selectedRepayMode.value = 0;
      model.selectedLoanTenure.value = 0;
      model.selectedSurityHouseType.value = 0;
    }

    return Scaffold(
      appBar: const CommonAppBar(
        enalbeTitle: true,
        titleWidget: Text("Disbursements (Approved loans)"),
      ),
      body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: Column(children: [
          ValueListenableBuilder(
                valueListenable: model.selectedBorrowerName,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Borrower",
                      dropdownHeight: 44,
                      hintText: "Select Borrower",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: model.borrowersList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e.id,
                            child: Text(e.name),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedBorrowerName.value != "" &&
                              model.borrowersList.any((element) => element.id == model.selectedBorrowerName.value))
                          ? model.selectedBorrowerName.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedBorrowerName.value = newValue;
                        model.selectedBorrower = model.borrowersList.firstWhere((element) => element.id == model.selectedBorrowerName.value).name;
                      });
                }),
          AppTextField(
                labelText: "SMT CODE",
                inputType: TextInputType.name,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))],
                borderRadius: 5,
                controller: model.controllerSmtCode,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                enabled: false,
                onChanged: (String value){
                },             
                ),
          ValueListenableBuilder(
                valueListenable: model.selectedHouseType,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "House type",
                      dropdownHeight: 44,
                      hintText: "Select House type",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: CommonLists.houseTypeList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['value']??"",
                            child: Text(e['label']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedHouseType.value != 0 &&
                              CommonLists.houseTypeList.any((element) => element['value'] == model.selectedHouseType.value))
                          ? model.selectedHouseType.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedHouseType.value = newValue;
                      });
                }),
          ValueListenableBuilder(
                valueListenable: model.selectedProductType,
                builder: (BuildContext context, selectedValue, child) {
                  return Column(
                    children: [
                      AppDropDownWidget<dynamic>(
                          labelText: "Product type",
                          dropdownHeight: 44,
                          hintText: "Select Product type",
                          borderRadius: 6.0,
                          buttonBroderColor: AppColor.grey,
                          isMandatory: true,
                          isEnabled: formEnabled,
                          dropDownitems: CommonLists.productTypeList.map(
                              (e) => DropdownMenuItem<dynamic>(
                                value: e['value']??"",
                                child: Text(e['label']??""),
                              ),
                            ).toList(),
                          selectedValue: (model.selectedProductType.value != 0 &&
                                  CommonLists.productTypeList.any((element) => element['value'] == model.selectedProductType.value))
                              ? model.selectedProductType.value
                              : null,
                          onChangedMethod: (newValue) {
                            model.selectedProductType.value = newValue;
                            model.selectedDeposit.value = newValue == 1?model.selectedDeposit.value:0;
                          }),
                    ValueListenableBuilder(
                valueListenable: model.selectedDeposit,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Deposit List",
                      dropdownHeight: 44,
                      hintText: "Select Deposit",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isEnabled: model.selectedProductType.value == 1 && formEnabled,
                      dropDownitems: CommonLists.despositList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['value']??"",
                            child: Text(e['label']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedDeposit.value != 0 &&
                              CommonLists.despositList.any((element) => element['value'] == model.selectedDeposit.value))
                          ? model.selectedDeposit.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedDeposit.value = newValue;
                      });
                }),
                    ],
                  );
                }),
          
          ValueListenableBuilder(
                valueListenable: model.selectedLoanAmount,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Loan Amount",
                      dropdownHeight: 44,
                      hintText: "Select Loan Amount",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: CommonLists.loanAmountList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['value']??"",
                            child: Text(e['label']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedLoanAmount.value != 0 &&
                              CommonLists.loanAmountList.any((element) => element['value'] == model.selectedLoanAmount.value))
                          ? model.selectedLoanAmount.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedLoanAmount.value = newValue;
                      });
                }),
          ValueListenableBuilder(
                valueListenable: model.selectedRepayMode,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Repay Mode",
                      dropdownHeight: 44,
                      hintText: "Select Repay Mode",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: CommonLists.loanSheduleList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['value']??"",
                            child: Text(e['label']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedRepayMode.value != 0 &&
                              CommonLists.loanSheduleList.any((element) => element['value'] == model.selectedRepayMode.value))
                          ? model.selectedRepayMode.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedRepayMode.value = newValue;
                      });
                }),
          ValueListenableBuilder(
                valueListenable: model.selectedLoanTenure,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Loan tenure",
                      dropdownHeight: 44,
                      hintText: "Select Loan tenure",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: CommonLists.tenureList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['value']??"",
                            child: Text(e['label']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedLoanTenure.value != 0 &&
                              CommonLists.tenureList.any((element) => element['value'] == model.selectedLoanTenure.value))
                          ? model.selectedLoanTenure.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedLoanTenure.value = newValue;
                      });
                }),
          AppTextField(
                labelText: "Bank",
                inputType: TextInputType.name,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))],
                borderRadius: 5,
                controller: model.controllerbank,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                enabled: formEnabled,
                isMandatory: true,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Account no",
                inputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                borderRadius: 5,
                controller: model.controllerAccountNo,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                enabled: formEnabled,
                isMandatory: true,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Bank Account Name",
                inputType: TextInputType.name,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))],
                borderRadius: 5,
                controller: model.controllerAccountName,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                enabled: formEnabled,
                isMandatory: true,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "IFSC Code",
                inputType: TextInputType.name,
                borderRadius: 5,
                controller: model.controllerIfscCode,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                enabled: formEnabled,
                isMandatory: true,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Surity Name",
                inputType: TextInputType.name,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))],
                borderRadius: 5,
                controller: model.controllerSurityName,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                enabled: formEnabled,
                isMandatory: true,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Surity Aadhar",
                inputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                borderRadius: 5,
                maxLength: 12,
                controller: model.controllerSurityAadhar,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                enabled: formEnabled,
                isMandatory: true,
                onChanged: (String value){
                },             
                ),
          ValueListenableBuilder(
                valueListenable: model.selectedSurityHouseType,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Surity House type",
                      dropdownHeight: 44,
                      hintText: "Select Surity House type",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: CommonLists.houseTypeList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['value']??"",
                            child: Text(e['label']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedSurityHouseType.value != 0 &&
                              CommonLists.houseTypeList.any((element) => element['value'] == model.selectedSurityHouseType.value))
                          ? model.selectedSurityHouseType.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedSurityHouseType.value = newValue;
                      });
                }),
          AppTextField(
                labelText: "Surity Contact no",
                inputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                borderRadius: 5,
                maxLength: 10,
                controller: model.controllerSurityContactNo,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                enabled: formEnabled,
                isMandatory: true,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Description",
                inputType: TextInputType.multiline,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))],
                borderRadius: 5,
                maxLines: 10,
                controller: model.controllerDescription,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          ValueListenableBuilder(
            valueListenable: model.isActive, 
            builder: (context, isActive, child){
              return AppCheckbox(
                checkboxValue: model.isActive.value,
                isEnabled: (type == "EDIT"),
                onChangedMethod: (value){
                    model.isActive.value = value;
                });
            }), 
          const SizedBox(height: 10),
          ValueListenableBuilder(
                valueListenable: model.selectedPaymentType,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Payment Type",
                      dropdownHeight: 44,
                      hintText: "Select Payment Type",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: true,
                      dropDownitems: CommonLists.paymentType.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['value']??"",
                            child: Text(e['label']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedPaymentType.value != "" &&
                              CommonLists.paymentType.any((element) => element['value'] == model.selectedPaymentType.value))
                          ? model.selectedPaymentType.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedPaymentType.value = newValue;
                      });
                }),
          ValueListenableBuilder(
                valueListenable: model.selectedDisbursementStatus,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Disbursement Status",
                      dropdownHeight: 44,
                      hintText: "Select Disbursement Status",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: true,
                      dropDownitems: CommonLists.disbursementStatusList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['value']??"",
                            child: Text(e['label']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedDisbursementStatus.value != "" &&
                              CommonLists.disbursementStatusList.any((element) => element['value'] == model.selectedDisbursementStatus.value))
                          ? model.selectedDisbursementStatus.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedDisbursementStatus.value = newValue;
                      });
                }),
          AppTextField(
                labelText: "Disbursement remarks",
                inputType: TextInputType.multiline,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"))],
                borderRadius: 5,
                maxLines: 10,
                controller: model.controllerDisbursementRemarks,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                enabled: true,
                onChanged: (String value){
                },             
                ),
          const SizedBox(height: 20),
          AppStreamBuilder<Resource>(
          stream: model.commonSaveStream,
          initialData: Resource.none(),
          onError: (error) {},
          dataBuilder: ((context, data) {
            return AppButton(
            title: "Submit Status",
            busy: data?.status == Status.LOADING,
            isEnable: true,
            onPressed: (){
              if(model.selectedPaymentType.value !=0 && model.selectedDisbursementStatus.value != ""){
                 model.saveGenerateLoanData(eachGeneratedLoan);
              }else{
                model.showToastWithString("Some Fields are missing");
              }
            },);
          }),
        ),
          const SizedBox(height: 10),
        ]),
      ),
    )
  );
  }
}