import 'package:flutter/material.dart';
import 'custom_product_card.dart';

class ProductGridPage extends StatelessWidget {
  const ProductGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Map<String, dynamic>> productList = [
      {
        'image':
            'https://gorurghash.com/wp-content/uploads/2023/10/605A7716-copy.jpg',
        'name': 'Brown Jacket',
        'price': 83.97,
        'rating': 4.9,
      },
      {
        'image':
            'https://gorurghash.com/wp-content/uploads/2023/10/605A7716-copy.jpg',
        'name': 'Stylish Shirt',
        'price': 45.50,
        'rating': 4.5,
      },
      {
        'image':
            'https://gorurghash.com/wp-content/uploads/2023/10/605A7716-copy.jpg',
        'name': 'Blue Pants',
        'price': 35.20,
        'rating': 4.2,
      },
      {
        'image':
            'https://gorurghash.com/wp-content/uploads/2023/10/605A7716-copy.jpg',
        'name': 'Stylish Shirt',
        'price': 45.50,
        'rating': 4.5,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          final product = productList[index];
          return CustomProductCard(
            imageUrl: product['image'],
            productName: product['name'],
            price: product['price'],
            rating: product['rating'],
          );
        },
      ),
    );
  }
}
