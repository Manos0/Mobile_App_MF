import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../bin/colors.dart';

class StoryWidget extends StatelessWidget {
  final content;

  StoryWidget({this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
            bottomLeft: Radius.circular(13),
            bottomRight: Radius.circular(13)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              'Story',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
          ReadMoreText(
            content,
            style: TextStyle(
              color: Color.fromRGBO(103, 107, 127, 1),
              fontFamily: 'Poppins',
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
            trimCollapsedText: '  \nShow more',
            trimExpandedText: ' \nShow less',
            moreStyle: TextStyle(fontSize: 14, color: mfPrimaryColor),
            lessStyle: TextStyle(fontSize: 14, color: mfPrimaryColor),
            trimMode: TrimMode.Line,
            trimLines: 5,
            delimiter: '',
          ),
        ],
      ),
    );
  }
}
