import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/common_utils/appButton.dart';
import 'package:spoorthymactcs/common_utils/appTextField.dart';
import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/modules/borrowers/borrowers_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/app_checkbox.dart';
import 'package:spoorthymactcs/ui/molecules/app_dropdown.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
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
      model.controllerState.text = singleBorrower?.state ?? "";
      model.controllerDistrict.text = singleBorrower?.district ?? "";
      model.controllerPincode.text = singleBorrower?.pincode ?? "";
      model.controllerDescription.text = singleBorrower?.description ?? "";
      model.selectedBranch.value = singleBorrower?.branchId ?? "";
      model.isActive.value = singleBorrower?.active ?? false;
    }else{
      model.controllerBorrowerName.text = "";
      model.controllerBorrowerAadhar.text = "";
      model.controllerBorrowerContactNo.text = "";
      model.controllerCode.text = "";
      model.controllerState.text = "";
      model.controllerDistrict.text = "";
      model.controllerPincode.text = "";
      model.controllerDescription.text = "";
      model.selectedBranch.value = "";
      model.isActive.value = true;
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
                inputType: TextInputType.name,
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
                inputType: TextInputType.name,
                borderRadius: 5,
                maxLength: 10,
                controller: model.controllerBorrowerContactNo,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          ValueListenableBuilder(
                valueListenable: model.selectedBranch,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Branch",
                      dropdownHeight: 44,
                      hintText: "Select Branch",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: model.branchesList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['id']??"",
                            child: Text(e['name']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedBranch.value != "" &&
                              model.branchesList.any((element) => element['id'] == model.selectedBranch.value))
                          ? model.selectedBranch.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedBranch.value = newValue;
                      });
                }),
          AppTextField(
                labelText: "Code",
                inputType: TextInputType.number,
                borderRadius: 5,
                controller: model.controllerCode,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "State",
                inputType: TextInputType.name,
                borderRadius: 5,
                controller: model.controllerState,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "District",
                inputType: TextInputType.name,
                borderRadius: 5,
                controller: model.controllerDistrict,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Pincode",
                inputType: TextInputType.number,
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
                    model.controllerBorrowerAadhar.text.isNotEmpty && model.controllerState.text.isNotEmpty &&
                    model.controllerCode.text.isNotEmpty && model.controllerState.text.isNotEmpty &&
                    model.controllerDistrict.text.isNotEmpty && model.selectedBranch.value.isNotEmpty){
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