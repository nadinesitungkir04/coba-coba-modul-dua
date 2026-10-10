import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'halaman_utama.dart';
import 'laporan_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LaporanModel(),
      child: const NusantaraCerdasApp(),
    ),
  );
}

class NusantaraCerdasApp extends StatelessWidget {
  const NusantaraCerdasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nusantara Cerdas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const HalamanUtama(),
    );
  }
}