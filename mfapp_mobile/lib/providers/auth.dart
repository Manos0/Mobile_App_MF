import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  Future<void> signup(String username, String password) async {
    final url = Uri.parse('');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'username': username,
          'password': password,
        },
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> login(String username, String password) async {
    final url = Uri.parse(
        'https://mfdev.t-worxsites.com/DesktopModules/JwtAuth/API/mobile/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Host': 'mfdev.t-worxsites.com',
      },
      body: json.encode(
        {
          'u': username,
          'p': password,
        },
      ),
    );
    final responseData = json.decode(response.body);
    _token = responseData['accessToken'];
    print(json.decode(response.body));
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({'token': _token});
    prefs.setString('userData', userData);
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    _token = extractedUserData['token'];
    notifyListeners();
    return true;
  }
}
