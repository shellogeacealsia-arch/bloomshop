import 'package:flutter/material.dart';

import 'models/product.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(const BloomShopApp());
}

class BloomShopApp extends StatefulWidget {
  const BloomShopApp({super.key});

  @override
  State<BloomShopApp> createState() => BloomShopAppState();
}

class BloomShopAppState extends State<BloomShopApp> {
  final List<Product> favorites = [];
  final Map<Product, int> cart = {};
  final List<List<Product>> orders = [];

  // =========================
  // FAVORITE
  // =========================

  bool isFavorite(Product product) {
    return favorites.contains(product);
  }

  void toggleFavorite(Product product) {
    setState(() {
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
    });
  }

  // =========================
  // CART
  // =========================

  void addToCart(Product product) {
    setState(() {
      cart[product] = (cart[product] ?? 0) + 1;
    });
  }

  void decreaseCart(Product product) {
    setState(() {
      if (!cart.containsKey(product)) {
        return;
      }

      if (cart[product]! <= 1) {
        cart.remove(product);
      } else {
        cart[product] = cart[product]! - 1;
      }
    });
  }

  void removeFromCart(Product product) {
    setState(() {
      cart.remove(product);
    });
  }

  int get cartItemCount {
    int count = 0;

    for (final quantity in cart.values) {
      count += quantity;
    }

    return count;
  }

  double get cartTotal {
    double total = 0;

    cart.forEach((product, quantity) {
      total += product.price * quantity;
    });

    return total;
  }

  // =========================
  // CHECKOUT
  // =========================

  void checkout() {
    if (cart.isEmpty) {
      return;
    }

    final List<Product> newOrder = [];

    cart.forEach((product, quantity) {
      for (int i = 0; i < quantity; i++) {
        newOrder.add(product);
      }
    });

    setState(() {
      orders.insert(0, newOrder);
      cart.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BloomShop',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFBFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD8758D),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Color(0xFF633743),
        ),
      ),
      home: const SplashPage(),
    );
  }
}