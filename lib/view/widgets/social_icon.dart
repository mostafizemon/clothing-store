import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String path;
  final VoidCallback onpressed;
  const SocialIcon({super.key, required this.path, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Image.asset(path),
      ),
    );
  }
}
