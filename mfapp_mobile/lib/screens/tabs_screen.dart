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
          color: Theme.of(context).primaryColor,
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
            activeIcon: Image.asset('assets/icons/Dashboard-active.png'),
            backgroundColor: Color.fromRGBO(32, 14, 50, 1),
            icon: Image.asset('assets/icons/Dashboard.png'),
            title: Text(
              'Dashboard',
              style: TextStyle(
                // fontSize: 10,
                color: Color.fromRGBO(32, 14, 50, 1),
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('assets/icons/Fundraisers-active.png'),
            backgroundColor: Color.fromRGBO(32, 14, 50, 1),
            icon: Image.asset('assets/icons/Fundraisers.png'),
            title: Text(
              'Fundraisers',
              style: TextStyle(
                color: Color.fromRGBO(32, 14, 50, 1),
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('assets/icons/Profile-active.png'),
            backgroundColor: Color.fromRGBO(32, 14, 50, 1),
            icon: Image.asset('assets/icons/Profile.png'),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Color.fromRGBO(32, 14, 50, 1),
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('assets/icons/Setting-active.png'),
            backgroundColor: Color.fromRGBO(32, 14, 50, 1),
            icon: Image.asset('assets/icons/Setting.png'),
            title: Text(
              'Settings',
              style: TextStyle(
                color: Color.fromRGBO(32, 14, 50, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
