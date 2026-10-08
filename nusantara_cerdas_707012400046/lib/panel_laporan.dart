import 'package:flutter/material.dart';

class PanelLaporanWarga extends StatefulWidget {
  const PanelLaporanWarga({super.key});

  @override
  State<PanelLaporanWarga> createState() => _PanelLaporanWargaState();
}

class _PanelLaporanWargaState extends State<PanelLaporanWarga> {
  int _jumlahLaporan = 0;

  void _laporanMasuk() {
    setState(() {
      _jumlahLaporan++;
    });
  }

  void _laporanSelesai() {
    setState(() {
      if (_jumlahLaporan > 0) {
        _jumlahLaporan--;
      }
    });
  }

  void _resetHarian() {
    setState(() {
      _jumlahLaporan = 0;
    });
  }

  String _dapatkanStatusPelayanan() {
    if (_jumlahLaporan < 5) {
      return 'Pelayanan Lancar';
    } else if (_jumlahLaporan <= 10) {
      return 'Pelayanan Sibuk';
    } else {
      return 'Perlu Penambahan Petugas';
    }
  }

  Color _dapatkanWarnaStatus() {
    if (_jumlahLaporan < 5) {
      return Colors.green;
    } else if (_jumlahLaporan <= 10) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Panel Laporan Warga',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              '$_jumlahLaporan',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            const Text(
              'Jumlah Laporan Aktif',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12.0),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: _dapatkanWarnaStatus().withAlpha(30),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: _dapatkanWarnaStatus()),
              ),
              child: Text(
                'Status: ${_dapatkanStatusPelayanan()}',
                style: TextStyle(
                  color: _dapatkanWarnaStatus(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _laporanMasuk,
                    icon: const Icon(Icons.add),
                    label: const Text('Laporan Masuk'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _laporanSelesai,
                    icon: const Icon(Icons.remove),
                    label: const Text('Laporan Selesai'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[800],
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _resetHarian,
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