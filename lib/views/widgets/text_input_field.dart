// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:follow_app/constants.dart';
// import 'package:follow_app/helper/util_extensions.dart';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   const CustomTextField(
//       {super.key, required this.controller, required this.labelText});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: const TextStyle(
//           color: AppColors.white,
//           fontSize: 16,
//         ),

//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(
//             color: AppColors.white,
//             width: 1.0,
//             style: BorderStyle.solid,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:follow_app/constants.dart';
import 'package:follow_app/helper/util_extensions.dart';

class CustomTextField extends StatelessWidget {
  final Widget? icon;
  final String label;
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
  final TextStyle? labelTextStyle;
  final int? maxLength;
  final int? maxLines;
  Widget? suffixIcon;
  Widget? prefixIcon;
  List<TextInputFormatter>? inputFormatter;
  TextCapitalization textCapitalization;
  TextStyle? errorStyle;
  String obsecureCharacter;

  CustomTextField({
    Key? key,
    this.icon,
    this.textCapitalization = TextCapitalization.none,
    this.errorText,
    required this.textController,
    this.inputType,
    required this.label,
    this.isObscure = false,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
    this.labelTextStyle,
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
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.white,
          ),
      decoration: InputDecoration(
        counterText: '',
        labelText: label,
        labelStyle: labelTextStyle ??
            Theme.of(context).textTheme.headline6?.copyWith(
                  color: AppColors.borderColor,
                ),
        errorText: errorText,
        errorMaxLines: 2,
        errorStyle: errorStyle ??
            Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 12,
                  color: Colors.redAccent,
                ),
        suffixIcon: suffixIcon ?? const SizedBox(),
        prefixIcon: prefixIcon,
        contentPadding: 20.paddingAll(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.pink,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
