import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
<<<<<<< HEAD
import './auth_screen.dart';
import 'package:mfapp_mobile/screens/fundraisers_screen.dart';
=======
import 'package:shared_preferences/shared_preferences.dart';
>>>>>>> development

import '../bin/colors.dart';
import './auth_screen.dart';
import '../widgets/button_widget.dart';

class IntroScreen extends StatelessWidget {
<<<<<<< HEAD
  static const routeName = '/introScreen';

  List<PageViewModel> getPages(BuildContext context) {
    return [
      PageViewModel(
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'Welcome to Memorial Fundraising',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                height: 80,
                width: 350,
                child: Text(
                  // vale to poppins - medium
                  'Here you can write the description of the page Here you can write the description of the page ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Color.fromRGBO(175, 178, 188, 1),
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        image: Image.asset(
          'assets/images/Welcome @2x.png',
          height: 290.64,
          width: 361.39,
          alignment: Alignment.center,
        ),
      ),
      PageViewModel(
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'Create a Fundraiser',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
=======
  static const String routeName = "/intro_creen";
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome to Memorial Fundraising',
              body:
                  'Here you can write the description of the page Here you can write the description of the page ',
              image: buildImage('assets/images/Welcome @2x.png'),
              decoration: getPageDecoration(),
>>>>>>> development
            ),
            PageViewModel(
              title: 'Create a Fundraiser',
              body:
                  'Here you can write the description of the page Here you can write the description of the page ',
<<<<<<< HEAD
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Color.fromRGBO(175, 178, 188, 1),
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        image: Image.asset(
          'assets/images/Create a Fundraiser@2x.png',
          height: 290.64,
          width: 361.39,
          alignment: Alignment.center,
        ),
      ),
      PageViewModel(
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'Welcome to Memorial Fundraising',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
=======
              image: buildImage('assets/images/Create a Fundraiser@2x.png'),
              decoration: getPageDecoration(),
>>>>>>> development
            ),
            PageViewModel(
              title: 'Stay up to date',
              body:
                  'Here you can write the description of the page Here you can write the description of the page ',
              useScrollView: false,
              image: buildImage('assets/images/Stay up to date@2x.png'),
              decoration: getPageDecoration(),
              footer: GoToLogin(
                text: 'Get Started',
                onClicked: () => goToAuth(context),
              ),
<<<<<<< HEAD
            )
          ],
        ),
        image: Image.asset(
          'assets/images/Stay up to date@2x.png',
          height: 290.64,
          width: 361.39,
          alignment: Alignment.center,
        ),
        footer: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0), //To top htan 30
          child: ElevatedButton(
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
              softWrap: false,
            ),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              primary: Color.fromRGBO(0, 219, 176, 1),
              padding: EdgeInsets.fromLTRB(99, 19, 99, 19),
              textStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
            },
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        body: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          onDone: () {},
          // controlsMargin: EdgeInsets.fromLTRB(50, 0, 50, 100),
          // dokimase na katevaseis to button edw katw
          pages: getPages(context),
=======
            ),
          ],
          dotsDecorator: getDotDecoration(),
          globalBackgroundColor: Colors.white,
          // done: Text('Done'),
          // onDone: () => goToAuth(context),
>>>>>>> development
          showNextButton: false,
          showSkipButton: false,
          showDoneButton: false,
        ),
      );

  void goToAuth(context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => AuthScreen()),
    );
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTime', true);
  }

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color.fromRGBO(103, 107, 125, 0.1),
        activeColor: Color.fromRGBO(103, 107, 125, 0.5),
        spacing: EdgeInsets.all(8),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: mfLettersColor,
          fontFamily: 'Poppins',
        ),
        bodyTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: mfThrirdLetterColor),
        descriptionPadding:
            EdgeInsets.fromLTRB(30, 8, 30, 8).copyWith(bottom: 0),
        imagePadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        pageColor: Colors.white,
        bodyAlignment: Alignment.center,
        titlePadding: EdgeInsets.only(top: 0, bottom: 8.7),
      );
}
