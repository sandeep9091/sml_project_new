import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spoorthymactcs/utils/asset_utils.dart';

import '../../base/base_page.dart';
import 'splash_page_model.dart';

class SplashPageView extends BasePageViewWidget<SplashViewModel> {
  const SplashPageView(ProviderBase model, {Key? key}) : super(model, key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AssetUtils.logo,
                        //width: 50,
                      ),
      ],
    );
  }
}
