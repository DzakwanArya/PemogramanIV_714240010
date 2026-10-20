
import 'package:flutter/material.dart';
import 'model/tourism_place.dart';

var iniFontCustom = const TextStyle(
  fontFamily: 'Staatliches',
);

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: <Widget>[
                  Image.asset(
                    place.imageAsset,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      debugPrint(
                        'Gagal memuat gambar lokal: $error',
                      );
                      return const SizedBox(
                        width: double.infinity,
                        height: 220,
                        child: Center(
                          child: Text('Gambar lokal gagal dimuat'),
                        ),
                      );
                    },
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Staatliches',
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.calendar_today, size: 20),
                        const SizedBox(height: 8),
                        Text(
                          place.openDays,
                          style: iniFontCustom,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.access_time, size: 20),
                        const SizedBox(height: 8),
                        Text(
                          place.openTime,
                          style: iniFontCustom,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.monetization_on, size: 20),
                        const SizedBox(height: 8),
                        Text(
                          place.ticketPrice,
                          style: iniFontCustom,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  place.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 16),
                ),
              ),

              // Galeri gambar: langkah 32
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
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
