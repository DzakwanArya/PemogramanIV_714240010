
import 'package:flutter/material.dart';
import '../widgets/box_one.dart';
import '../widgets/box_two.dart';
import '../widgets/box_three.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF693E),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Tugas Pertemuan 4'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BoxOne(),
            const SizedBox(height: 18),
            const Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoxTwo(),
                SizedBox(width: 18),
                BoxThree(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
