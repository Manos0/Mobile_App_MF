import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../bin/colors.dart';

class FuneralServicesWidget extends StatelessWidget {
  final locationName;
  final locationAddress1;
  final locationEmail;
  final locationPhone;

  FuneralServicesWidget({
    this.locationName,
    this.locationAddress1,
    this.locationEmail,
    this.locationPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              'Funeral Services',
              style: TextStyle(
                  color: mfSecondaryLetterColor,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                        )),
                    Text(
                      '${locationName}',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        )),
                    Text(
                      '${locationAddress1}',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      // margin:
                      //     EdgeInsets.fromLTRB(20, 6, 12, 15),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.message_outlined,
                          color: Colors.white,
                          size: 23,
                        ),
                        label: Text(
                          'Message',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            mfPrimaryColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          ),
                        ),
                        onPressed: () => launch('mailto:${locationEmail}'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      // margin: EdgeInsets.fromLTRB(0, 6, 12, 15),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.call_outlined,
                          color: Colors.white,
                          size: 23,
                        ),
                        label: Text(
                          'Call',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            mfLightBlueColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          ),
                        ),
                        onPressed: () => launch('tel://${locationPhone}'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
