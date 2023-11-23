import 'package:spoorthymactcs/ui/molecules/app_toast.dart';

import '../../base/base_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension PageExtensions on BaseStatefulPage {
  showShortToast(String message) {
    /// TODO:: SHOW SHORT TOAST
  }

  showLongToast(String message) {
    /// TODO:: SHOW LONG TOAST
  }

  showToast(String message, {Toast toastDuration = Toast.LENGTH_LONG}) async {
    await AppToast.showToast(message, duration: toastDuration);
  }
}
