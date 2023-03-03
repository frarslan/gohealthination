import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _baseUrl = 'https://backend.gohealthination.com';

  static Future<String?> login(String username, String password) async {
    final url = Uri.parse('$_baseUrl/users/dj-rest-auth/login/');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) ['user']['token'];
      } else {
       // debugPrint(response.body);
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static _saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    debugPrint('Token kaydedildi: $token');
  }
}