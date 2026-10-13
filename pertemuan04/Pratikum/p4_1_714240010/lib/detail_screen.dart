
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                'Ranca Upas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Column(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 20.0,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Open Everyday',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 20.0,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '09:00 - 20:00',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 20.0,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Rp 20.000',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),          
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Ranca Upas Ciwidey adalah kawasan bumi perkemahan di bawah pengelolaan '
                'perhutani. Tempat ini berada di kawasan wisata Bandung Selatan, satu lokasi '
                'dengan kawah putih, kolam Cimanggu dan situ Patenggang. Banyak hal yang '
                'bisa dilakukan di kawasan wisata ini, seperti berkemah, berinteraksi dengan '
                'rusa, sampai bermain di water park dan mandi air panas.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
