import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app_colors.dart';

class AccountCreationOption extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  final String textbutton;
  const AccountCreationOption({super.key, required this.onpressed, required this.text, required this.textbutton});

  @override
  Widget build(BuildContext context) {
    return  Text.rich(
      TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: textbutton,
            style: TextStyle(color: AppColors.primary_color),
            recognizer:
            TapGestureRecognizer()
              ..onTap = onpressed,
          ),
        ],
      ),
    );
  }
}
