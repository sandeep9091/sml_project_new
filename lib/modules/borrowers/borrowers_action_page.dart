import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spoorthymactcs/common_utils/appButton.dart';
import 'package:spoorthymactcs/common_utils/appTextField.dart';
import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/modules/borrowers/borrowers_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/app_checkbox.dart';
import 'package:spoorthymactcs/ui/molecules/app_dropdown.dart';
import 'package:spoorthymactcs/ui/molecules/bottomSheet/photo_picker/photo_picker_bottomsheet.dart';
import 'package:spoorthymactcs/ui/molecules/choose_photo_widget.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';
import 'package:spoorthymactcs/ui/molecules/show_photo_widget.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/common_utils.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

class BorrowersActionPage extends StatelessWidget {
  const BorrowersActionPage({super.key,this.singleBorrower,required this.type});
  final BorrowersResponseData? singleBorrower;
  final String type;

  @override
  Widget build(BuildContext context) {
    BorrowersPageViewModel model = ProviderScope.containerOf(context).read(borrowersViewModelProvider);
    final bool formEnabled = (type == "EDIT" || type == "ADD");
    if(type == "EDIT" || type == "VIEW"){
      model.controllerBorrowerName.text = singleBorrower?.name ?? "";
      model.controllerBorrowerAadhar.text = singleBorrower?.aadhar.replaceAll(RegExp(r'-'),'') ?? "";
      model.controllerBorrowerContactNo.text = singleBorrower?.contactNo ?? "";
      model.controllerCode.text = singleBorrower?.ccode ?? "";
      model.controllerPincode.text = singleBorrower?.pincode ?? "";
      model.controllerDescription.text = singleBorrower?.description ?? "";
      model.isActive.value = singleBorrower?.active ?? false;
      model.filePathAadhar.value = singleBorrower?.aadharPhoto;
      model.filePathRationCard.value = singleBorrower?.rationCardPhoto;
      model.filePathHouseTaxReceipt.value = singleBorrower?.houseTaxReceiptPhoto;
      model.filePathLoanApplication.value = singleBorrower?.loanApplicationPhoto;
      model.filePathHousePhoto.value = singleBorrower?.housePhoto;
      model.filePathPassportPhoto.value = singleBorrower?.passportPhoto;
      model.filePathOthers.value = singleBorrower?.othersPhoto;
      model.updateStateCityData(singleBorrower?.cityname??"");
    }else{
      model.controllerBorrowerName.text = "";
      model.controllerBorrowerAadhar.text = "";
      model.controllerBorrowerContactNo.text = "";
      model.controllerCode.text = "";
      model.selectedCountry.value = "";
      model.selectedState.value = "";
      model.selectedCity.value = "";
      model.controllerPincode.text = "";
      model.controllerDescription.text = "";
      model.selectedBranch.value = "";
      model.isActive.value = true;
      model.filePathAadhar.value = null;
      model.filePathRationCard.value = null;
      model.filePathHouseTaxReceipt.value = null;
      model.filePathLoanApplication.value = null;
      model.filePathHousePhoto.value = null;
      model.filePathPassportPhoto.value = null;
      model.filePathOthers.value = null;
    }

    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(children: [
          AppTextField(
                labelText: "Borrower Name",
                inputType: TextInputType.name,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))],
                borderRadius: 5,
                controller: model.controllerBorrowerName,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Borrower Aadhaar",
                inputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                borderRadius: 5,
                maxLength: 12,
                controller: model.controllerBorrowerAadhar,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Borrower Contact No",
                inputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                borderRadius: 5,
                maxLength: 10,
                controller: model.controllerBorrowerContactNo,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          // ValueListenableBuilder(
          //       valueListenable: model.selectedBranch,
          //       builder: (BuildContext context, selectedValue, child) {
          //         return AppDropDownWidget<dynamic>(
          //             labelText: "Branch",
          //             dropdownHeight: 44,
          //             hintText: "Select Branch",
          //             borderRadius: 6.0,
          //             buttonBroderColor: AppColor.grey,
          //             isMandatory: true,
          //             isEnabled: formEnabled,
          //             dropDownitems: model.branchesList.map(
          //                 (e) => DropdownMenuItem<dynamic>(
          //                   value: e['id']??"",
          //                   child: Text(e['name']??""),
          //                 ),
          //               ).toList(),
          //             selectedValue: (model.selectedBranch.value != "" &&
          //                     model.branchesList.any((element) => element['id'] == model.selectedBranch.value))
          //                 ? model.selectedBranch.value
          //                 : null,
          //             onChangedMethod: (newValue) {
          //               model.selectedBranch.value = newValue;
          //             });
          //       }),
          // AppTextField(
          //       labelText: "Code",
          //       inputType: TextInputType.name,
          //       inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"))],
          //       borderRadius: 5,
          //       controller: model.controllerCode,
          //       padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
          //       isMandatory: true,
          //       enabled: formEnabled,
          //       onChanged: (String value){
          //       },             
          //       ),
          ValueListenableBuilder(
                valueListenable: model.selectedCountry,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Country",
                      dropdownHeight: 44,
                      hintText: "Select Country",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: model.countryList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['name']??"",
                            child: Text(e['name']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedCountry.value != "" &&
                              model.countryList.any((element) => element['name'] == model.selectedCountry.value))
                          ? model.selectedCountry.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedCountry.value = newValue;
                        model.stateList = [];
                        model.cityList = [];                        
                        model.filterStatesList();
                      });
                }),
          ValueListenableBuilder(
                valueListenable: model.isStateselected,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "State",
                      dropdownHeight: 44,
                      hintText: "Select State",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: model.stateList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e.name??"",
                            child: Text(e.name??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedState.value != "" &&
                              model.stateList.any((element) => element.name == model.selectedState.value))
                          ? model.selectedState.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedState.value = newValue;
                        model.cityList = [];
                        model.filterCitiesList();                        
                      });
                }),
          ValueListenableBuilder(
                valueListenable: model.isCitySelected,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "City",
                      dropdownHeight: 44,
                      hintText: "Select City",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: model.cityList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e.code??"",
                            child: Text(e.cname??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedCity.value != "" &&
                              model.cityList.any((element) => element.code == model.selectedCity.value))
                          ? model.selectedCity.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedCity.value = newValue;
                      });
                }),
          AppTextField(
                labelText: "Pincode",
                inputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                borderRadius: 5,
                maxLength: 6,
                controller: model.controllerPincode,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
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
          const SizedBox(height: 20),
          UploadsWidget(model: model),
          const SizedBox(height: 20),
          AppStreamBuilder<Resource>(
          stream: model.commonSaveStream,
          initialData: Resource.none(),
          onError: (error) {},
          dataBuilder: ((context, data) {
            return AppButton(
            title: "Save",
            busy: data?.status == Status.LOADING,
            isEnable: formEnabled,
            onPressed: (){
              if(model.controllerBorrowerName.text.isNotEmpty && model.controllerBorrowerContactNo.text.isNotEmpty && 
                    model.controllerBorrowerAadhar.text.isNotEmpty && model.selectedCity.value.isNotEmpty 
                    && model.controllerPincode.text.isNotEmpty){
                  model.saveBorrowersData(flag: type, singleBorrower: singleBorrower);
              }else{
                model.showToastWithString("Some Fields are missing");
              }
            },);
          }),
        ),
          
        ]),
      ),
    )
  );
  }
}

