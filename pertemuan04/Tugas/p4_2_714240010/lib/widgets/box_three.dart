
import 'package:flutter/material.dart';

class BoxThree extends StatelessWidget {
  const BoxThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 172,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xFF4CAF50),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: const Align(
        alignment: Alignment.bottomRight,
        child: Text(
          'Box 3',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
