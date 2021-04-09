import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mfapp_mobile/screens/fundraisers_screen.dart';

// import '../screens/tabs_screen.dart';

class IntroScreen extends StatelessWidget {
  List<PageViewModel> getPages() {
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
        image: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Image.asset(
            'assets/images/Welcome @2x.png',
            height: 290.64,
            width: 361.39,
            alignment: Alignment.center,
          ),
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
        image: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Image.asset(
            'assets/images/Create a Fundraiser@2x.png',
            height: 290.64,
            width: 361.39,
            alignment: Alignment.center,
          ),
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
            ),
          ],
        ),
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                height: 60,
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
        image: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Image.asset(
            'assets/images/Stay up to date@2x.png',
            height: 290.64,
            width: 361.39,
            alignment: Alignment.center,
          ),
        ),
        footer: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0), //To top htan 30
          child: ElevatedButton(
            child: Text(
              'Create Account',
              style: TextStyle(
                fontSize: 21.0,
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
                )),
            onPressed: () {
              // Navigator.of(context).pushReplacementNamed(FundraisersScreen.routeName);
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
          pages: getPages(),
          showNextButton: false,
          showSkipButton: false,
          showDoneButton: false,
          dotsDecorator: DotsDecorator(
            color: Color.fromRGBO(175, 178, 188, 0.20),
            activeSize: const Size(20.0, 10.0),
            size: const Size.square(10.0),
            activeColor: Color.fromRGBO(175, 178, 188, 1),
            spacing: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
        ),
      ),
    );
  }
}
