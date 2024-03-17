import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/modules/branches/branches_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/active_status_widget.dart';
import 'package:spoorthymactcs/ui/molecules/app_error_widget.dart';
import 'package:spoorthymactcs/ui/molecules/common_edit_view_button.dart';
import 'package:spoorthymactcs/ui/molecules/common_title_value_widget.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';

import 'branches_action_page.dart';


class BranchesPageView extends BasePageViewWidget<BranchesPageViewModel> {
    const BranchesPageView(ProviderBase model, {Key? key}) : super(model, key: key);


    @override
    Widget build(BuildContext context, model) {
      return AppStreamBuilder<Resource<BranchesResponse>>(
        stream: model.branchesStream, 
        initialData: Resource.none(), 
        dataBuilder: (context, data){
          if(data?.status == Status.SUCCESS){
            if(data!.data!.data.isNotEmpty){
              return ListView.builder(
                itemCount: data.data?.data.length,
                itemBuilder: (context, index){
                  BranchesResponseData eachBranch = data.data!.data[index];
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
                          CommonTitleValueWidget(title: "Company",value: eachBranch.cname,width: MediaQuery.of(context).size.width *.70,),
                          CommonEditViewButton(
                            showEditButton: eachBranch.active,
                            editButtonAction: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => BranchesActionPage(singleBranch: eachBranch,type: "EDIT",)));
                          },viewButtonAction: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => BranchesActionPage(singleBranch: eachBranch,type: "VIEW",)));
                          },)
                        ],
                      ),
                      CommonTitleValueWidget(title: "Branch",value: "${eachBranch.bname} / ${eachBranch.bcode} / ${eachBranch.bOpnDt}",),
                      CommonTitleValueWidget(title: "Address",value: "${eachBranch.countryname} / ${eachBranch.state} / ${eachBranch.cityname}",),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTitleValueWidget(title: "Mobile",value: eachBranch.contactNo,width: MediaQuery.of(context).size.width *.37,),
                          CommonTitleValueWidget(title: "Pincode",value: eachBranch.pincode,width: MediaQuery.of(context).size.width *.37,),
                          ActiveStatusWidget(status: eachBranch.active),
                        ],
                      ),
                      CommonTitleValueWidget(title: "Description",value: eachBranch.desc,),
                  
                    ],
                  )
                  );
                });
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