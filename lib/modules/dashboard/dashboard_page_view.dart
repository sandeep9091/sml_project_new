import 'package:domain/model/get_modules_response/dashboard_response.dart';
import 'package:domain/model/get_modules_response/get_modules_new_response.dart';
import 'package:domain/model/get_modules_response/get_modules_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/di/notifier/get_modules_notifier.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      backgroundColor: AppColor.primary,
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
    body: RefreshIndicator(
      onRefresh: () => model.callAllData(context),
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: Column(
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
          const GetDashboardWidget(),
          const SizedBox(height: 5,),
          Expanded(child: GetModulesWidget(model: model,))
        ],
      ),
    ),
    );
  }
}

class GetDashboardWidget extends ConsumerWidget {
  const GetDashboardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<GetDashboardResponseData> dashboardData = ref.watch(getDashboardNotifierProvider);
    if(dashboardData.isNotEmpty){
      return CarouselSlider.builder(
          options: CarouselOptions(
            autoPlay: true,height: 160,
            animateToClosest: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 5)),
          itemCount: dashboardData.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: AppColor.grey),
            borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dashboardData[itemIndex].header,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColor.semiGrey,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(dashboardData[itemIndex].cnt.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColor.semiBlack,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Today (new)',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiGrey,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(dashboardData[itemIndex].newCnt.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColor.semiBlack,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Last Week (new)',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiGrey,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(dashboardData[itemIndex].last7Cnt.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColor.semiBlack,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Active',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiGrey,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(dashboardData[itemIndex].activeCnt.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColor.semiBlack,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('In Active',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiGrey,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(dashboardData[itemIndex].inActiveCnt.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
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
        );
    }else{
      return const SizedBox();
    }
    
  }
}

class GetModulesWidget extends ConsumerWidget {
  const GetModulesWidget({super.key,required this.model});
  final DashboardPageViewModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<GetModulesNewResponseData> modulesData = ref.watch(getModulesNewNotifierProvider);

    List<Modules> filteredData = [];
    if(modulesData.isNotEmpty){
      filteredData = modulesData[0].modules.where((element) => element.isCanDo == "Y").toList();
    }
    if(modulesData.isNotEmpty){
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            alignment: Alignment.centerLeft,
            child: Text(
                  modulesData[0].cader,
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
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
                        model.renderModulePages(context,filteredData[index]);
                      },
                      child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      //padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      decoration: BoxDecoration(
                        color: AppColor.primary.withOpacity(0.05),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 2.0,color: AppColor.primary)
                      ),
                      child: Center(
                        child: Text(
                          filteredData[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                        color: AppColor.primary,
                        fontSize: 15,
                        fontFamily: FontUtils.primary,
                        fontWeight: FontWeight.bold,
                      ),
                        ),
                      ),
                                  ),
                    );
                }),
            ),
          ),
        ],
      );
    }else{
      return const SizedBox();
    }
    
  }
}
