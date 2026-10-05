import 'package:flutter/material.dart';

import 'about_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() =>
      _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBFC),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Preferences',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF633743),
            ),
          ),

          const SizedBox(height: 12),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text(
                    'Notifications',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF704853),
                    ),
                  ),
                  subtitle: const Text(
                    'Receive shopping notifications',
                  ),
                  value: notifications,
                  activeColor:
                      const Color(0xFFD8758D),
                  onChanged: (value) {
                    setState(() {
                      notifications = value;
                    });
                  },
                ),

                const Divider(height: 1),

                SwitchListTile(
                  title: const Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF704853),
                    ),
                  ),
                  subtitle: const Text(
                    'Change application appearance',
                  ),
                  value: darkMode,
                  activeColor:
                      const Color(0xFFD8758D),
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          const Text(
            'About',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF633743),
            ),
          ),

          const SizedBox(height: 12),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.info_outline,
                    color: Color(0xFFD8758D),
                  ),
                  title: const Text(
                    'About BloomShop',
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const AboutPage(),
                      ),
                    );
                  },
                ),

                const Divider(height: 1),

                const ListTile(
                  leading: Icon(
                    Icons.verified_outlined,
                    color: Color(0xFFD8758D),
                  ),
                  title: Text(
                    'App Version',
                  ),
                  trailing: Text(
                    '1.0.0',
                    style: TextStyle(
                      color: Color(0xFF987780),
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
}