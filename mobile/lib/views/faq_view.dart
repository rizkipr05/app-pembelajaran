import 'package:flutter/material.dart';

class FaqView extends StatefulWidget {
  const FaqView({super.key});

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  final List<Map<String, String>> _faqs = [
    {
      'q': 'Apa itu Ardata Learning?',
      'a': 'Ardata Learning adalah aplikasi pembelajaran digital yang menyediakan materi teori, video tutorial, dan kuis interaktif untuk membantu kamu belajar dengan menyenangkan.',
    },
    {
      'q': 'Bagaimana cara memulai kuis?',
      'a': 'Kamu bisa memulai kuis dengan memilih menu "Kuis" di halaman utama, lalu tekan tombol "Mulai Kuis Sekarang". Tersedia 30 soal pilihan ganda yang dipilih secara acak.',
    },
    {
      'q': 'Apa itu badge dan bagaimana cara mendapatkannya?',
      'a': 'Badge adalah penghargaan digital yang kamu dapatkan atas pencapaian tertentu, seperti menyelesaikan kuis pertama, mendapat skor sempurna, atau membaca semua materi.',
    },
    {
      'q': 'Apakah materi bisa diakses tanpa internet?',
      'a': 'Saat ini materi memerlukan koneksi internet karena datanya diambil dari server. Fitur mode offline mungkin tersedia di versi mendatang.',
    },
    {
      'q': 'Bagaimana cara mengubah data profil saya?',
      'a': 'Buka menu samping (ikon hamburger) → pilih "Profil saya". Di halaman profil kamu bisa memperbarui nama, nomor telepon, dan alamat.',
    },
    {
      'q': 'Bagaimana cara logout dari aplikasi?',
      'a': 'Buka menu samping → scroll ke bawah → tekan tombol "Keluar". Kamu akan diarahkan kembali ke halaman login.',
    },
    {
      'q': 'Saya lupa password, apa yang harus dilakukan?',
      'a': 'Hubungi administrator Ardata Learning untuk melakukan reset password. Fitur lupa password mandiri akan hadir di pembaruan berikutnya.',
    },
    {
      'q': 'Apakah ada biaya untuk menggunakan aplikasi ini?',
      'a': 'Tidak, Ardata Learning sepenuhnya gratis untuk semua pengguna yang terdaftar.',
    },
  ];

  int? _openIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pusat Bantuan & FAQ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF7000FF),
        iconTheme: const IconThemeData(color: Color(0xFF7000FF)),
      ),
      body: Column(
        children: [
          // Header banner
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF7000FF).withOpacity(0.07),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7000FF).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.help_outline_rounded,
                      color: Color(0xFF7000FF), size: 28),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ada pertanyaan?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF7000FF))),
                      SizedBox(height: 4),
                      Text('Temukan jawaban di bawah ini.',
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // FAQ List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
              itemCount: _faqs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final isOpen = _openIndex == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                    color: isOpen
                        ? const Color(0xFF7000FF).withOpacity(0.05)
                        : Colors.grey[50],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isOpen
                          ? const Color(0xFF7000FF).withOpacity(0.3)
                          : Colors.grey.shade200,
                      width: 1.5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        setState(() {
                          _openIndex = isOpen ? null : index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    _faqs[index]['q']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: isOpen
                                          ? const Color(0xFF7000FF)
                                          : Colors.black87,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                AnimatedRotation(
                                  turns: isOpen ? 0.5 : 0,
                                  duration: const Duration(milliseconds: 250),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: isOpen
                                        ? const Color(0xFF7000FF)
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            if (isOpen) ...[
                              const SizedBox(height: 12),
                              const Divider(height: 1),
                              const SizedBox(height: 12),
                              Text(
                                _faqs[index]['a']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
