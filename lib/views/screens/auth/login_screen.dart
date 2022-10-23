import 'package:flutter/material.dart';
import 'package:follow_app/constants.dart';
import 'package:follow_app/helper/util_extensions.dart';
import 'package:follow_app/views/screens/auth/create_password_screen.dart';
import 'package:follow_app/views/screens/auth/signup_screen.dart';
import 'package:follow_app/views/widgets/password_icon.dart';
import 'package:follow_app/views/widgets/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                50.verticalSpace(),
                Image.asset("assets/images/logo.png"),
                50.verticalSpace(),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
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
                15.verticalSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        const CreatePasswordScreen()
                            .navigate(isInfinity: false);
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.buttonColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                30.verticalSpace(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                20.verticalSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(fontSize: 20, color: AppColors.white),
                    ),
                    InkWell(
                      onTap: () {
                        const SignupScreen().navigate(isInfinity: false);
                      },
                      child: const Text(
                        'Register',
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
                  "Sign-in with",
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
    );
  }
}
