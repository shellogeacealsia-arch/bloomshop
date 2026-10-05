import 'package:flutter/material.dart';

import '../main.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final appState =
        context.findAncestorStateOfType<BloomShopAppState>()!;

    final cart = appState.cart;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBFC),
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: cart.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 75,
                    color: Color(0xFFE2A2B2),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF633743),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final product =
                          cart.keys.elementAt(index);
                      final quantity =
                          cart[product]!;

                      return Container(
                        margin:
                            const EdgeInsets.only(
                          bottom: 14,
                        ),
                        padding:
                            const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration:
                                  BoxDecoration(
                                color:
                                    const Color(0xFFFFEFF3),
                                borderRadius:
                                    BorderRadius.circular(
                                  15,
                                ),
                              ),
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.contain,
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style:
                                        const TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                      color:
                                          Color(0xFF633743),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Rp ${product.price.toStringAsFixed(0)}',
                                    style:
                                        const TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                      color:
                                          Color(0xFFD16F87),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      _quantityButton(
                                        icon: Icons.remove,
                                        onTap: () {
                                          appState
                                              .decreaseCart(
                                            product,
                                          );
                                          setState(() {});
                                        },
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets
                                                .symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Text(
                                          quantity.toString(),
                                          style:
                                              const TextStyle(
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      _quantityButton(
                                        icon: Icons.add,
                                        onTap: () {
                                          appState
                                              .addToCart(
                                            product,
                                          );
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                appState
                                    .removeFromCart(
                                  product,
                                );
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color:
                                    Color(0xFFD8758D),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    16,
                    20,
                    22,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight:
                                  FontWeight.bold,
                              color:
                                  Color(0xFF633743),
                            ),
                          ),
                          Text(
                            'Rp ${appState.cartTotal.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight:
                                  FontWeight.bold,
                              color:
                                  Color(0xFFD16F87),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const CheckoutPage(),
                              ),
                            );
                          },
                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFFD8758D),
                            foregroundColor:
                                Colors.white,
                            elevation: 0,
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                17,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Checkout',
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 29,
        height: 29,
        decoration: BoxDecoration(
          color: const Color(0xFFFFE7ED),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 16,
          color: const Color(0xFFD16F87),
        ),
      ),
    );
  }
}