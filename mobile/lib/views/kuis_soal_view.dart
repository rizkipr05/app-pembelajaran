import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/auth_service.dart';

class KuisSoalView extends StatefulWidget {
  const KuisSoalView({super.key});

  @override
  State<KuisSoalView> createState() => _KuisSoalViewState();
}

class _KuisSoalViewState extends State<KuisSoalView> {
  bool _isLoading = true;
  List<dynamic> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  String? _selectedAnswer;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  Future<void> _fetchQuestions() async {
    try {
      final response = await http.get(Uri.parse('${AuthService.baseUrl}/quiz.php?action=get'));
      final result = jsonDecode(response.body);
      if (result['status'] == 'success') {
        setState(() {
          _questions = result['data'] ?? [];
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  void _selectAnswer(String letter) {
    if (_answered) return;
    setState(() {
      _selectedAnswer = letter;
      _answered = true;
      if (_questions[_currentIndex]['jawaban_benar'] == letter) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswer = null;
        _answered = false;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.emoji_events, size: 64, color: Colors.amber),
              const SizedBox(height: 16),
              const Text("Kuis Selesai!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text("Skor Anda: $_score / ${_questions.length}",
                  style: const TextStyle(fontSize: 18, color: Colors.grey)),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7000FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14)
                ),
                child: const Text("Tutup", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator(color: Color(0xFF7000FF))),
      );
    }

    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Kuis"), backgroundColor: Colors.white, foregroundColor: Colors.black),
        body: const Center(child: Text("Tidak ada soal tersedia.")),
      );
    }

    final q = _questions[_currentIndex];
    final correctAnswer = q['jawaban_benar'];
    final totalQ = _questions.length;
    final progress = (_currentIndex + 1) / totalQ;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Soal ${_currentIndex + 1} / $totalQ"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            color: const Color(0xFF7000FF),
            minHeight: 6,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            // Nomor soal chip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF7000FF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Pertanyaan ${_currentIndex + 1}",
                style: const TextStyle(color: Color(0xFF7000FF), fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Text(
                  q['soal'],
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, height: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 5,
              child: ListView(
                children: [
                  _buildOption("A", q['opsi_a'], correctAnswer),
                  const SizedBox(height: 10),
                  _buildOption("B", q['opsi_b'], correctAnswer),
                  const SizedBox(height: 10),
                  _buildOption("C", q['opsi_c'], correctAnswer),
                  const SizedBox(height: 10),
                  _buildOption("D", q['opsi_d'], correctAnswer),
                  if (q['opsi_e'] != null && q['opsi_e'].toString().isNotEmpty) ...[
                    const SizedBox(height: 10),
                    _buildOption("E", q['opsi_e'], correctAnswer),
                  ],
                ],
              ),
            ),
            if (_answered) ...[
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7000FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  _currentIndex < _questions.length - 1 ? "Soal Berikutnya →" : "Lihat Hasil",
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String letter, String? value, String correct) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();

    Color bgColor = Colors.grey[100]!;
    Color borderColor = Colors.grey.shade300;
    Color textColor = Colors.black87;

    if (_answered) {
      if (letter == correct) {
        bgColor = Colors.green[50]!;
        borderColor = Colors.green;
        textColor = Colors.green[800]!;
      } else if (letter == _selectedAnswer) {
        bgColor = Colors.red[50]!;
        borderColor = Colors.red;
        textColor = Colors.red[800]!;
      }
    } else if (letter == _selectedAnswer) {
      bgColor = const Color(0xFF7000FF).withOpacity(0.1);
      borderColor = const Color(0xFF7000FF);
    }

    return InkWell(
      onTap: () => _selectAnswer(letter),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: (_answered && letter == correct) ? Colors.green :
                              (_answered && letter == _selectedAnswer && letter != correct) ? Colors.red :
                              const Color(0xFF7000FF),
              child: Text(letter, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(value, style: TextStyle(fontSize: 14, color: textColor))),
          ],
        ),
      ),
    );
  }
}
