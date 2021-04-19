import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bin/colors.dart';
import './screens/tabs_screen.dart';
import './screens/dashboard_screen.dart';
import './screens/fundraisers_screen.dart';
import './screens/profile_screen.dart';
import './screens/settings_screen.dart';
import './screens/auth_screen.dart';
import './providers/auth.dart';
import './providers/fundraisers.dart';
import './screens/intro_screen.dart';

int initScreen;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Fundraisers>(
          create: null,
          update: (ctx, auth, previousFundraisers) => Fundraisers(
            auth.token,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MFApp',
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: mfPrimaryColor,
            canvasColor: Colors.white,
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  body1: TextStyle(
                    color: Color.fromRGBO(175, 178, 188, 1),
                  ),
                ),
          ),
          home: auth.isAuth
              ? TabsScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshop) => AuthScreen(),
                ),
          // home: IntroScreen(),
          routes: {
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
        ),
      ),
    );
  }
}
