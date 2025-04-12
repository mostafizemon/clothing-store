import 'package:flutter/material.dart';

class InputLabelText extends StatelessWidget {
  final String label;
  const InputLabelText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    );
  }
}
