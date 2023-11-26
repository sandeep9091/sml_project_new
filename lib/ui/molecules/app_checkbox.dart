import 'package:flutter/material.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';
import '../../utils/color_utils.dart';

class AppCheckbox extends StatelessWidget {

  final Function(dynamic onChangedValue) onChangedMethod;
  
  final bool checkboxValue;

  final String? checkboxText;

  final bool isEnabled;

  const AppCheckbox(
      {super.key,
      required this.onChangedMethod,
      this.checkboxValue = false,
      this.checkboxText,
      this.isEnabled = true
      });

  @override
  Widget build(BuildContext context) {
    return Row(
            children: <Widget>[
              Checkbox(
                value: checkboxValue,
                onChanged: isEnabled ? onChangedMethod : null,
                activeColor: AppColor.green,
                
              ),//SizedBox
              Text(
                checkboxText ?? 'Active',
                style: const TextStyle(
                            color: AppColor.semiBlack,
                            fontSize: 14,
                            fontFamily: FontUtils.primary),
              ), //Checkbox
            ], //<Widget>[]
          );
  }
}
