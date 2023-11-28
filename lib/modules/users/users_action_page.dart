import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/model/get_modules_response/users_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spoorthymactcs/common_utils/appButton.dart';
import 'package:spoorthymactcs/common_utils/appTextField.dart';
import 'package:spoorthymactcs/di/login/login_modules.dart';
import 'package:spoorthymactcs/modules/users/users_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/app_checkbox.dart';
import 'package:spoorthymactcs/ui/molecules/app_dropdown.dart';
import 'package:spoorthymactcs/ui/molecules/common_app_bar.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

class UsersActionPage extends StatelessWidget {
  const UsersActionPage({super.key,this.singleUser,required this.type});
  final UsersListResponseData? singleUser;
  final String type;

  @override
  Widget build(BuildContext context) {
    UsersPageViewModel model = ProviderScope.containerOf(context).read(usersViewModelProvider);
    final bool formEnabled = (type == "EDIT" || type == "ADD");
    if(type == "EDIT" || type == "VIEW"){
      model.controllerUserName.text = singleUser?.uname ?? "";
      model.controllerPassword.text = singleUser?.password ?? "";
      model.controllerDescription.text = singleUser?.desc ?? "";
      model.selectedGender.value = singleUser?.gender ?? "";
      model.selectedCadre.value = singleUser?.cader ?? "";
      model.isActive.value = singleUser?.active ?? false;
    }else{
      model.controllerUserName.text = "";
      model.controllerPassword.text = "";
      model.controllerDescription.text = "";
      model.selectedGender.value = "";
      model.selectedCadre.value = "";
      model.isActive.value = true;
    }

    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(children: [
          AppTextField(
                labelText: "User Name",
                //hintText: "Enter User Name",
                inputType: TextInputType.name,
                borderRadius: 5,
                controller: model.controllerUserName,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          AppTextField(
                labelText: "Password",
                //hintText: "Enter User Name",
                inputType: TextInputType.name,
                borderRadius: 5,
                controller: model.controllerPassword,
                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                isMandatory: true,
                enabled: formEnabled,
                onChanged: (String value){
                },             
                ),
          ValueListenableBuilder(
                valueListenable: model.selectedGender,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Gender",
                      dropdownHeight: 44,
                      hintText: "Select Gender",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: model.genderList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['id']??"",
                            child: Text(e['name']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedGender.value != "" &&
                              model.genderList.any((element) => element['id'] == model.selectedGender.value))
                          ? model.selectedGender.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedGender.value = newValue;
                      });
                }),
          ValueListenableBuilder(
                valueListenable: model.selectedCadre,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Cadre",
                      dropdownHeight: 44,
                      hintText: "Select Cadre",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: formEnabled,
                      dropDownitems: model.cadreList.map(
                          (e) => DropdownMenuItem<dynamic>(
                            value: e['id']??"",
                            child: Text(e['name']??""),
                          ),
                        ).toList(),
                      selectedValue: (model.selectedCadre.value != "" &&
                              model.cadreList.any((element) => element['id'] == model.selectedCadre.value))
                          ? model.selectedCadre.value
                          : null,
                      onChangedMethod: (newValue) {
                        model.selectedCadre.value = newValue;
                      });
                }),
          AppTextField(
                labelText: "Description",
                //hintText: "Enter User Name",
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
              if(model.controllerUserName.text.isNotEmpty && model.controllerPassword.text.isNotEmpty && 
                    model.selectedGender.value.isNotEmpty && model.selectedCadre.value.isNotEmpty){
                  model.saveUserData(flag: type, singleUser: singleUser);
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