
import 'package:flutter/material.dart';

class BoxOne extends StatelessWidget {
  const BoxOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 95,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF2196F3),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(3, 7),
          ),
        ],
      ),
      child: const Text(
        'Box 1',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
