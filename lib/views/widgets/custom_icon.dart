import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/appIcon.png',
      height: 60,
      fit: BoxFit.contain,
    );
  }
}
