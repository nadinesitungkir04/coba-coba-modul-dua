
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'laporan_model.dart';

class PanelLaporanWarga extends StatelessWidget {
  const PanelLaporanWarga({super.key});

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

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Panel Laporan Warga',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '$jumlah',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            const Text(
              'Jumlah Laporan Aktif',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: warna.withAlpha(30),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: warna),
              ),
              child: Text(
                'Status: ${model.statusPelayanan}',
                style: TextStyle(
                  color: warna,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<LaporanModel>().tambahLaporan();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Laporan Masuk'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context
                          .read<LaporanModel>()
                          .selesaikanLaporan();
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Laporan Selesai'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  context.read<LaporanModel>().resetLaporan();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reset Harian'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}