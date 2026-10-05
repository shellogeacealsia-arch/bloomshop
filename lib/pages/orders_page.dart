import 'package:flutter/material.dart';

import '../main.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState =
        context.findAncestorStateOfType<BloomShopAppState>()!;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBFC),
      appBar: AppBar(
        title: const Text(
          'My Orders',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: appState.orders.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 70,
                    color: Color(0xFFE2A2B2),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'No orders yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF633743),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: appState.orders.length,
              itemBuilder: (context, index) {
                final order =
                    appState.orders[index];

                double total = 0;

                for (final product in order) {
                  total += product.price;
                }

                return Container(
                  margin:
                      const EdgeInsets.only(bottom: 16),
                  padding:
                      const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          Text(
                            'Order #${appState.orders.length - index}',
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                              color:
                                  Color(0xFF633743),
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  const Color(0xFFFFE7ED),
                              borderRadius:
                                  BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: const Text(
                              'Processing',
                              style: TextStyle(
                                fontSize: 11,
                                color:
                                    Color(0xFFD16F87),
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      ...order.map(
                        (product) => Padding(
                          padding:
                              const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration:
                                    BoxDecoration(
                                  color:
                                      const Color(
                                    0xFFFFEFF3,
                                  ),
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                    10,
                                  ),
                                ),
                                child: Image.asset(
                                  product.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  product.name,
                                  style:
                                      const TextStyle(
                                    color:
                                        Color(
                                      0xFF704853,
                                    ),
                                  ),
                                ),
                              ),
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
                            ],
                          ),
                        ),
                      ),

                      const Divider(),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                              color:
                                  Color(0xFF633743),
                            ),
                          ),
                          Text(
                            'Rp ${total.toStringAsFixed(0)}',
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                              color:
                                  Color(0xFFD16F87),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}