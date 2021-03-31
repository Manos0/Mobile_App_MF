import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/dashboard_screen.dart';
import './screens/fundraisers_screen.dart';
import './screens/profile_screen.dart';
import './screens/settings_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MFApp',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 219, 176, 1),
        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/', //default is '/'
      routes: {
        '/': (ctx) => TabScreen(),
        DashboardScreen.routeName: (ctx) => DashboardScreen(),
        FundraisersScreen.routeName: (ctx) => FundraisersScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => DashboardScreen(),
        );
      },
    );
  }
}
