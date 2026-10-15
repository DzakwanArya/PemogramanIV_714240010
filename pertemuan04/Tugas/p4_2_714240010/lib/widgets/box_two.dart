
import 'package:flutter/material.dart';

class BoxTwo extends StatelessWidget {
  const BoxTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 172,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFFF4436),
          width: 3,
        ),
      ),
      child: const Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Box 2',
          style: TextStyle(
            color: Color(0xFFFF4436),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
