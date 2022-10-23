import 'package:flutter/material.dart';
import 'package:follow_app/constants.dart';

class PasswordIcon extends StatelessWidget {
  const PasswordIcon({
    Key? key,
    required this.showPassword,
    required this.onTap,
  }) : super(key: key);
  final bool showPassword;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        showPassword
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        size: 17,
        color: AppColors.white,
      ),
    );
  }
}
