import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:spoorthymactcs/utils/font_utils.dart';

import '../../generated/l10n.dart';
import '../../utils/color_utils.dart';

class AppDropDownWidget<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> dropDownitems;

  final Function(dynamic onChangedValue) onChangedMethod;

  final T? selectedValue;

  final String? labelText;

  final String? hintText;

  final double? dropDownWidth;

  final double? dropdownHeight;

  final EdgeInsets? lablePadding;

  final EdgeInsets? contentPadding;

  final double borderRadius;

  final OutlineInputBorder? focusedBorderStryle;

  final Color? buttonBroderColor;

  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final bool isMandatory;

  final bool isEnabled;

  const AppDropDownWidget(
      {super.key,
      required this.dropDownitems,
      required this.onChangedMethod,
      this.selectedValue,
      this.labelText,
      this.hintText,
      this.borderRadius = 8,
      this.dropDownWidth = 343,
      this.dropdownHeight = 43,
      this.lablePadding = const EdgeInsets.only(top: 8.0, bottom: 8.0),
      this.contentPadding = const EdgeInsets.only(left: 8),
      this.focusedBorderStryle,
      this.buttonBroderColor,
      this.isMandatory = false,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText == null
            ? const SizedBox.shrink()
            : Padding(
                padding: lablePadding ?? const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: [
                    Text(
                      labelText ?? '',
                      style: const TextStyle(
                                color: AppColor.grey,
                                fontSize: 14,
                                fontFamily: FontUtils.primary),
                    ),
                    isMandatory ? const Icon(Icons.star,color: Colors.red,size: 8,): const SizedBox.shrink()
                  ],
                ),
              ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2<T>(
            items: dropDownitems,
            value: selectedValue,
            onChanged: isEnabled ?(onChangeValue) {
              onChangedMethod.call(onChangeValue);
            }:null,
            autovalidateMode: autovalidateMode,
            isExpanded: true,
            isDense: true,
            validator: (value) {
              if (value == null) {
                return "";
              }

              return null;
            },
            hint: Text(
              hintText ?? "",
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 16.3,
                ),
                openMenuIcon: Icon(
                  Icons.keyboard_arrow_up_outlined,
                  size: 16.3,
                )),
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText ?? "",
              isCollapsed: true,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              errorStyle: const TextStyle(height: 0),
              contentPadding: const EdgeInsets.only(left: 8),
              enabled: true,
              alignLabelWithHint: true,
              // errorBorder: OutlineInputBorder(
              //     borderSide: const BorderSide(
              //       color: AppColor.primary,
              //     ),
              //     borderRadius: BorderRadius.circular(borderRadius)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: buttonBroderColor ?? AppColor.grey,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius)),
              focusedBorder: focusedBorderStryle ??
                  OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColor.grey,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius)),
            ),
            buttonStyleData: ButtonStyleData(
              height: dropdownHeight,
              width: dropDownWidth!,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColor.grey,
              ),
            )),
          ),
        ),
      ],  
    );
  }
}
