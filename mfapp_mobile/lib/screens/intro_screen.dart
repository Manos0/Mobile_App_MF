import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bin/colors.dart';
import './auth_screen.dart';
import '../widgets/button_widget.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = "/intro_creen";
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome to Memorial Fundraising',
              body:
                  'Here you can write the description of the page Here you can write the description of the page.',
              image: buildImage('assets/images/Welcome @2x.png'),
              decoration: getPageDecoration(),
              footer: SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            PageViewModel(
              title: 'Create a Fundraiser',
              body:
                  'Here you can write the description of the page Here you can write the description of the page.',
              image: buildImage('assets/images/Create a Fundraiser@2x.png'),
              decoration: getPageDecoration(),
              footer: SizedBox(
                height: 130,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            PageViewModel(
              title: 'Stay up to date',
              body:
                  'Here you can write the description of the page Here you can write the description of the page.',
              useScrollView: false,
              image: buildImage('assets/images/Stay up to date@2x.png'),
              decoration: getPageDecoration(),
              footer: GoToLogin(
                text: 'Get Started',
                onClicked: () => goToAuth(context),
              ),
            ),
          ],
          dotsDecorator: getDotDecoration(),
          globalBackgroundColor: Colors.white,
          // done: Text('Done'),
          // onDone: () => goToAuth(context),
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
          color: mfThrirdLetterColor,
        ),
        descriptionPadding:
            EdgeInsets.fromLTRB(30, 8, 30, 8).copyWith(bottom: 0),
        imagePadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        pageColor: Colors.white,
        bodyAlignment: Alignment.center,
        titlePadding: EdgeInsets.only(top: 0, bottom: 8.7),
      );
}
