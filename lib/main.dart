import 'package:flutter/material.dart';
import 'package:follow_app/constants.dart';
import 'package:follow_app/views/screens/auth/login_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Get.isDarkMode ? AppColors.dark : AppColors.light,
      home: const LoginScreen(),
    );
  }
}
