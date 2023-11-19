import 'package:domain/model/login/login_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    List<LoginResponseData> loginResponseData = ref.watch(loginNotifierProvider);
    LoginResponseData? loginData;
    if(loginResponseData.isNotEmpty){
      loginData = loginResponseData[0];
    }
    return Container(
      //height: double.maxFinite,
      color: AppColor.white,
      margin: const EdgeInsets.only(top: 20, left: 5, right: 0),
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //margin: const EdgeInsets.only(top: 20, left: 5, right: 0),
            //width: MediaQuery.of(context).size.width * 0.6,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () async {
                
              },
              minLeadingWidth: 5,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    loginData?.userInfo?.uname ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColor.semiBlack,
                      fontSize: 18,
                      fontFamily: FontUtils.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        loginData?.userInfo?.cadername ??"",
                        style: const TextStyle(
                          color: AppColor.semiBlack,
                          fontSize: 14,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
              leading: Container(
                child: Image.asset(
                  AssetUtils.logoRound,
                  //width: 50,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical:15,horizontal: 10),
            width: double.maxFinite,
            child: GestureDetector(
              onTap: () async{
                await AppCommonUtils().secureStorage().setValue(key: 'loginResponse',value: "");
                ProviderScope.containerOf(context).invalidate(loginNotifierProvider);
                context.goNamed(AppRoute.login.name);
              },
            child: const Text(
                        "Logout",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.semiBlack,
                          fontSize: 18,
                          fontFamily: FontUtils.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            ),
          )
        ],
      ),
    );
  }
}