import 'package:flutter/material.dart';

class ElevatedbuttonText extends StatelessWidget {
  final String text;
  const ElevatedbuttonText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
       text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
