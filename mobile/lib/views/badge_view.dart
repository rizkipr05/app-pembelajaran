import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../services/auth_service.dart';

class BadgeView extends StatefulWidget {
  const BadgeView({super.key});

  @override
  State<BadgeView> createState() => _BadgeViewState();
}

class _BadgeViewState extends State<BadgeView> {
  bool _isLoading = true;
  List<dynamic> _badges = [];

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id') ?? 0;
    try {
      final resp = await http.get(Uri.parse('${AuthService.baseUrl}/badge_api.php?action=get&user_id=$userId'));
      final result = jsonDecode(resp.body);
      setState(() {
        _badges = result['data'] ?? [];
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  // Map icon names to Flutter icons (the DB stores text icon names)
  IconData _iconFromName(String name) {
    switch (name.toLowerCase()) {
      case 'star': return Icons.star;
      case 'timer': return Icons.timer;
      case 'rocket': return Icons.rocket_launch;
      case 'book': return Icons.menu_book;
      case 'trophy': return Icons.emoji_events;
      case 'fire': return Icons.local_fire_department;
      default: return Icons.workspace_premium;
    }
  }

  Color _colorFromHex(String? hex) {
    try {
      if (hex == null || hex.isEmpty) return const Color(0xFF7000FF);
      final h = hex.replaceAll('#', '');
      return Color(int.parse('FF$h', radix: 16));
    } catch (_) {
      return const Color(0xFF7000FF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Pencapaian (Badge)", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF7000FF)))
          : _badges.isEmpty
              ? const Center(child: Text("Belum ada badge.", style: TextStyle(color: Colors.grey)))
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: _badges.length,
                    itemBuilder: (context, index) {
                      final b = _badges[index];
                      final bool unlocked = b['unlocked'] == 1 || b['unlocked'] == true || b['unlocked'] == '1';
                      final color = _colorFromHex(b['warna']);
                      final icon = _iconFromName(b['icon'] ?? '');

                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: unlocked ? color.withOpacity(0.5) : Colors.grey.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon, size: 48, color: unlocked ? color : Colors.grey[300]),
                            const SizedBox(height: 12),
                            Text(
                              b['nama'] ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: unlocked ? Colors.black87 : Colors.grey,
                              ),
                            ),
                            if (!unlocked) ...[
                              const SizedBox(height: 4),
                              const Text("Terkunci", style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ]
                          ],
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
