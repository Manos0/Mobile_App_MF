import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../bin/colors.dart';

class StoryWidget extends StatelessWidget {
  final content;

  StoryWidget({this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(13.0),
        color: mfPrimaryColor,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Story',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
          ReadMoreText(
            content,
            style: TextStyle(
              color: Color.fromRGBO(103, 107, 127, 1),
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
            trimCollapsedText: '  Show more',
            trimExpandedText: ' Show less',
            moreStyle: TextStyle(fontSize: 16, color: mfPrimaryColor),
            lessStyle: TextStyle(fontSize: 16, color: mfPrimaryColor),
            trimMode: TrimMode.Line,
            trimLines: 5,
            delimiter: '',
          ),
        ],
      ),
    );
  }
}
