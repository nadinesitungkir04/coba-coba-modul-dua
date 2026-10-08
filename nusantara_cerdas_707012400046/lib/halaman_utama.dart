import 'package:flutter/material.dart';
import 'kepala_kota.dart';
import 'kartu_pilar.dart';
import 'panel_laporan.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nusantara Cerdas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal[800],
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KepalaKota(
              namaKota: 'Kota Nusantara',
              semboyan: 'Kota Cerdas, Hijau, dan Berkelanjutan',
              ikon: Icons.location_city,
            ),
            SizedBox(height: 20.0),
            Text(
              'Enam Pilar Smart City',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 10.0),
            KartuPilar(
              namaPilar: 'Smart Governance',
              ikon: Icons.account_balance,
              deskripsi: 'Layanan publik digital terpadu dan tata kelola transparan.',
            ),
            KartuPilar(
              namaPilar: 'Smart Economy',
              ikon: Icons.store,
              deskripsi: 'Pemberdayaan UMKM digital dan transaksi nontunai ramah pasar.',
            ),
            KartuPilar(
              namaPilar: 'Smart Living',
              ikon: Icons.local_hospital,
              deskripsi: 'Fasilitas kesehatan modern dan kawasan pemukiman yang aman.',
            ),
            KartuPilar(
              namaPilar: 'Smart Mobility',
              ikon: Icons.directions_bus,
              deskripsi: 'Transportasi umum ramah lingkungan dan integrasi lalu lintas.',
            ),
            KartuPilar(
              namaPilar: 'Smart Environment',
              ikon: Icons.eco,
              deskripsi: 'Pengelolaan limbah mandiri dan pemantauan kualitas udara.',
            ),
            KartuPilar(
              namaPilar: 'Smart People',
              ikon: Icons.people,
              deskripsi: 'Pendidikan berbasis teknologi dan peningkatan literasi warga.',
            ),
            SizedBox(height: 20.0),
            PanelLaporanWarga(),
          ],
        ),
      ),
    );
  }
}