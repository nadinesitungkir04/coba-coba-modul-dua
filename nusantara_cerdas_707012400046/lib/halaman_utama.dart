import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'kepala_kota.dart';
import 'kartu_pilar.dart';
import 'panel_laporan.dart';
import 'laporan_model.dart';
import 'ringkasan_laporan.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    final jumlah = context.select<LaporanModel, int>(
      (model) => model.jumlahLaporan,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nusantara Cerdas',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal[800],
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Ringkasan Laporan',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const RingkasanLaporan(),
                ),
              );
            },
            icon: Badge(
              label: Text('$jumlah'),
              isLabelVisible: jumlah > 0,
              child: const Icon(
                Icons.assessment,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const KepalaKota(
              namaKota: 'Kota Nusantara',
              semboyan: 'Kota Cerdas, Hijau, dan Berkelanjutan',
              ikon: Icons.location_city,
            ),
            const SizedBox(height: 20),
            const Text(
              'Enam Pilar Smart City',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            const KartuPilar(
              namaPilar: 'Smart Governance',
              ikon: Icons.account_balance,
              deskripsi:
                  'Layanan publik digital terpadu dan tata kelola transparan.',
            ),
            const KartuPilar(
              namaPilar: 'Smart Economy',
              ikon: Icons.store,
              deskripsi:
                  'Pemberdayaan UMKM digital dan transaksi nontunai ramah pasar.',
            ),
            const KartuPilar(
              namaPilar: 'Smart Living',
              ikon: Icons.local_hospital,
              deskripsi:
                  'Fasilitas kesehatan modern dan kawasan pemukiman yang aman.',
            ),
            const KartuPilar(
              namaPilar: 'Smart Mobility',
              ikon: Icons.directions_bus,
              deskripsi:
                  'Transportasi umum ramah lingkungan dan integrasi lalu lintas.',
            ),
            const KartuPilar(
              namaPilar: 'Smart Environment',
              ikon: Icons.eco,
              deskripsi:
                  'Pengelolaan limbah mandiri dan pemantauan kualitas udara.',
            ),
            const KartuPilar(
              namaPilar: 'Smart People',
              ikon: Icons.people,
              deskripsi:
                  'Pendidikan berbasis teknologi dan peningkatan literasi warga.',
            ),
            const SizedBox(height: 20),
            const PanelLaporanWarga(),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RingkasanLaporan(),
                    ),
                  );
                },
                icon: const Icon(Icons.analytics),
                label: const Text('Lihat Ringkasan Laporan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}