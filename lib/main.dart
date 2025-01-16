// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_1/about_me_page.dart';
import 'package:flutter_application_1/gallery_item.dart';

void main() {
  runApp(MyGalleryApp());
}

class MyGalleryApp extends StatelessWidget {
  const MyGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GalleryScreen(),
    );
  }
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    GalleryPage(),
    AboutMePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyGallery'),
        backgroundColor: Colors.deepPurple,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Bilder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Über mich',
          ),
        ],
      ),
    );
  }
}

class GalleryPage extends StatelessWidget {
  void _showDetails(BuildContext context, GalleryItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar im BottomSheet
              Container(
                height: 100, // Höhe erhöht, um den Titel weiter unten zu platzieren
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 50, // Extra Platz unterhalb der SafeArea
                  left: 16.0, // Linkes Padding für Zurück-Button
                  right: 16.0, // Rechtes Padding für Ausgleich
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 48), // Platzhalter, damit der Titel zentriert bleibt
                  ],
                ),
              ),

              // Großes Bild
              ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                child: Image.asset(
                  item.imagePath,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),

              // Titel, Datum und Beschreibung
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.imageTitle,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        item.imageDate,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        item.imageDescription,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: galleryData.length,
        itemBuilder: (context, index) {
          final item = galleryData[index];
          return GestureDetector(
            onTap: () => _showDetails(context, item),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(item.imagePath, fit: BoxFit.cover, height: 100, width: double.infinity),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item.imageTitle, style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
