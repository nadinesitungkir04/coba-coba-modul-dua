import 'package:flutter/foundation.dart';

class LaporanModel extends ChangeNotifier {
  int _jumlahLaporan = 0;

  int get jumlahLaporan => _jumlahLaporan;

  String get statusPelayanan {
    if (_jumlahLaporan < 5) {
      return 'Pelayanan Lancar';
    } else if (_jumlahLaporan <= 10) {
      return 'Pelayanan Sibuk';
    } else {
      return 'Perlu Penambahan Petugas';
    }
  }

  void tambahLaporan() {
    _jumlahLaporan++;
    notifyListeners();
  }

  void selesaikanLaporan() {
    if (_jumlahLaporan > 0) {
      _jumlahLaporan--;
      notifyListeners();
    }
  }

  void resetLaporan() {
    _jumlahLaporan = 0;
    notifyListeners();
  }
}