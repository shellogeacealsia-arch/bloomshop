import 'dart:async';

import 'package:flutter/material.dart';

import 'welcome_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE8EE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 105,
              height: 105,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.spa_outlined,
                size: 58,
                color: Color(0xFFD8758D),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'BloomShop',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF713E4C),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Beauty that blooms with you',
              style: TextStyle(
                color: Color(0xFF9A707B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}