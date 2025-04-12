import 'package:flutter/material.dart';

import '../../app/app_styles.dart';

class TwoDivider extends StatelessWidget {
  final String text;
  const TwoDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey)),
        SizedBox(width: 8),
        Text(
          text,
          style: AppStyles.headline3.copyWith(fontSize: 16),
        ),
        SizedBox(width: 8),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}
