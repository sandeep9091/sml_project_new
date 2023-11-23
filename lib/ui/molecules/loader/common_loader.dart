import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spoorthymactcs/utils/asset_utils.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';
import '../../../utils/color_utils.dart';

class CommonLoader {
  CommonLoader(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColor.black.withOpacity(0.3),
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              elevation: 0.0,
              insetPadding: const EdgeInsets.symmetric(horizontal: 100),
              backgroundColor: AppColor.transparent,
              children: <Widget>[
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            AssetUtils.logoRound,
                            scale: 1,

                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("please Wait",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: FontUtils.primary.toString(),
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
