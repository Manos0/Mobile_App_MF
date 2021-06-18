import 'package:flutter/material.dart';
import '../providers/user_details.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/provider.dart';
import '../widgets/settings/settings_widget.dart';
import '../screens/tabs_screen.dart';
import '../bin/colors.dart';
import '../providers/auth.dart';
import '../screens/auth_screen.dart';

String username = '';
String password = '';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _isInit = true;
  Future<UserDetails> userDetails;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      userDetails = Provider.of<Fundraisers>(context).getUserDetails();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  refreshLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('rememberMe')) {
      username = prefs.getString('username');
      password = prefs.getString('password');
      await Provider.of<Auth>(context, listen: false).login(username, password);
      await Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
    } else {
      await Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserDetails>(
      future: userDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SettingsWidget(snapshot.data);
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
