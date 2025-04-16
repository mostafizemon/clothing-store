import 'package:clothing_store/app/app_colors.dart';
import 'package:clothing_store/app/app_utils.dart';
import 'package:clothing_store/view/home_screen/widgets/category_filter_chips.dart';
import 'package:clothing_store/view/home_screen/widgets/category_widgets.dart';
import 'package:clothing_store/view/home_screen/widgets/mycarousel_slider.dart';
import 'package:clothing_store/view/home_screen/widgets/product_grid_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(AppUtils.logo, width: 200),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              backgroundColor: AppColors.primary_color,
              child: Icon(Icons.notifications, color: Colors.white),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            SizedBox(height: 24),
            MyCarouselSlider(),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(
                      color: AppColors.primary_color,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            CategoryWidgets(),
            SizedBox(height: 24),
            CategoryFilterChips(),
            ProductGridPage(),
          ],
        ),
      ),
    );
  }
}
