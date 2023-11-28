import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:flutter/material.dart';
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

import 'companies_page_view_model.dart';

class CompaniesActionPage extends StatelessWidget {
  const CompaniesActionPage({super.key,this.eachCompany,required this.type});
  final CompaniesListResponseData? eachCompany;
  final String type;

  @override
  Widget build(BuildContext context) {
    CompaniesPageViewModel model = ProviderScope.containerOf(context).read(companiesViewModelProvider);
    final bool formEnabled = (type == "EDIT" || type == "ADD");
    if(type == "EDIT" || type == "VIEW"){
      model.controllerCompanyName.text = eachCompany?.cname ?? "";
      model.controllerCompanyCode.text = eachCompany?.ccode ?? "";
      model.controllerCompanyAddress.text = eachCompany?.cadress ?? "";
      model.controllerDescription.text = eachCompany?.decs ?? "";
      model.isActive.value = eachCompany?.active ?? false;
    }else{
      model.controllerCompanyName.text = "";
      model.controllerCompanyCode.text = "";
      model.controllerCompanyAddress.text = "";
      model.controllerDescription.text = "";
      model.isActive.value = true;
    }

    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(children: [
          AppTextField(
                labelText: "Company Name",
                inputType: TextInputType.name,
                borderRadius: 5,
                controller: model.controllerCompanyName,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Company Code",
                inputType: TextInputType.name,
                borderRadius: 5,
                controller: model.controllerCompanyCode,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Company Address",
                inputType: TextInputType.multiline,
                borderRadius: 5,
                maxLines: 10,
                controller: model.controllerCompanyAddress,
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
              if(model.controllerCompanyName.text.isNotEmpty && model.controllerCompanyCode.text.isNotEmpty && 
                    model.controllerCompanyAddress.text.isNotEmpty){
                  model.saveCompanyData(flag: type, eachCompany: eachCompany);
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