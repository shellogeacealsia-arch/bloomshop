import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBFC),
      appBar: AppBar(
        title: const Text(
          'About BloomShop',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // LOGO
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6ED),
                borderRadius:
                    BorderRadius.circular(35),
              ),
              child: const Icon(
                Icons.spa_outlined,
                size: 60,
                color: Color(0xFFD8758D),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'BloomShop',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF633743),
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Beauty that blooms with you 🌸',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF987780),
              ),
            ),

            const SizedBox(height: 30),

            // ABOUT
            _section(
              title: 'About BloomShop',
              child: const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'BloomShop adalah aplikasi e-commerce '
                    'kecantikan yang menyediakan berbagai '
                    'produk untuk kebutuhan beauty sehari-hari.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Color(0xFF80666E),
                    ),
                  ),
                  SizedBox(height: 13),
                  Text(
                    'Pengguna dapat menemukan produk skincare, '
                    'make up, body care, dan hair care dengan '
                    'tampilan yang sederhana dan nyaman digunakan.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Color(0xFF80666E),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // CATEGORY
            _section(
              title: 'Our Categories',
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: const [
                      CategoryItem(
                        icon:
                            Icons.face_retouching_natural,
                        title: 'Skincare',
                      ),
                      CategoryItem(
                        icon: Icons.brush_outlined,
                        title: 'Make Up',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: const [
                      CategoryItem(
                        icon: Icons.spa_outlined,
                        title: 'Body Care',
                      ),
                      CategoryItem(
                        icon:
                            Icons.content_cut_outlined,
                        title: 'Hair Care',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // FEATURES
            _section(
              title: 'BloomShop Features',
              child: Column(
                children: const [
                  FeatureItem(
                    icon: Icons.favorite_outline,
                    title: 'Favorite',
                    description:
                        'Simpan produk yang kamu sukai.',
                  ),
                  FeatureItem(
                    icon:
                        Icons.shopping_bag_outlined,
                    title: 'Shopping Cart',
                    description:
                        'Kelola produk sebelum checkout.',
                  ),
                  FeatureItem(
                    icon:
                        Icons.receipt_long_outlined,
                    title: 'My Orders',
                    description:
                        'Lihat pesanan yang sudah dibuat.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // MADE WITH LOVE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF0F3),
                borderRadius:
                    BorderRadius.circular(22),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 38,
                    color: Color(0xFFD8758D),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Made with love',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF633743),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'BloomShop dibuat untuk memberikan '
                    'pengalaman belanja kecantikan yang '
                    'simple, nyaman, dan menyenangkan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: Color(0xFF987780),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'BloomShop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFD8758D),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFAD9299),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static Widget _section({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF633743),
            ),
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: const Color(0xFFFFEDF2),
            borderRadius:
                BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFD8758D),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF80606A),
          ),
        ),
      ],
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEDF2),
              borderRadius:
                  BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFD8758D),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF633743),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF987780),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}