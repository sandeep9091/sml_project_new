import 'package:domain/model/get_modules_response/get_teams_response.dart';
import 'package:domain/model/services/get_team_mapper_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/common_utils/appStyles.dart';
import 'package:spoorthymactcs/di/notifier/team_mapping_notifier.dart';
import 'package:spoorthymactcs/modules/create_team/create_team_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/app_checkbox.dart';
import 'package:spoorthymactcs/ui/molecules/app_dropdown.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';


class CreateTeamPageView extends BasePageViewWidget<CreateTeamPageViewModel> {
    const CreateTeamPageView(ProviderBase model, {Key? key}) : super(model, key: key);


    @override
    Widget build(BuildContext context, model) {

        return Container(
        padding: const EdgeInsets.only(left: 15, right: 15,top: 10),
        child: Column(children: [
          AppStreamBuilder(stream: model.branchesStream, 
          initialData: Resource.none(), 
          dataBuilder: (context,data){
            return ValueListenableBuilder(
                valueListenable: model.selectedBranch,
                builder: (BuildContext context, selectedValue, child) {
                  return AppDropDownWidget<dynamic>(
                      labelText: "Branch",
                      dropdownHeight: 44,
                      hintText: "Select Branch",
                      borderRadius: 6.0,
                      buttonBroderColor: AppColor.grey,
                      isMandatory: true,
                      isEnabled: true,
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
                        model.enableSave.value = false;
                        model.selectedBranch.value = newValue;
                        model.resetCheckBoxValue();
                        model.getTeams(newValue);
                      });
                });
          }),
          
          
          AppStreamBuilder<Resource<GetTeamsResponse>>(
            stream: model.getTeamsStream, 
          initialData: Resource.none(), 
          onData: (data){
            if(data.status == Status.SUCCESS && data.data?.data != null){
              GetTeamsResponseData? responseData = data.data?.data;
              if(responseData != null){
                if(responseData.caderList.isNotEmpty){
                  List<CaderData> caderData = ProviderScope.containerOf(context).read(teamMappingNotifierProvider);
                  List<CaderList> caderList = responseData.caderList;
                  if(caderData.isNotEmpty){
                    for (var mapperData in caderData) {
                      List<CaderList> mappingData = caderList.where((subCader) => subCader.cader == mapperData.id).toList();
                      if(mappingData.isNotEmpty){
                        for(var eachMainUser in mapperData.usersData){
                          for(var eachdummyuser in mappingData[0].userData){
                            if(eachMainUser.id ==eachdummyuser.id){
                              eachMainUser.isCheckBoxActive = eachdummyuser.isChecked;
                            }
                          }
                        }
                      }
                     }
                     debugPrint("data");
                  }
                } 
              }
            }
          },
          dataBuilder: (context,data){
              return ValueListenableBuilder(
                valueListenable: model.selectedBranch,
                builder: (BuildContext context, selectedValue, child) {
                  return Visibility(
                    visible: selectedValue.isNotEmpty,
                    child: MappingWidget(model: model));
                });           
          }),
          
        ]),
      );
    }
}

class MappingWidget extends ConsumerWidget {
  const MappingWidget({super.key,required this.model});
  final CreateTeamPageViewModel model;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    List<CaderData> caderData = ref.watch(teamMappingNotifierProvider);

    if(caderData.isNotEmpty){
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: 1),
            borderRadius: BorderRadius.circular(5.0)
          ),
          child: ListView.builder(
            itemCount: caderData.length,
            itemBuilder: (context, int index){
              return RenderEachCader(model: model,eachCaderData: caderData[index]);
          }),
        ),
      );
    }else{
      return Container();
    }
  }
}

class RenderEachCader extends StatelessWidget {
  const RenderEachCader({super.key,required this.model,required this.eachCaderData});
  final CreateTeamPageViewModel model;
  final CaderData eachCaderData;

  @override
  Widget build(BuildContext context) {


    Widget renderUsersWidget(List<UsersData> usersData){
      List<Widget> listData = [];

      for(var each in usersData){
        ValueNotifier<bool> isActive = ValueNotifier(false);
        isActive.value = each.isCheckBoxActive;
        listData.add(
          SizedBox(
            width: MediaQuery.of(context).size.width *.43,
            child: ValueListenableBuilder(
              valueListenable: isActive, 
              builder: (context, bool val, child){
                return AppCheckbox(
                  checkboxValue: each.isCheckBoxActive,
                  isEnabled: true,
                  checkboxText: each.uname,
                  onChangedMethod: (value){
                      //model.resetForSingleSelection(each.id,value);
                      if(eachCaderData.code == "BM"){
                        for(var eachUser in eachCaderData.usersData){
                          eachUser.isCheckBoxActive = false;
                        }
                      }
                      each.isCheckBoxActive = value;     
                      isActive.value = value;
                      model.enableSave.value = true;
                      if(eachCaderData.code == "BM"){
                        model.isResettedForSingleSelection.value = !model.isResettedForSingleSelection.value; 
                      } 
                      //ProviderScope.containerOf(context).read(teamMappingNotifierProvider.notifier).updateCheckBox(each,value);
                  });
              }),
          ),
          
        );
      }

      return Wrap(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: listData,
      );
    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            eachCaderData.cdname,
            textAlign: TextAlign.center,
            style: TextStyle(
            color: AppColor.primary,
            fontSize: 18,
            fontFamily: FontUtils.primary,
            fontWeight: FontWeight.bold,
        ),
          ),
          if(eachCaderData.usersData.isNotEmpty)
            ValueListenableBuilder(
              valueListenable: model.isResettedForSingleSelection, 
              builder: (context, bool val, child){
                return renderUsersWidget(eachCaderData.usersData);
              })
      ],
    );
  }
}