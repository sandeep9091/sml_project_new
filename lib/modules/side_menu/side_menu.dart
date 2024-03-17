import 'package:data/entity/remote/helper/device_helper.dart';
import 'package:domain/model/login/login_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoorthymactcs/di/notifier/get_modules_notifier.dart';
import 'package:spoorthymactcs/di/notifier/login_notifier.dart';
import 'package:spoorthymactcs/main/navigation/app_router.dart';

import '../../utils/asset_utils.dart';
import '../../utils/color_utils.dart';
import '../../utils/common_utils.dart';
import '../../utils/font_utils.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> isLoading = ValueNotifier(false);
    UserInfo? userInfo = ref.watch(loginUserInfoNotifierProvider);
    if(userInfo != null){
      return Container(
      //height: double.maxFinite,
      color: AppColor.white,
      margin: const EdgeInsets.only(top: 20, left: 5, right: 0),
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: const BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () async {
                    
                  },
                  minLeadingWidth: 0,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        userInfo?.uname ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                          color: AppColor.semiBlack,
                          fontSize: 20,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  leading: Image.asset(
                    AssetUtils.logoRound,
                    width: 50,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                    userInfo.userCader?.cdname ??"",
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      color: AppColor.yellowDark,
                      fontSize: 16,
                      fontFamily: FontUtils.primary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              const SizedBox(height: 5),
              Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Branch : ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.grey400,
                          fontSize: 14,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(userInfo.branchname,
                            style: const TextStyle(
                              color: AppColor.semiBlack,
                              fontSize: 14,
                              fontFamily: FontUtils.primary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                    ],
                  ),
              const SizedBox(height: 5),
              Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Signed In : ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.grey400,
                          fontSize: 14,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(AppCommonUtils.formatEpochToDateTime(userInfo?.loggTime??0),
                            style: const TextStyle(
                              color: AppColor.semiBlack,
                              fontSize: 14,
                              fontFamily: FontUtils.primary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                    ],
                  ),
              Divider(thickness: 1.0,color: AppColor.grey.withOpacity(0.5)),
                ]),
              ),
              
            ],
          ),
          GestureDetector(
            onTap: () async{
              isLoading.value = true;
              await AppCommonUtils().secureStorage().setValue(key: 'loginResponse',value: "");
              ref.invalidate(loginUserInfoNotifierProvider);
              ref.invalidate(getModulesNotifierProvider);
              ref.invalidate(getDashboardNotifierProvider);
              context.goNamed(AppRoute.login.name);
                    },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical:15,horizontal: 10),
              width: double.maxFinite,
              child: Column(
                children: [
                  Divider(thickness: 1.0,color: AppColor.grey.withOpacity(0.5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(Icons.logout,color: Colors.black,),
                             SizedBox(width: 5),
                            Text(
                                "Sign Out",
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontSize: 16,
                                  fontFamily: FontUtils.primary,
                                  fontWeight: FontWeight.bold,
                                  
                                ),
                              ),
                          ],
                        ),
                      ),
                      ValueListenableBuilder(
                                valueListenable: isLoading, 
                                builder: (context, bool isLoading, child){
                                  return isLoading?SizedBox(
                                    height: 17, width: 17,
                                    child: isLoading? const CircularProgressIndicator(strokeWidth: 2.0,): const SizedBox(),
                                  ):Text(AppCommonUtils().appVersion,
                                      style: const TextStyle(
                                        color: AppColor.grey400,
                                        fontSize: 14,
                                        fontFamily: FontUtils.primary,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                }),
                      
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
    }else{
      return const SizedBox.shrink();
    }
    
  }
}