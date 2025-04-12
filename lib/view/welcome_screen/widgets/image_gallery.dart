import 'package:flutter/material.dart';

import '../../../app/app_utils.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            AppUtils.fashion1,
            width: size.width * 0.50,
            height: size.height * 0.42,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                AppUtils.fashion2,
                width: size.width * 0.35,
                height: size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/fashion3.jpg',
                width: size.width * 0.35,
                height: size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}