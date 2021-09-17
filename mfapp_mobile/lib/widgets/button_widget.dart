import 'package:flutter/material.dart';

class GoToLogin extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const GoToLogin({
    Key key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: onClicked,
        color: Theme.of(context).primaryColor,
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12.5),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      );
}
