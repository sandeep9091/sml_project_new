import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spoorthymactcs/ui/molecules/bottomSheet/photo_picker/photo_picker_bottomsheet.dart';
import 'package:spoorthymactcs/utils/color_utils.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';

class ChoosePhotoWidget extends StatelessWidget {
  const ChoosePhotoWidget(this.callback, {super.key, required this.title, this.buttonTitle});
  final String title;
  final String? buttonTitle;
  final void Function(File) callback;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .25,
            child: Text(title??"", style: TextStyle(color: AppColor.primaryText,fontSize: 15,fontWeight: FontWeight.w500))),
          const SizedBox(width: 20),
          InkWell(
            onTap: (){
              PhotoPickerBottomSheet.show(context, (File imageFile) {
                        debugPrint(imageFile.path);
                        callback(imageFile);
              });
            },
            child: Container(
            height: 30,
            width: 85,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(90.0)),
              border: Border.all(color: AppColor.primary)
            ),
            child: Center(
              child: Row(
                children: [
                  const Icon(Icons.add,color: AppColor.primary,size: 15),
                  Text(buttonTitle??"Choose",
                          style: const TextStyle(
                            color: AppColor.primary,
                            fontSize: 15,
                            fontFamily: FontUtils.primary,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                ],
              ),
            ),
                  ),
          )
                        
        ],);
  }
}