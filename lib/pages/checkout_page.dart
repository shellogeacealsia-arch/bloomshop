import 'package:flutter/material.dart';

import '../main.dart';
import 'success_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() =>
      _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String paymentMethod = 'Bank Transfer';

  @override
  Widget build(BuildContext context) {
    final appState =
        context.findAncestorStateOfType<BloomShopAppState>()!;

    final cart = appState.cart;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFBFC),
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF633743),
              ),
            ),

            const SizedBox(height: 14),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Column(
                children: cart.entries.map((entry) {
                  final product = entry.key;
                  final quantity = entry.value;

                  return Padding(
                    padding:
                        const EdgeInsets.only(
                      bottom: 13,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration:
                              BoxDecoration(
                            color:
                                const Color(0xFFFFEFF3),
                            borderRadius:
                                BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            '${product.name} x$quantity',
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.w600,
                              color:
                                  Color(0xFF704853),
                            ),
                          ),
                        ),
                        Text(
                          'Rp ${(product.price * quantity).toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                            color:
                                Color(0xFFD16F87),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Delivery Address',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF633743),
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF0F3),
                borderRadius:
                    BorderRadius.circular(18),
              ),
              child: const Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Color(0xFFD8758D),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Home Address\n'
                      'Jl. Beauty Street No. 24',
                      style: TextStyle(
                        height: 1.5,
                        color:
                            Color(0xFF704853),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF633743),
              ),
            ),

            const SizedBox(height: 8),

            _payment(
              'Bank Transfer',
              Icons.account_balance_outlined,
            ),
            _payment(
              'E-Wallet',
              Icons.account_balance_wallet_outlined,
            ),
            _payment(
              'Cash on Delivery',
              Icons.payments_outlined,
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Payment',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF633743),
                    ),
                  ),
                  Text(
                    'Rp ${appState.cartTotal.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD16F87),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: cart.isEmpty
                    ? null
                    : () {
                        appState.checkout();

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const SuccessPage(),
                          ),
                        );
                      },
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
                child: const Text(
                  'Place Order',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _payment(
    String title,
    IconData icon,
  ) {
    return RadioListTile<String>(
      value: title,
      groupValue: paymentMethod,
      activeColor: const Color(0xFFD8758D),
      contentPadding: EdgeInsets.zero,
      secondary: Icon(
        icon,
        color: const Color(0xFFD8758D),
      ),
      title: Text(title),
      onChanged: (value) {
        setState(() {
          paymentMethod = value!;
        });
      },
    );
  }
}