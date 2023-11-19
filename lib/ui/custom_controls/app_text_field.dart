import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/color_utils.dart';

class AppTextField extends StatefulWidget {
  final double width;
  final double height;
  final EdgeInsets padding;
  final Function()? onTap;
  final Function()? onPressed;
  final TextEditingController? controller;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final String labelText;
  final String hintText;
  final String? initialValue;
  final bool? autoFocus;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final FormFieldSetter<String>? onSaved;
  final Function(String)? onFieldSubmitted;
  final bool? readOnly;
  final int? maxLength;
  final bool? obscureText;
  final String obscuringCharacter;
  final Widget Function(bool enabled, String? value)? suffixIcon;
  final Widget Function()? prefixIcon;
  final Widget Function()? prefix;
  final bool enabled;
  final int maxLines;
  final int minLines;
  final double borderRadius;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? inputBorder;
  final bool busy;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool filled;
  final Color filledColor;
  final double fontSize;
  final double labelFontSize;
  final Function(bool hasFocus, bool isValid, String value)? textHintWidget;
  final EdgeInsets dividerPadding;
  final Function? labelIcon;
  final Color? textFieldFocusBorderColor;
  final Color? textFieldBorderColor;
  final Color? hintTextColor;
  final Color? textColor;
  final Color? labelColor;
  final double suffixIconSize;
  final double prefixIconSize;
  final Color? color;
  final EdgeInsets containerPadding;
  final Border? border;
  final Function(bool hasFocus)? onFocusChange;
  final TextStyle? textStyle;

  const AppTextField({
    this.onTap,
    this.padding = const EdgeInsets.only(left: 20, right: 5.0),
    this.width = double.infinity,
    this.height = 44,
    this.onPressed,
    this.color = AppColor.white,
    this.controller,
    this.inputAction = TextInputAction.done,
    this.inputType,
    required this.labelText,
    required this.hintText,
    this.initialValue,
    this.autoFocus = false,
    this.validator,
    this.onSaved,
    this.readOnly = false,
    this.maxLength,
    Key? key,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
    this.enabled = true,
    this.inputFormatters,
    this.inputBorder,
    this.busy = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.borderRadius = 15.0,
    this.onChanged,
    this.filled = false,
    this.fontSize = 12,
    this.labelFontSize = 11,
    this.filledColor = AppColor.white,
    this.onFieldSubmitted,
    this.labelIcon,
    this.dividerPadding =
        const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
    this.floatingLabelBehavior = FloatingLabelBehavior.never,
    this.textAlign = TextAlign.start,
    this.textFieldBorderColor,
    this.textFieldFocusBorderColor,
    this.hintTextColor,
    this.textColor,
    this.labelColor,
    this.textHintWidget,
    this.suffixIconSize = 20,
    this.prefixIconSize = 20,
    this.containerPadding = const EdgeInsets.all(0.0),
    this.onFocusChange,
    this.border,
    this.textStyle,
  }) : super(key: key);

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  late bool _secureText;
  final FocusNode _focusNode = FocusNode();
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    _secureText = widget.obscureText!;
    _focusNode.addListener(_onFocusChange);
  }

  bool get hasFocus => _focusNode.hasFocus;

  bool get secureText => _secureText;

  set secureText(bool value) {
    setState(() {
      _secureText = value;
    });
  }

  bool get isValid => _isValid;

  set isValid(bool value) {
    setState(() {
      _isValid = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
        widget.onTap?.call();
      },
      child: Container(
        constraints: BoxConstraints(
          minHeight: widget.height,
          maxHeight: widget.height,
          minWidth: widget.width,
          maxWidth: widget.width,
        ),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
          border: widget.border,
        ),
        child: Row(
          children: [
            widget.prefixIcon?.call() ?? const SizedBox.shrink(),
            Expanded(
              child: Center(
                child: TextFormField(
                  autocorrect: false,
                  focusNode: _focusNode,
                  maxLength: widget.maxLength,
                  textAlign: widget.textAlign,
                  style: widget.textStyle ??
                      TextStyle(
                        color: widget.textColor ??
                            Theme.of(context).primaryColorDark,
                        fontSize: widget.fontSize,
                        height: 1.4,
                      ),
                  initialValue: widget.initialValue,
                  autofocus: widget.autoFocus!,
                  textInputAction: widget.inputAction,
                  keyboardType: widget.inputType,
                  inputFormatters: widget.inputFormatters,
                  readOnly: widget.readOnly ?? false,
                  maxLines: widget.maxLines,
                  minLines: widget.minLines,
                  obscureText: secureText,
                  cursorColor: widget.hintTextColor ??
                      Theme.of(context).textSelectionTheme.cursorColor,
                  obscuringCharacter: widget.obscuringCharacter,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0.0),
                    hintText: widget.hintText,
                    hintMaxLines: 1,
                    counterText: "",
                    alignLabelWithHint: true,
                    isDense: true,
                    filled: widget.filled,
                    fillColor: widget.filledColor,
                    border: widget.inputBorder ?? InputBorder.none,
                    focusedBorder: widget.inputBorder ?? InputBorder.none,
                    focusedErrorBorder: widget.inputBorder ?? InputBorder.none,
                    enabledBorder: widget.inputBorder ?? InputBorder.none,
                    errorBorder: widget.inputBorder ?? InputBorder.none,
                    disabledBorder: widget.inputBorder ?? InputBorder.none,
                    hintStyle: TextStyle(
                      color: widget.hintTextColor ??
                          Theme.of(context)
                              .inputDecorationTheme
                              .hintStyle!
                              .color,
                    ),
                    enabled: widget.enabled,
                    floatingLabelBehavior: widget.floatingLabelBehavior,
                  ),
                  controller: widget.controller,
                  validator: widget.validator,
                  onSaved: widget.onSaved,
                  onTap: () => widget.onPressed?.call(),
                  onFieldSubmitted: widget.onFieldSubmitted,
                  onChanged: (value) {
                    setState(() {});
                    widget.onChanged?.call(value);
                  },
                ),
              ),
            ),
            widget.suffixIcon?.call(isValid, widget.controller?.text) ??
                const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  void _onFocusChange() {
    setState(() {
      isValid = true;
    });
    widget.onFocusChange?.call(_focusNode.hasFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }
}
