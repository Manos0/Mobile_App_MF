import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../bin/api_addresses.dart';

class Auth with ChangeNotifier {
  String _token;
  String _username;
  String _password;

  bool get isAuth {
    if (token != null && _username != null && _password != null) {
      return true;
    } else {
      return false;
    }
  }

  String get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  Future<void> login(String username, String password) async {
    final url = Uri.parse(ApiProvider.baseUrl + ApiProvider.loginCall);
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
    _username = username;
    _password = password;
    final responseData = json.decode(response.body);
    _token = responseData['accessToken'];
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('rememberMe')) {
      prefs.setString('username', username);
      prefs.setString('password', password);
      _username = prefs.getString('username');
      _password = prefs.getString('password');
    }
    prefs.setString('userData', _token);
    // Gia dokimes !!!
    // Timer(Duration(seconds: 20), () {
    //   print('Here it comes');
    //   logout();
    // });
  }

  Future<void> logout() async {
    _token = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    prefs.remove('username');
    prefs.remove('password');
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    _token = prefs.getString('userData');
    _username = prefs.getString('username');
    _password = prefs.getString('password');
    notifyListeners();
    return true;
  }
}
