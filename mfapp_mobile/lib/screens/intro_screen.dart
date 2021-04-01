import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../screens/tabs_screen.dart';

class IntroScreen extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Memorial Fundraising',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Here you can write the description of the page, to explain someting amazing to your friends!',
                style: TextStyle(
                  fontSize: 18,
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        image: Image.asset(
          'assets/images/Welcome @2x.jpg',
          // height: 290.64,
          // width: 361.39,
          alignment: Alignment.center,
          fit: BoxFit.fill,
        ),
      ),
      PageViewModel(
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create a Fundraiser',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Here you can write the description of the page, to explain someting...',
                style: TextStyle(
                  fontSize: 18,
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        image: Image.asset(
          'assets/images/Create a Fundraiser@2x.jpg',
          // height: 290.64,
          // width: 361.39,
          alignment: Alignment.center,
          fit: BoxFit.fill,
        ),
      ),
      PageViewModel(
          titleWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Stay up to date',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Here you can write the description of the page, to explain someting...',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          image: Image.asset(
            'assets/images/Stay up to date@2x.jpg',
            // height: 290.64,
            // width: 361.39,
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
          footer: ElevatedButton(
            child: Text(
              'Create Account',
              style: TextStyle(fontSize: 21.0),
            ),
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                primary: Color.fromRGBO(0, 219, 176, 1),
                padding: EdgeInsets.fromLTRB(101, 19, 101, 19),
                textStyle: TextStyle(
                  color: Colors.white,
                )),
            onPressed: () {},
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(85),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        body: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          onDone: () {},
          // controlsMargin: EdgeInsets.fromLTRB(50, 0, 50, 100),
          pages: getPages(),
          showNextButton: false,
          showSkipButton: false,
          showDoneButton: false,
          dotsDecorator: DotsDecorator(
            activeSize: const Size(20.0, 10.0),
            size: const Size.square(10.0),
            activeColor: Theme.of(context).primaryColor,
            spacing: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
        ),
      ),
    );
  }
}
