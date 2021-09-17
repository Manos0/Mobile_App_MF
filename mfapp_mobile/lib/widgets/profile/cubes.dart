import 'package:flutter/material.dart';

import '../../bin/colors.dart';

class Cubes extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final price;

  Cubes({this.color, this.icon, this.text, this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.0),
      ),
      elevation: 1,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 55,
              height: 55,
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(11),
                ),
                color: color,
              ),
              child: Icon(
                icon,
                size: 35,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    text,
                    softWrap: true,
                    style: TextStyle(
                      color: mfLettersColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  price.toStringAsFixed(0),
                  style: TextStyle(
                    color: color,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
