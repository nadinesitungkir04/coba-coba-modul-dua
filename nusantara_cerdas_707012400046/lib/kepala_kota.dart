import 'package:flutter/material.dart';

class KepalaKota extends StatelessWidget {
  final String namaKota;
  final String semboyan;
  final IconData ikon;

  const KepalaKota({
    super.key,
    required this.namaKota,
    required this.semboyan,
    required this.ikon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal[800],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.white,
              child: Icon(
                ikon,
                size: 36.0,
                color: Colors.teal[800],
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaKota,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    semboyan,
                    style: const TextStyle(
                      fontSize: 13.0,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}