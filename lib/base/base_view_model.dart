import 'package:flutter/cupertino.dart';

class BaseViewModel extends ChangeNotifier {
  BuildContext? modelcontext;
  bool alReadyLoaded = false;

  void setContext(BuildContext context) {
    modelcontext = context;
  }

  BuildContext? getContext() => modelcontext;

  void onInit(Function oninit) {
    oninit.call();
  }
}
