import 'package:flutter/material.dart';
import 'package:spoorthymactcs/ui/molecules/bottomSheet/app_bottom_sheet.dart';
import 'package:spoorthymactcs/ui/molecules/bottomSheet/photo_picker/photo_picker_bottomsheet_page.dart';

class PhotoPickerBottomSheet {
  PhotoPickerBottomSheet._();
  static show(BuildContext mContext, callback) {
    AppBottomSheet.showWithMargin(mContext,
        isDismissible: true,
        isScrollControlled: false,
        // constraints: BoxConstraints(
        //     minHeight: MediaQuery.of(mContext).size.height * 0.5),
        closeBottonEnable: false, builder: (context) {
      return PhotoPickerBottomSheetPage(
        (imgFile) => callback(imgFile),
      );
    });
  }
}
