import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../main.dart';
import '../models/product.dart';

import 'cart_page.dart';
import 'detail_page.dart';
import 'favorite_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedNav = 0;

  String selectedCategory = 'All';

  final categories = [
    'All',
    'Skincare',
    'Make Up',
    'Body Care',
    'Hair Care',
  ];

  List<Product> get filteredProducts {
    if (selectedCategory == 'All') {
      return products;
    }

    return products
        .where((product) => product.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final appState =
        context.findAncestorStateOfType<BloomShopAppState>()!;

    final bestSeller =
        products.where((product) => product.isBestSeller).toList();

    final newArrivals =
        products.where((product) => product.isNewArrival).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBFC),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // =========================
            // HEADER
            // =========================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning 🌸',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF9B7A83),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Find your beauty',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF633743),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // PROFILE
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE8EE),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ProfilePage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.person_outline,
                          color: Color(0xFFD8758D),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // =========================
            // BANNER
            // =========================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFFDFE8),
                        Color(0xFFFFF0E7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Glow naturally ✨',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF633743),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Find your favorite beauty essentials in one place.',
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.5,
                                color: Color(0xFF8E6872),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.auto_awesome,
                        size: 55,
                        color: Color(0xFFD8758D),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // =========================
            // CATEGORY TITLE
            // =========================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 27, 20, 12),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF633743),
                      ),
                    ),
                    Text(
                      '${products.length} products',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFA0848C),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // =========================
            // CATEGORY LIST
            // =========================
            SliverToBoxAdapter(
              child: SizedBox(
                height: 45,
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    final selected =
                        category == selectedCategory;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 17,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xFFD8758D)
                              : const Color(0xFFFFEFF3),
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: selected
                                ? Colors.white
                                : const Color(0xFF8B626E),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // =========================
            // BEST SELLER
            // =========================
            SliverToBoxAdapter(
              child: _sectionTitle(
                'Best Seller',
                'Swipe →',
              ),
            ),

            SliverToBoxAdapter(
              child: _horizontalProducts(
                bestSeller,
                appState,
              ),
            ),

            // =========================
            // NEW ARRIVALS
            // =========================
            SliverToBoxAdapter(
              child: _sectionTitle(
                'New Arrivals',
                'Swipe →',
              ),
            ),

            SliverToBoxAdapter(
              child: _horizontalProducts(
                newArrivals,
                appState,
              ),
            ),

            // =========================
            // ALL PRODUCTS
            // =========================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  28,
                  20,
                  15,
                ),
                child: Text(
                  selectedCategory == 'All'
                      ? 'All Products'
                      : selectedCategory,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF633743),
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ProductCard(
                      product: filteredProducts[index],
                      appState: appState,
                    );
                  },
                  childCount: filteredProducts.length,
                ),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 16,

                  // CARD SEDIKIT LEBIH TINGGI
                  childAspectRatio: 0.72,
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
          ],
        ),
      ),

      // =========================
      // BOTTOM NAVIGATION
      // =========================
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedNav,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFFFE0E8),

        onDestinationSelected: (index) {
          setState(() {
            selectedNav = index;
          });

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const FavoritePage(),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CartPage(),
              ),
            );
          }
        },

        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),

          NavigationDestination(
            icon: appState.favorites.isEmpty
                ? const Icon(Icons.favorite_border)
                : Badge(
                    label: Text(
                      appState.favorites.length.toString(),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                    ),
                  ),
            selectedIcon: const Icon(Icons.favorite),
            label: 'Favorite',
          ),

          NavigationDestination(
            icon: appState.cartItemCount == 0
                ? const Icon(
                    Icons.shopping_bag_outlined,
                  )
                : Badge(
                    label: Text(
                      appState.cartItemCount.toString(),
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                    ),
                  ),
            selectedIcon:
                const Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
        ],
      ),
    );
  }

  // =========================
  // SECTION TITLE
  // =========================

  Widget _sectionTitle(
    String title,
    String rightText,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        28,
        20,
        14,
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF633743),
            ),
          ),
          Text(
            rightText,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFA0848C),
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // HORIZONTAL PRODUCTS
  // =========================

  Widget _horizontalProducts(
    List<Product> items,
    BloomShopAppState appState,
  ) {
    return SizedBox(
      height: 265,
      child: ListView.builder(
        padding:
            const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: items[index],
            appState: appState,
            horizontal: true,
          );
        },
      ),
    );
  }
}

// ======================================================
// PRODUCT CARD
// ======================================================

class ProductCard extends StatelessWidget {
  final Product product;
  final BloomShopAppState appState;
  final bool horizontal;

  const ProductCard({
    super.key,
    required this.product,
    required this.appState,
    this.horizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(
              product: product,
            ),
          ),
        );
      },
      child: Container(
        width: horizontal ? 170 : double.infinity,

        margin: EdgeInsets.only(
          right: horizontal ? 14 : 0,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // =========================
            // PRODUCT IMAGE
            // =========================

            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,

                    decoration: const BoxDecoration(
                      color: Color(0xFFFFF0F3),
                      borderRadius:
                          BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),

                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(18),

                        child: Image.asset(
                          product.image,

                          // FOTO PRODUK DIPERKECIL
                          fit: BoxFit.contain,

                          errorBuilder:
                              (context, error, stackTrace) {
                            return const Center(
                              child: Icon(
                                Icons
                                    .image_not_supported_outlined,
                                size: 40,
                                color:
                                    Color(0xFFD8758D),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // =========================
                  // LOVE BUTTON
                  // =========================

                  Positioned(
                    top: 9,
                    right: 9,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(12),

                        onTap: () {
                          appState.toggleFavorite(product);
                        },

                        child: Container(
                          width: 35,
                          height: 35,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(12),
                          ),

                          child: Icon(
                            appState.isFavorite(product)
                                ? Icons.favorite
                                : Icons.favorite_border,

                            size: 20,

                            color: appState.isFavorite(product)
                                ? const Color(0xFFD8758D)
                                : const Color(0xFFB89AA3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // PRODUCT INFO
            // =========================

            Padding(
              padding: const EdgeInsets.fromLTRB(
                12,
                9,
                12,
                12,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    product.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFFB17C88),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF633743),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    'Rp ${product.price.toStringAsFixed(0)}',

                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD16F87),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}