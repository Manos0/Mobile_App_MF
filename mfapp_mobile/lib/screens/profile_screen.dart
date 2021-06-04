import 'package:flutter/material.dart';
import '../providers/user_details.dart';
import 'package:provider/provider.dart';

import '../providers/fundraisers.dart';
import '../widgets/profile/user_details_widget.dart';
import '../providers/fundraiser.dart';
import '../providers/user_stats.dart';
import '../providers/specific_fundraisers.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _isInit = true;
  Future<UserStats> userData;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      userData = Provider.of<Fundraisers>(context).getUserData();
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
          return UserDetailsWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
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
