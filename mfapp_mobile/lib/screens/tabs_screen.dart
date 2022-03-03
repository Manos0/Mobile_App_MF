import 'package:flutter/material.dart';
import 'package:mfapp_mobile/bin/colors.dart';
import 'package:provider/provider.dart';

import './dashboard_screen.dart';
import './fundraisers_screen.dart';
import './profile_screen.dart';
import '../widgets/fundraisers/fundraiser_searchbar.dart';
import '../providers/auth.dart';
import '../screens/auth_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = "/tabs_screen";
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
  ];

  var scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Icon cusIcon = Icon(Icons.search_rounded);
  bool searchBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: color,
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(
            color: mfLettersColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.logout,
            color: mfLightGrey,
          ),
          tooltip: 'Logout',
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Provider.of<Auth>(context, listen: false).logout().then((value) =>
                Navigator.of(context)
                    .pushReplacementNamed(AuthScreen.routeName));
          },
        ),
        bottom: searchBar
            ? PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 48),
                child: FundraiserSearchbar(),
              )
            : null,
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: cusIcon,
            color: searchBar ? mfLettersColor : mfLightGrey,
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search_rounded) {
                  this.cusIcon = Icon(Icons.cancel_outlined);
                  searchBar = true;
                } else {
                  this.cusIcon = Icon(Icons.search_rounded);
                  searchBar = false;
                }
              });
            },
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            onTap: _selectPage,
            currentIndex: _selectedPageIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/icons/Dashboard-active.png',
                  scale: 2,
                ),
                icon: Image.asset(
                  'assets/icons/Dashboard.png',
                  scale: 2,
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                    color: Color.fromRGBO(32, 14, 50, 1),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/icons/Fundraisers-active.png',
                  scale: 2,
                ),
                icon: Image.asset(
                  'assets/icons/Fundraisers.png',
                  scale: 2,
                ),
                title: Text(
                  'Fundraisers',
                  style: TextStyle(
                    color: Color.fromRGBO(32, 14, 50, 1),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/icons/Profile-active.png',
                  scale: 2,
                ),
                icon: Image.asset(
                  'assets/icons/Profile.png',
                  scale: 2,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    color: Color.fromRGBO(32, 14, 50, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
