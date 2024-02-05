import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spoorthymactcs/common_utils/appButton.dart';
import 'package:spoorthymactcs/common_utils/appTextField.dart';
import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/ui/molecules/app_checkbox.dart';
import 'package:spoorthymactcs/ui/molecules/app_dropdown.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

import 'branches_page_view_model.dart';

class BranchesActionPage extends StatelessWidget {
  const BranchesActionPage({super.key,this.singleBranch,required this.type});
  final BranchesResponseData? singleBranch;
  final String type;

  Future<void> selectDate(BuildContext context, BranchesPageViewModel model) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: model.selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: child!,
          );
      },
    );
    if (picked != null && picked != model.selectedDate) {
      model.selectedDate = picked;
      model.getStringFromDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    BranchesPageViewModel model = ProviderScope.containerOf(context).read(branchesViewModelProvider);
    final bool formEnabled = (type == "EDIT" || type == "ADD");
    if(type == "EDIT" || type == "VIEW"){
      model.controllerBranchName.text = singleBranch?.bname ?? "";
      model.controllerBranchCode.text = singleBranch?.bcode ?? "";
      model.controllerBranchDate.text = singleBranch?.bOpnDt ?? "";
      model.controllerContactNumber.text = singleBranch?.contactNo ?? "";
      model.controllerPincode.text = singleBranch?.pincode ?? "";
      model.controllerDescription.text = singleBranch?.desc ?? "";
      model.selectedCompany.value = singleBranch?.cId ?? "";
      model.isActive.value = singleBranch?.active ?? false;
      model.updateStateCityData(singleBranch?.cityname??"");
    }else{
      model.controllerBranchName.text = "";
      model.controllerBranchCode.text = "";
      model.controllerContactNumber.text = "";
      model.selectedCountry.value = "";
      model.selectedState.value = "";
      model.selectedCity.value = "";
      model.controllerPincode.text = "";
      model.controllerDescription.text = "";
      model.selectedCompany.value = "";
      //model.selectedCadre.value = "";
      model.isActive.value = true;
    }

    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(children: [
          ValueListenableBuilder(
                valueListenable: model.selectedCompany,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Company",
                      dropdownHeight: 44,
                      hintText: "Select Company",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: model.companiesList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['id']??"",
                            child: Text(e['name']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedCompany.value != "" &&
                              model.companiesList.any((element) => element['id'] == model.selectedCompany.value))
                          ? model.selectedCompany.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedCompany.value = newValue;
                      });
                }),
          AppTextField(
                labelText: "Branch Name",
                inputType: TextInputType.name,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))],
                borderRadius: 5,
                controller: model.controllerBranchName,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Branch Code",
                inputType: TextInputType.name,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"))],
                borderRadius: 5,
                controller: model.controllerBranchCode,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          AppTextField(
              labelText: "Branch Opened On",
              controller: model.controllerBranchDate,
              inputType: TextInputType.text,
              borderRadius: 5.0,
              enabled: false,
              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
              onFieldSubmitted: (p0) {},
              suffixIcon: (enabled, value) =>
                  const Icon(Icons.edit_calendar_rounded,color: AppColor.grey),
              onTap: () async {
                selectDate(context, model);
              },
            ),
          AppTextField(
                labelText: "Contact No",
                inputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                borderRadius: 5,
                maxLength: 10,
                controller: model.controllerContactNumber,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
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
              if(model.controllerBranchName.text.isNotEmpty && model.controllerBranchCode.text.isNotEmpty && 
                    model.controllerContactNumber.text.isNotEmpty && model.selectedCity.value.isNotEmpty && model.controllerPincode.text.isNotEmpty){
                  model.saveBranchesData(flag: type, singleBranch: singleBranch);
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