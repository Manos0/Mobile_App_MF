import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bin/colors.dart';
import '../providers/provider.dart';
import '../providers/fundraiser_details.dart';
import '../widgets/fundraisers/fundraisers_details/fundraisers_details_view.dart';
import '../providers/auth.dart';
import '../screens/tabs_screen.dart';
import '../screens/auth_screen.dart';

String username = '';
String password = '';

class FundraiserDetailScreen extends StatefulWidget {
  static const routeName = '/fundraiser-detail';

  @override
  _FundraiserDetailScreenState createState() => _FundraiserDetailScreenState();
}

class _FundraiserDetailScreenState extends State<FundraiserDetailScreen> {
  Future<FundraiserDetails> fundraiserDetails;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final fundraiserId = ModalRoute.of(context).settings.arguments as int;
    fundraiserDetails =
        Provider.of<Fundraisers>(context).findById(fundraiserId);
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
    return Material(
      child: FutureBuilder<FundraiserDetails>(
        future: fundraiserDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FundraisersDetailsView(snapshot.data);
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
      ),
    );
  }
}
