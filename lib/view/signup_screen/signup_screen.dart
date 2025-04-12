import 'package:clothing_store/view/signup_screen/controller/signup_controller.dart';
import 'package:clothing_store/view/widgets/elevatedbutton_text.dart';
import 'package:clothing_store/view/widgets/input_header.dart';
import 'package:clothing_store/view/widgets/input_label_text.dart';
import 'package:clothing_store/view/widgets/social_icon.dart';
import 'package:clothing_store/view/widgets/two_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/app_colors.dart';
import '../widgets/account_creation_option.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Obx((){
        return controller.isLoading.value ? const Center(child: CircularProgressIndicator(),) : SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(height: 40),
              InputHeader(
                header: "Create Account",
                subheader:
                "Fill your information below or register\nwith your social account.",
              ),

              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputLabelText(label: "Name"),
                    SizedBox(height: 8),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "John Doe"),
                    ),

                    SizedBox(height: 16),
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

                    SizedBox(height: 8),
                    Obx(
                          () => Row(
                        children: [
                          Checkbox(
                            value: controller.isChecked.value,
                            onChanged: controller.toggleCheckbox,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "Agree with ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: "Terms & Condition",
                                  style: TextStyle(
                                    color: AppColors.primary_color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (!controller.isChecked.value) {
                      Get.snackbar(
                        "Agreement Required",
                        "Please accept the Terms & Conditions.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red.shade100,
                      );
                    } else {
                      controller.signupUser(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text,
                      );
                    }
                  }
                },
                child: ElevatedbuttonText(text: "Sign Up"),
              ),

              SizedBox(height: 40),

              TwoDivider(text: "Or sign up with"),
              SizedBox(height: 40),

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
              SizedBox(height: 24),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AccountCreationOption(
                    onpressed: () => Get.offNamed("/sign_in_screen"),
                    text: "Already have an account? ",
                    textbutton: "Sign in",
                  ),
                ],
              ),
            ],
          ),
        );
      })
    );
  }
}
