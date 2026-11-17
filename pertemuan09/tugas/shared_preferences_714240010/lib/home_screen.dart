
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late SharedPreferences logindata;
  String username = '';

  @override
  void initState() {
    super.initState();
    inital();
  }

  Future<void> inital() async {
    logindata = await SharedPreferences.getInstance();

    if (!mounted) return;

    setState(() {
      username = logindata.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome to Home'),
              const SizedBox(height: 20),
              Text(username),
              ElevatedButton(
                onPressed: () async {
                  await logindata.setBool('login', true);

                  // Menghapus username sesi login saja.
                  // Username Remember Me tetap disimpan.
                  await logindata.remove('username');

                  if (!mounted) return;

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
