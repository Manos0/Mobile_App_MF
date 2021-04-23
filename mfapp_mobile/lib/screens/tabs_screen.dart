import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './dashboard_screen.dart';
import './fundraisers_screen.dart';
import './profile_screen.dart';
import './settings_screen.dart';
import '../providers/auth.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': DashboardScreen(),
      'title': 'Dashboard',
    },
    {
      'page': FundraisersScreen(),
      'title': 'Fundraisers',
    },
    {
      'page': ProfileScreen(),
      'title': 'Profile',
    },
    {
      'page': SettingsScreen(),
      'title': 'Settings',
    },
  ];

  var scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(_pages[_selectedPageIndex]['title']),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          color: Colors.lightBlueAccent.withOpacity(0.8),
          onPressed: () {
            Provider.of<Auth>(context, listen: false).logout();
          },
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.lightBlueAccent,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.dashboard_outlined),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.assistant),
            title: Text('Fundraisers'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.account_circle_outlined),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
