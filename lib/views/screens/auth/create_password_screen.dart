import 'package:flutter/material.dart';
import 'package:follow_app/constants.dart';
import 'package:follow_app/helper/util_extensions.dart';
import 'package:follow_app/views/widgets/password_icon.dart';
import 'package:follow_app/views/widgets/text_input_field.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool isOldVisible = true;
  bool isNewVisible = true;
  bool isConfirmaVisible = true;

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
                  'Create New Password',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                35.verticalSpace(),
                CustomTextField(
                  textController: _oldController,
                  label: "Old Password",
                  isObscure: isOldVisible,
                  suffixIcon: PasswordIcon(
                    showPassword: !isOldVisible,
                    onTap: () {
                      setState(() {
                        isOldVisible = !isOldVisible;
                      });
                    },
                  ),
                ),
                25.verticalSpace(),
                CustomTextField(
                  textController: _newController,
                  label: "New Password",
                  isObscure: isNewVisible,
                  suffixIcon: PasswordIcon(
                    showPassword: !isNewVisible,
                    onTap: () {
                      setState(() {
                        isNewVisible = !isNewVisible;
                      });
                    },
                  ),
                ),
                25.verticalSpace(),
                CustomTextField(
                  textController: _confirmController,
                  label: "Confirm New Password",
                  isObscure: isConfirmaVisible,
                  suffixIcon: PasswordIcon(
                    showPassword: !isConfirmaVisible,
                    onTap: () {
                      setState(() {
                        isConfirmaVisible = !isConfirmaVisible;
                      });
                    },
                  ),
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
                        'Create New Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: AppColors.black,
                        ),
                      ),
                    ),
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
