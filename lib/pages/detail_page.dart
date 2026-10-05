import 'package:flutter/material.dart';

import '../main.dart';
import '../models/product.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final appState =
        context.findAncestorStateOfType<BloomShopAppState>()!;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBFC),
      appBar: AppBar(
        title: const Text(
          'Product Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              appState.toggleFavorite(product);
            },
            icon: Icon(
              appState.isFavorite(product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: const Color(0xFFD8758D),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20,
          10,
          20,
          30,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEFF3),
                borderRadius: BorderRadius.circular(28),
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(28),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder:
                      (context, error, stackTrace) {
                    return const Icon(
                      Icons.image_not_supported_outlined,
                      size: 70,
                      color: Color(0xFFD8758D),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              product.category,
              style: const TextStyle(
                color: Color(0xFFD8758D),
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 7),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF633743),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Rp ${product.price.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD16F87),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Description',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF633743),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              product.description,
              style: const TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Color(0xFF8D7078),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  appState.addToCart(product);

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content:
                          Text('Added to cart 🛒'),
                      behavior:
                          SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: const Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFFD8758D),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}