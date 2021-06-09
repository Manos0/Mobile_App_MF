import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/fundraisers.dart';
import '../widgets/dashboard/dashboard.dart';
import '../providers/user_stats.dart';
import '../providers/fundraiser.dart';
import '../screens/tabs_screen.dart';
import '../providers/auth.dart';
import '../bin/colors.dart';

String username = '';
String password = '';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _isInit = true;
  Future<UserStats> userData;
  Future<List<Fundraiser>> fundraisers;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      userData = Provider.of<Fundraisers>(context).getUserData();
      fundraisers = Provider.of<Fundraisers>(context).fetchAndSetFundraisers();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  refreshLogin() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
    password = prefs.getString('password');
    await Provider.of<Auth>(context, listen: false).login(username, password);
    await Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserStats>(
      future: userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DashboardWidget(snapshot.data, fundraisers);
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Something went wrong!',
                  style: TextStyle(
                      color: mfLettersColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: Icon(
                    Icons.refresh,
                    size: 35,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: refreshLogin,
                ),
              ],
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
