
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'laporan_model.dart';

class RingkasanLaporan extends StatelessWidget {
  const RingkasanLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LaporanModel>();
    final jumlah = model.jumlahLaporan;

    final Color warna;
    if (jumlah < 5) {
      warna = Colors.green;
    } else if (jumlah <= 10) {
      warna = Colors.orange;
    } else {
      warna = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ringkasan Laporan'),
        backgroundColor: Colors.teal[800],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.assessment,
                    size: 64,
                    color: Colors.teal,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Ringkasan Laporan Warga',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$jumlah',
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('Jumlah Laporan Aktif'),
                  const SizedBox(height: 16),
                  Chip(
                    avatar: Icon(
                      Icons.circle,
                      color: warna,
                      size: 14,
                    ),
                    label: Text(model.statusPelayanan),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Kembali ke Beranda'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}