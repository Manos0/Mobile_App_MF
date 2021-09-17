import 'package:flutter/material.dart';
import '../../bin/colors.dart';

class BarsWidget extends StatelessWidget {
  final String text;
  final info;
  final IconData icon;
  final Color color;

  BarsWidget({
    this.text,
    this.info,
    this.icon,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.0),
      ),
      elevation: 1,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Container(
        margin: EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 12),
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
                    color: mfThrirdLetterColor,
                    fontSize: 14,
                  ),
                ),
                Text(
                  info.toStringAsFixed(0),
                  style: TextStyle(
                    // color: mfLettersColor,
                    color: color,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
