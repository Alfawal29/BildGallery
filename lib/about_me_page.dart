import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/images/kaya.jpeg'),
          ),
          SizedBox(height: 20),
          Text(
            'Kaya Müller',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Fotograf',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Text(
            'Mein Name ist Kaya Müller, ein Fotograf im Alter von 32 Jahren, der die Welt durch die Linse entdeckt. '
            'Meine Spezialität liegt in der Sport- und Naturfotografie.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
