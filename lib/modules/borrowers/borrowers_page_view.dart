import 'package:domain/model/get_modules_response/borrowers_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/base/base_page.dart';
import 'package:spoorthymactcs/modules/borrowers/borrowers_action_page.dart';
import 'package:spoorthymactcs/modules/borrowers/borrowers_page_view_model.dart';
import 'package:spoorthymactcs/ui/molecules/active_status_widget.dart';
import 'package:spoorthymactcs/ui/molecules/app_error_widget.dart';
import 'package:spoorthymactcs/ui/molecules/common_edit_view_button.dart';
import 'package:spoorthymactcs/ui/molecules/common_title_value_widget.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/resource.dart';
import 'package:spoorthymactcs/utils/status.dart';


class BorrowersPageView extends BasePageViewWidget<BorrowersPageViewModel> {
    const BorrowersPageView(ProviderBase model, {Key? key}) : super(model, key: key);


    @override
    Widget build(BuildContext context, model) {
      return AppStreamBuilder<Resource<BorrowersResponse>>(
        stream: model.borrowersStream, 
        initialData: Resource.none(), 
        dataBuilder: (context, data){
          if(data?.status == Status.SUCCESS){
            if(data!.data!.data.isNotEmpty){
              return ListView.builder(
                itemCount: data.data!.data.length,
                itemBuilder: (context, index){
                  BorrowersResponseData eachBorrower = data.data!.data[index];
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTitleValueWidget(title: "Name",value: eachBorrower.name,width: MediaQuery.of(context).size.width *.70,),
                          CommonEditViewButton(editButtonAction: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => BorrowersActionPage(singleBorrower: eachBorrower,type: "EDIT",)));
                          },viewButtonAction: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => BorrowersActionPage(singleBorrower: eachBorrower,type: "VIEW",)));
                          },)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        CommonTitleValueWidget(title: "Aadhar",value: eachBorrower.aadhar,width: MediaQuery.of(context).size.width *.45,),
                        CommonTitleValueWidget(title: "Contact",value: eachBorrower.contactNo,width: MediaQuery.of(context).size.width *.45,),
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        CommonTitleValueWidget(title: "Branch",value: eachBorrower.branchName,width: MediaQuery.of(context).size.width *.42,),
                        CommonTitleValueWidget(title: "Code",value: eachBorrower.ccode,width: MediaQuery.of(context).size.width *.30,),
                        ActiveStatusWidget(status: eachBorrower.active),
                      ],),
                      CommonTitleValueWidget(title: "Address",value: "${eachBorrower.district} / ${eachBorrower.state} / ${eachBorrower.pincode}",),
                      CommonTitleValueWidget(title: "Description",value: eachBorrower.description,),
                  
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