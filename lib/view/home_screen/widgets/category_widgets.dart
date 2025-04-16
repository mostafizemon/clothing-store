import 'package:clothing_store/data/categorydata.dart';
import 'package:flutter/material.dart';

class CategoryWidgets extends StatelessWidget {
  const CategoryWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final items = CategoryData.categoryItems;
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0XFFF7F2ED),
                  shape: BoxShape.circle, // This makes it circular
                ),
                child: Image.asset(items[index]['icon']),
              ),
              const SizedBox(height: 8),
              Text(items[index]['name'], style: const TextStyle(fontSize: 12)),
            ],
          );
        },
      ),
    );
  }
}
