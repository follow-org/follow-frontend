import 'package:flutter/material.dart';
import 'package:follow_app/views/screens/add_video_screen.dart';

const pages = [
  Text('Home Screen'),
  Text('Saerch Screen Screen'),
  AddVideoScreen(),
  Text('Messages Screen'),
  Text('Profile Screen')
];

class AppColors {
  AppColors._();
  static const Color primary = Color(0xFF24FF00);
  static const Color secondary = Color(0xFFAD00FF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color yellow = Color(0xFFFFE600);
  static const Color blue = Color(0xFF00FFFF);
  static const Color pink = Color(0xFFFF0080);
  static const backgroundColor = Colors.black;
  static const buttonColor = Color(0xFFFFFFFF);
  static const borderColor = Colors.grey;

  static ThemeData light = ThemeData(
    primaryColor: AppColors.primary,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondary),
  );

  static ThemeData dark = ThemeData(
    primaryColor: AppColors.secondary,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.primary),
  );
}
