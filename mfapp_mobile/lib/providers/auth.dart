import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../bin/api_addresses.dart';

class Auth with ChangeNotifier {
  String _token;
  // DateTime _expiryDate;
  String _renewToken;
  String _username;
  String _password;
  // Timer _authTimer;

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
  }

  Future<void> login(String username, String password) async {
    final url = Uri.parse(baseUrl + loginCall);
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
    // _expiryDate = DateTime.now().add(
    //   Duration(seconds: 20),
    // );
    _renewToken = responseData['renewalToken'];
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', _token);
    prefs.setString('username', username);
    prefs.setString('password', password);
    // _authTimer = Timer.periodic(Duration(minutes: 30), (timer) {
    //   renewalToken(username, password);
    // });
    // Future<void>.delayed(Duration(seconds: 10), () async {
    //   final url = Uri.parse(baseUrl + loginCall);
    //   final response = await http.post(
    //     url,
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'Host': 'mfdev.t-worxsites.com',
    //       'Authorization': 'Bearer ' + _renewToken
    //     },
    //     body: json.encode(
    //       {
    //         'u': username,
    //         'p': password,
    //       },
    //     ),
    //   );
    //   final responseData = json.decode(response.body);
    //   _token = responseData['accessToken'];
    //   print(_token);
    //   _renewToken = responseData['renewalToken'];
    //   notifyListeners();
    //   final prefs = await SharedPreferences.getInstance();
    //   final userData = json.encode({'token': _token});
    //   prefs.setString('userData', userData);
    // });
  }

  // void renewalToken(String username, String password) async {
  //   final url = Uri.parse(baseUrl + loginCall);
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Host': 'mfdev.t-worxsites.com',
  //       'Authorization': 'Bearer ' + _renewToken
  //     },
  //     body: json.encode(
  //       {
  //         'u': username,
  //         'p': password,
  //       },
  //     ),
  //   );
  //   final responseData = json.decode(response.body);
  //   _token = responseData['accessToken'];
  //   print(_token);
  //   // _expiryDate = DateTime.now().add(
  //   //   Duration(seconds: 20),
  //   // );
  //   _renewToken = responseData['renewalToken'];
  //   notifyListeners();
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('userData', _token);
  // }

  Future<void> logout() async {
    _token = null;
    // _expiryDate = null;
    // if (_authTimer != null) {
    //   _authTimer.cancel();
    // }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.clear();
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
    // _autoLogout();
    return true;
  }
  // void _autoLogout() {
  //   if (_authTimer != null) {
  //     _authTimer.cancel();
  //   }
  //   final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
  //   _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  // }
}
