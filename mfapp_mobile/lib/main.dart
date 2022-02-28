import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bin/colors.dart';
import './providers/template-choice.dart';

import './screens/tabs_screen.dart';
import './screens/dashboard_screen.dart';
import './screens/fundraisers_screen.dart';
import './screens/profile_screen.dart';
import './screens/auth_screen.dart';
import './screens/intro_screen.dart';
import './screens/fundraiser_detail_screen.dart';
import './screens/search_results_fundraisers.dart';
import './screens/add_fundraiser/add_fundraiser_screen.dart';
import './screens/add_fundraiser/add_fundraiser_image.dart';
import './screens/add_fundraiser/form_screen.dart';
import './screens/add_fundraiser/add_contacts_screen.dart';
import './screens/add_fundraiser/obituary_screen.dart';
import './screens/add_fundraiser/funeral_service_screen.dart';
import './screens/add_fundraiser/funeral_service_preview_screen.dart';
import './widgets/edit_fundraiser/edit_fundraiser_grid.dart';

import './providers/auth.dart';
import './providers/provider.dart';
// import './providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final prefs = await SharedPreferences.getInstance();
  final bool looked = prefs.getBool('firstTime');
  Widget _Screen;
  if (looked == null || looked == false) {
    _Screen = IntroScreen();
  } else {
    _Screen = AuthScreen();
  }
  runApp(MyApp(_Screen));
}

class MyApp extends StatelessWidget {
  final Widget _Screen;
  MyApp(this._Screen);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TemplateChoice(),
        ),
        ChangeNotifierProxyProvider<Auth, Fundraisers>(
          create: null,
          update: (ctx, auth, previousFundraisers) =>
              Fundraisers(auth.token, List.empty(), null),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Memorial Fundraising',
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: mfPrimaryColor,
            accentColor: mfLightBlueColor,
            canvasColor: Colors.white,
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  body1: TextStyle(
                    color: Color.fromRGBO(175, 178, 188, 1),
                  ),
                ),
          ),
          // home: SplashScreen(),
          // initialRoute: SplashScreen(),
          home: auth.isAuth
              ? TabsScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshop) => this._Screen,
                ),
          routes: {
            AuthScreen.routeName: (ctx) => AuthScreen(),
            TabsScreen.routeName: (ctx) => TabsScreen(),
            FundraiserDetailScreen.routeName: (ctx) => FundraiserDetailScreen(),
            DashboardScreen.routeName: (ctx) => DashboardScreen(),
            FundraisersScreen.routeName: (ctx) => FundraisersScreen(),
            ProfileScreen.routeName: (ctx) => ProfileScreen(),
            SearchResultsFundraisers.routeName: (ctx) =>
                SearchResultsFundraisers(),
            AddFundraiserScreen.routeName: (ctx) => AddFundraiserScreen(),
            ImagePickerScreen.routeName: (ctx) => ImagePickerScreen(),
            FormScreen.routeName: (ctx) => FormScreen(),
            AddContactsScreen.routeName: (ctx) => AddContactsScreen(),
            ObituaryScreen.routeName: (ctx) => ObituaryScreen(),
            FuneralServiceScreen.routeName: (ctx) => FuneralServiceScreen(),
            FuneralServicePreviewScreen.routeName: (ctx) =>
                FuneralServicePreviewScreen(),
            EditFundraiserGrid.routeName: (ctx) => EditFundraiserGrid(),
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
              builder: (ctx) => AuthScreen(),
            );
          },
        ),
      ),
    );
  }
}
