import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/fundraisers.dart';
import '../widgets/dashboard/dashboard.dart';
import '../providers/user_stats.dart';
import '../providers/fundraiser.dart';

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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserStats>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DashboardWidget(snapshot.data, fundraisers);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
