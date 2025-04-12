import 'package:flutter/material.dart';

import '../../app/app_styles.dart';

class InputHeader extends StatelessWidget {
  final String header;
  final String subheader;
  const InputHeader({super.key, required this.header, required this.subheader});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(header, style: AppStyles.headline1),
        SizedBox(height: 20),
        Text(
          subheader,
          textAlign: TextAlign.center,
          style: AppStyles.headline3,
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
