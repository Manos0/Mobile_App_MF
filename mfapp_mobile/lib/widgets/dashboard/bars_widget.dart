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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                  Text(
                    text,
                    style: TextStyle(
                      color: mfLettersColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 29,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(11)),
                  color: secondColor,
                ),
                child: Center(
                  child: Text(
                    '${info.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