class UploadsWidget extends StatelessWidget {
  const UploadsWidget({super.key,required this.model});
  final BorrowersPageViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('KYC Uploads', style: TextStyle(color: AppColor.primaryText,fontSize: 20,fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        EachFileUploadWidget(title: "Aadhar",valueListener: model.filePathAadhar),
        EachFileUploadWidget(title: "Ration Card",valueListener: model.filePathRationCard),
        EachFileUploadWidget(title: "House Tax Reciept",valueListener: model.filePathHouseTaxReceipt),
        EachFileUploadWidget(title: "Loan Application",valueListener: model.filePathLoanApplication),
        EachFileUploadWidget(title: "House Photo",valueListener: model.filePathHousePhoto),
        EachFileUploadWidget(title: "Passport Photo",valueListener: model.filePathPassportPhoto),
        EachFileUploadWidget(title: "Others",valueListener: model.filePathOthers)
      ],
    );
  }
}

class EachFileUploadWidget extends StatelessWidget {
  const EachFileUploadWidget({super.key,required this.valueListener,required this.title});
  final ValueNotifier<String?> valueListener;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: ValueListenableBuilder(valueListenable: valueListener, builder: (ctx, String? value, child){
            if(value != null){
            return ShowPhotoWidget(title: title,base64Data: value,onTap: () => valueListener.value = null,);
            }else{
            return ChoosePhotoWidget(title: title,(File imageFile) {
                      valueListener.value = AppCommonUtils().getBase64String(imageFile);
                      context.pop();
            },);
            }
          }),
    );
  }
}