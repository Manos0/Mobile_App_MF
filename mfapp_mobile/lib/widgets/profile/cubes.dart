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
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 10),
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11)),
              color: color,
            ),
            child: Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 13, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    price.toStringAsFixed(0),
                    style: TextStyle(
                      color: color,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
