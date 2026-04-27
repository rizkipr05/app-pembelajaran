import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Desktop/Linux/Web: http://localhost:8080/app-pembelajaran/api
  // Android Emulator:  http://10.0.2.2:8080/app-pembelajaran/api
  static const String baseUrl = 'http://localhost:8080/app-pembelajaran/api';

  // Helper: safely decode JSON, return error map if empty/invalid
  Map<String, dynamic> _decodeResponse(http.Response response) {
    final body = response.body.trim();
    if (body.isEmpty) {
      return {'status': 'error', 'message': 'Server tidak merespons. Cek koneksi ke XAMPP dan database.'};
    }
    try {
      return jsonDecode(body);
    } catch (_) {
      return {'status': 'error', 'message': 'Respons server tidak valid: $body'};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth.php?action=login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      ).timeout(const Duration(seconds: 10));

      final result = _decodeResponse(response);
      if (result['status'] == 'success') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('user_id', result['user']['id']);
        await prefs.setString('user_name', result['user']['name'] ?? '');
        await prefs.setString('user_email', result['user']['email'] ?? '');
      }
      return result;
    } catch (e) {
      return {'status': 'error', 'message': 'Koneksi gagal: ${e.toString()}'};
    }
  }

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth.php?action=register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      ).timeout(const Duration(seconds: 10));

      return _decodeResponse(response);
    } catch (e) {
      return {'status': 'error', 'message': 'Koneksi gagal: ${e.toString()}'};
    }
  }

  Future<Map<String, dynamic>> getProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.getInt('user_id');
      if (id == null) return {'status': 'error', 'message': 'Belum login'};

      final response = await http.get(
        Uri.parse('$baseUrl/profile.php?action=get&id=$id'),
      ).timeout(const Duration(seconds: 10));

      return _decodeResponse(response);
    } catch (e) {
      return {'status': 'error', 'message': 'Koneksi gagal: ${e.toString()}'};
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
