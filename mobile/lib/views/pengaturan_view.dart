import 'package:flutter/material.dart';

class PengaturanView extends StatefulWidget {
  const PengaturanView({super.key});

  @override
  State<PengaturanView> createState() => _PengaturanViewState();
}

class _PengaturanViewState extends State<PengaturanView> {
  bool _notifikasi = true;
  bool _modeGelap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Pengaturan", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Notifikasi", style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: const Text("Aktifkan pengingat belajar"),
            value: _notifikasi,
            activeColor: const Color(0xFF7000FF),
            onChanged: (val) {
              setState(() => _notifikasi = val);
            },
          ),
          SwitchListTile(
            title: const Text("Mode Gelap", style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: const Text("Tampilan aplikasi lebih gelap"),
            value: _modeGelap,
            activeColor: const Color(0xFF7000FF),
            onChanged: (val) {
              setState(() => _modeGelap = val);
            },
          ),
          ListTile(
            title: const Text("Bahasa", style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: const Text("Bahasa Indonesia"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Tentang Aplikasi", style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: const Text("Versi 1.0.0"),
            trailing: const Icon(Icons.info_outline),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
