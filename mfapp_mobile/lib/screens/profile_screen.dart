import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bin/colors.dart';
import '../providers/provider.dart';
import '../providers/auth.dart';
import '../providers/user_stats.dart';
import '../providers/locations.dart';
import '../widgets/profile/user_details_widget.dart';
import '../screens/tabs_screen.dart';
import '../screens/auth_screen.dart';

String username = '';
String password = '';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _isInit = true;
  Future<UserStats> userData;
  // Future<List<Locations>> locations;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      userData = Provider.of<Fundraisers>(context, listen: false)
          .getUserData()
          .whenComplete(() =>
              Provider.of<Fundraisers>(context, listen: false).getLocations());
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
      await Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => TabsScreen(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
      // await Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
    } else {
      await Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserStats>(
      future: userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return UserDetailsWidget(snapshot.data);
          // return UserDetailsWidget(snapshot.data, locations);
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
