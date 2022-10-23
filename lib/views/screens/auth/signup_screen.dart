import 'package:flutter/material.dart';
import 'package:follow_app/constants.dart';
import 'package:follow_app/helper/util_extensions.dart';
import 'package:follow_app/views/screens/auth/login_screen.dart';
import 'package:follow_app/views/widgets/password_icon.dart';
import 'package:follow_app/views/widgets/text_input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: 10.paddingHorizontal(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  50.verticalSpace(),
                  Image.asset("assets/images/logo.png"),
                  20.verticalSpace(),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  35.verticalSpace(),
                  CustomTextField(
                    textController: _usernameController,
                    label: "Username",
                  ),
                  25.verticalSpace(),
                  CustomTextField(
                    textController: _emailController,
                    label: "Email",
                  ),
                  25.verticalSpace(),
                  CustomTextField(
                    textController: _passwordController,
                    label: "Password",
                    isObscure: isPasswordVisible,
                    suffixIcon: PasswordIcon(
                      showPassword: !isPasswordVisible,
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  35.verticalSpace(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const InkWell(
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  15.verticalSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          const LoginScreen().navigate(isInfinity: true);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.buttonColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  25.verticalSpace(),
                  const Text(
                    "Or",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  15.verticalSpace(),
                  const Text(
                    "Sign-up with",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  25.verticalSpace(),
                  Padding(
                    padding: 50.paddingHorizontal(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 65,
                            scale: 0.8,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/facebook.png",
                            height: 40,
                            scale: 0.8,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/apple.png",
                            height: 65,
                            scale: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
