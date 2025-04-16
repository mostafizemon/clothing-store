import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../app/app_colors.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({super.key});

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int current_index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<Widget> items =
        [
              'https://img.freepik.com/free-vector/flat-landing-page-template-11-11-sale-event_23-2150815332.jpg',
              'https://img.freepik.com/free-vector/flat-landing-page-template-11-11-sale-event_23-2150815336.jpg',
              'https://img.freepik.com/free-vector/online-shopping-banner-template_23-2148764705.jpg',
            ]
            .map(
              (item) => ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: size.width,
                  errorBuilder:
                      (context, error, stackTrace) => const Center(
                        child: Icon(Icons.error, color: Colors.red),
                      ),
                ),
              ),
            )
            .toList();

    return Column(
      children: [
        CarouselSlider(
          items: items,
          options: CarouselOptions(
            height: 150,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.5,
            onPageChanged: (index, reason) {
              setState(() {
                current_index = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: 12),
        AnimatedSmoothIndicator(
          activeIndex: current_index,
          count: items.length,
          effect: WormEffect(
            dotColor: Colors.grey.withOpacity(0.2),
            activeDotColor: AppColors.primary_color,
          ),
        ),
      ],
    );
  }
}
