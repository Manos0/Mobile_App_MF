import 'package:flutter/material.dart';
import '../providers/user_details.dart';
import 'package:provider/provider.dart';

import '../providers/fundraisers.dart';
import '../widgets/settings/settings_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserDetails>(
      future: userDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SettingsWidget(snapshot.data);
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
