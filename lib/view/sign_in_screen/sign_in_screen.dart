import 'package:clothing_store/app/app_colors.dart';
import 'package:clothing_store/view/sign_in_screen/controller/signin_controller.dart';
import 'package:clothing_store/view/widgets/account_creation_option.dart';
import 'package:clothing_store/view/widgets/elevatedbutton_text.dart';
import 'package:clothing_store/view/widgets/input_header.dart';
import 'package:clothing_store/view/widgets/social_icon.dart';
import 'package:clothing_store/view/widgets/two_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/input_label_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    SigninController controller = Get.put(SigninController());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            SizedBox(height: 40),
            InputHeader(
              header: "Sign In",
              subheader: "Hi! Welcome back, you've been missed",
            ),

            InputLabelText(label: "Email"),
            SizedBox(height: 8),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: emailController,
              decoration: InputDecoration(hintText: "example@gmail.com"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                final bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(emailController.value.text.trim());
                if (!emailValid) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),

            SizedBox(height: 16),
            InputLabelText(label: "Password"),
            SizedBox(height: 8),
            Obx(
              () => TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: passwordController,
                obscureText: controller.isPasswordHidden.value,
                decoration: InputDecoration(
                  hintText: "***********",
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: AppColors.primary_color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {},
              child: ElevatedbuttonText(text: "Sign In"),
            ),
            SizedBox(height: 32),

            TwoDivider(text: "Or sign in with"),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(
                  path: "assets/images/apple_logo.png",
                  onpressed: () {},
                ),
                SizedBox(width: 8),
                SocialIcon(
                  path: "assets/images/google_logo.png",
                  onpressed: () {},
                ),
                SizedBox(width: 8),
                SocialIcon(
                  path: "assets/images/facebook_logo.png",
                  onpressed: () {},
                ),
              ],
            ),
            SizedBox(height: 32),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AccountCreationOption(
                  onpressed: () {
                    Get.toNamed("/signup_screen");
                  },
                  text: "Don't have an account? ",
                  textbutton: "Sign up",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
