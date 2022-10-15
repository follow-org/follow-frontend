import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:follow_app/constants.dart';

class TextFieldWidget extends StatelessWidget {
  final Widget? icon;
  final String hint;
  final String? errorText;
  final bool isObscure;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextAlign? textAlign;
  final TextInputAction? inputAction;
  final TextStyle? hintTextStyle;
  final int? maxLength;
  final int? maxLines;
  Widget? suffixIcon;
  Widget? prefixIcon;
  List<TextInputFormatter>? inputFormatter;
  TextCapitalization textCapitalization;
  TextStyle? errorStyle;
  String obsecureCharacter;

  TextFieldWidget({
    Key? key,
    this.icon,
    this.textCapitalization = TextCapitalization.none,
    this.errorText,
    required this.textController,
    this.inputType,
    required this.hint,
    this.isObscure = false,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
    this.hintTextStyle,
    this.maxLength = 55,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatter,
    this.obsecureCharacter = '•',
    this.errorStyle,
    this.textAlign,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      autofocus: autoFocus,
      textInputAction: inputAction,
      obscureText: isObscure,
      maxLines: maxLines ?? 1,
      textCapitalization: textCapitalization,
      keyboardType: inputType,
      maxLength: maxLength,
      obscuringCharacter: obsecureCharacter,
      inputFormatters: inputFormatter,
      textAlign: textAlign ?? TextAlign.left,
      style: Theme.of(context)
          .textTheme
          .bodyText2
          ?.copyWith(color: AppColors.black),
      decoration: InputDecoration(
        counterText: '',
        hintText: hint,
        hintStyle: hintTextStyle ??
            const TextStyle(
              color: Colors.grey,
            ),
        errorText: errorText,
        errorMaxLines: 2,
        errorStyle: errorStyle ??
            const TextStyle(
              fontSize: 12,
              color: Colors.redAccent,
            ),
        icon: icon,
        suffixIcon: focusNode?.hasFocus == true ? suffixIcon : null,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
