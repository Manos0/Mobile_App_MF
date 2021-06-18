import 'package:flutter/material.dart';
import '../../bin/colors.dart';

class BarsWidget extends StatelessWidget {
  final dashboardData;
  final String text;
  final info;
  final IconData icon;
  final Color color;
  final Color secondColor;

  BarsWidget({
    this.dashboardData,
    this.text,
    this.info,
    this.icon,
    this.color,
    this.secondColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        elevation: 4,
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(11)),
                  color: color,
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: mfLettersColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    info.toStringAsFixed(0),
                    style: TextStyle(
                      color: mfLettersColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
