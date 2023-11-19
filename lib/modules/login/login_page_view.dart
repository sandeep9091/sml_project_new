import 'package:domain/model/login/login_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spoorthymactcs/common_utils/appButton.dart';
import 'package:spoorthymactcs/common_utils/appColors.dart';
import 'package:spoorthymactcs/common_utils/appTextField.dart';
import 'package:spoorthymactcs/main/navigation/app_router.dart';
import 'package:spoorthymactcs/ui/stream_builder/app_stream_builder.dart';
import 'package:spoorthymactcs/utils/resource.dart';

import '../../base/base_page.dart';
import '../../di/notifier/login_notifier.dart';
import '../../utils/asset_utils.dart';
import '../../utils/status.dart';
import 'login_page_view_model.dart';


class LoginPageView extends BasePageViewWidget<LoginPageViewModel> {
    const LoginPageView(ProviderBase model, {Key? key}) : super(model, key: key);


    @override
    Widget build(BuildContext context, model) {


        return WillPopScope(
        onWillPop: () async => false,
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start, 
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 150,
                          ),
                          Image.asset(
                          AssetUtils.logo,
                          width: 100,
                        ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Spoorthy Mactcs ltd.', style: TextStyle(color: AppColors.primaryText,fontSize: 30,fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 20,
                          ),
                          // Text("Greetings !!!", style: TextStyle(color: AppColors.primaryText,fontSize: 20,fontWeight: FontWeight.w500)),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
//                        padding: EdgeInsets.all(15),
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AppTextField(
                            labelText: "Employee ID",
                            hintText: "Enter Emlpoyee ID",
                            inputType: TextInputType.name,
                            borderRadius: 5,
                            controller: model.controllerUserName,
                            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                            onChanged: (String value){
                            },
                            //textStyle: TextStyle(color: AppColors.controlsHintColor, fontSize: 15),
                            prefixIcon: (){
                              return const Icon(
                                    Icons.account_circle_rounded,
                                    color: Colors.grey,
                                    size: 20,
                                  );
                            },
                            
                            ),
                            
                            const SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                            labelText: "Password",
                            hintText: "Enter Password",
                            inputType: TextInputType.name,
                            borderRadius: 5,
                            controller: model.controllerPassword,
                            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),

                            onChanged: (String value){
                              //model.suffixIconVisible.value = value.isNotEmpty;
                            },
                            //textStyle: TextStyle(color: AppColors.controlsHintColor, fontSize: 15),
                            prefixIcon: (){
                              return const Icon(
                                    Icons.enhanced_encryption,
                                    color: Colors.grey,
                                    size: 20,
                                  );
                            },
                            
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppStreamBuilder(
                        stream: model.loginStream, 
                        initialData: Resource.none(), 
                        onData: (data){
                          if(data.status == Status.SUCCESS){
List<LoginResponseData> loginData = ProviderScope.containerOf(context).read(loginNotifierProvider);
if(loginData.isNotEmpty){
  context.pushReplacementNamed(AppRoute.dashboard.name);
}
                          }else if(data.status == Status.ERROR){
model.showToastWithString("Something went wrong, Please try again");
                          }
                        },
                                dataBuilder: (context,data){
                          return AppButton(
                        backgroundColor: AppColors.primaryButton,
                        isEnable: true,
                        busy: data?.status == Status.LOADING,
                        borderRadius: 10,
                        width: MediaQuery.of(context).size.width * 0.90,
                        title: "Login",
                        onPressed: () {
                          if(model.controllerUserName.text.isNotEmpty && model.controllerPassword.text.isNotEmpty){
                            model.login();
                          }else{
                            model.showToastWithString("Please Enter User Details");
                          }
                        },
                        );
                        }),
                      

                    ])),
              ),
            ),
          ));
    }


}