import 'package:flutter/material.dart';
import 'package:mfapp_mobile/screens/tabs_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './auth_screen.dart';
import './intro_screen.dart';
import '../providers/auth.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splashScreen";
  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<SplashScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      _handleStartScreen();
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushNamed(context, IntroScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  Future<void> _handleStartScreen() async {
    Auth _auth = Auth();

    if (await _auth.tryAutoLogin()) {
      Navigator.popAndPushNamed(context, AuthScreen.routeName);
    } else {
      Navigator.popAndPushNamed(context, TabsScreen.routeName);
    }
  }
}
