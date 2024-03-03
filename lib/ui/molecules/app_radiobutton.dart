import 'package:flutter/material.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';
import '../../utils/color_utils.dart';

class AppRadioButton extends StatelessWidget {

  final Function(dynamic onChangedValue) onChanged;
  
  final String title;
  final String value;
  final String groupValue;

  const AppRadioButton(
      {super.key,
      required this.onChanged,
      required this.title,
      required this.value,
      required this.groupValue,
      });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      activeColor: AppColor.primary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 0),

      title: Text(title,style: const TextStyle(
                              color: AppColor.semiBlack,
                              fontSize: 14,
                              overflow: TextOverflow.visible,
                              fontFamily: FontUtils.primary),),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
