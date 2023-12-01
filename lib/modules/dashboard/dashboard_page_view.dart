import 'package:domain/model/get_modules_response/get_modules_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/di/notifier/get_modules_notifier.dart';

import '../../base/base_page.dart';
import '../../utils/asset_utils.dart';
import '../../utils/color_utils.dart';
import '../../utils/font_utils.dart';
import 'dashboard_page_view_model.dart';

class DashboardPageView extends BasePageViewWidget<DashboardPageViewModel> {
  const DashboardPageView(ProviderBase model, {Key? key}) : super(model, key: key);

  @override
  Widget build(BuildContext context, model) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: AppColor.blue,
      centerTitle: true,
      title: const Text("SML"),
      leading: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Container(
          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(width: 2, color: AppColor.white)),
                          child: Image.asset(
                    AssetUtils.logoRound,
                    //width: 50,
                  )),
      ),
    ),
    body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // AppStreamBuilder<Resource<UserData>>(
        //   stream: model.userData,
        //   initialData: Resource.none(),
        //   onData: (response) {
        //     debugPrint(
        //         "Status : ${response.status} : Data{PerPage}: ${response.data?.perPage}");
        //   },
        //   onError: (error) {},
        //   dataBuilder: ((context, data) {
        //     if (data?.status == Status.LOADING) {
        //       return const CircularProgressIndicator();
        //     }
        //     if (data?.data == null) {
        //       return const CircularProgressIndicator();
        //     }
        //     return Column(
        //         children:
        //             data!.data!.data!.map((e) => Text(e.totalName)).toList());
        //   }),
        // ),
        
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: AppColor.grey),
            borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child: const Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                        'Clients',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiGrey,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '12',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiBlack,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                        'Since Last Visit',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiGrey,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '24',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiBlack,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: AppColor.grey),
            borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child: const Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                        'Transactions',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiGrey,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '12',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiBlack,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                        'Since Last Visit',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiGrey,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '4',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiBlack,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          ]),
        ),
        const SizedBox(height: 5,),
        Expanded(child: GetModulesWidget(model: model,))
      ],
    ),
    );
  }
}

class GetModulesWidget extends ConsumerWidget {
  const GetModulesWidget({super.key,required this.model});
  final DashboardPageViewModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<GetModulesResponseData> modulesData = ref.watch(getModulesNotifierProvider);
    if(modulesData.isNotEmpty){
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            alignment: Alignment.centerLeft,
            child: Text(
                  modulesData[0].mdname,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 18,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: modulesData[0].mdchilds.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    
                  ),
              itemBuilder: (BuildContext context, int index){
                  List<MdChilds> mdchilds = modulesData[0].mdchilds;
                  return GestureDetector(
                    onTap: (){
                      model.renderModulePages(context,mdchilds[index]);
                    },
                    child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    //padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColor.blue.withOpacity(0.05),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 2.0,color: AppColor.blue)
                    ),
                    child: Center(
                      child: Text(
                        mdchilds[index].submdname,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                      color: AppColor.blue,
                      fontSize: 18,
                      fontFamily: FontUtils.primary,
                      fontWeight: FontWeight.bold,
                    ),
                      ),
                    ),
                                ),
                  );
              }),
          ),
        ],
      );
    }else{
      return const SizedBox();
    }
    
  }
}
