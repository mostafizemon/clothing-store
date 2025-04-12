import 'package:clothing_store/app/app_colors.dart';
import 'package:clothing_store/app/app_utils.dart';
import 'package:clothing_store/view/widgets/account_creation_option.dart';
import 'package:clothing_store/view/widgets/elevatedbutton_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/image_gallery.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              ImageGallery(size: size),
              SizedBox(height: 40),
              Text.rich(
                TextSpan(
                  text: "The ",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Fashion App",
                      style: TextStyle(
                        color: AppColors.primary_color,
                      ), // Change this to your desired color
                    ),
                    TextSpan(text: " That\nMakes You Look Your Best"),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 24),
              Text(
                "Your transformation begins with the perfect fit. Let fashion fuel your confidence.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),

              SizedBox(height: 24),

              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offNamed("/signup_screen");
                  },
                  child: ElevatedbuttonText(text: "Let's Get Started"),
                ),
              ),
              SizedBox(height: 24),

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
  }
}
