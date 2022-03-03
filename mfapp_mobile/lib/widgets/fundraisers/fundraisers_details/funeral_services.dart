import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../bin/colors.dart';

class FuneralServicesWidget extends StatelessWidget {
  final locationName;
  final locationCity;
  final locationPostal;
  final locationAddress1;
  final locationEmail;
  final locationPhone;

  FuneralServicesWidget({
    this.locationName,
    this.locationCity,
    this.locationPostal,
    this.locationAddress1,
    this.locationEmail,
    this.locationPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, bottom: 25),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
            bottomLeft: Radius.circular(13),
            bottomRight: Radius.circular(13)),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.red.withOpacity(0.175),
        //     spreadRadius: 1,
        //     blurRadius: 7,
        //     offset: Offset(1, 1),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 15,
                  ),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: mfLightGrey,
                        ),
                        child: Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        locationName,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: mfPrimaryColor,
                        ),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          onPressed: () async {
                            String address =
                                '$locationAddress1$locationCity$locationPostal$locationName';
                            // String address =
                            //     '${locationAddress1}${locationCity}${locationPostal}';
                            String query = Uri.encodeFull(address);
                            String googleUrl =
                                'https://www.google.com/maps/search/?api=1&query=$query';

                            if (await canLaunch(googleUrl)) {
                              await launch(googleUrl);
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          locationAddress1,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        onTap: () async {
                          String address =
                              '$locationAddress1$locationCity$locationPostal$locationName';
                          // String address =
                          //     '${locationAddress1}${locationCity}${locationPostal}';
                          String query = Uri.encodeFull(address);
                          String googleUrl =
                              'https://www.google.com/maps/search/?api=1&query=$query';

                          if (await canLaunch(googleUrl)) {
                            await launch(googleUrl);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: mfPrimaryColor,
                        ),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.message_outlined,
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          onPressed: () => launch('mailto:$locationEmail'),
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          locationEmail,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        onTap: () => launch('mailto:$locationEmail'),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: mfPrimaryColor,
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(
                          Icons.call_outlined,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(0),
                        onPressed: () => launch('tel://$locationPhone'),
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        locationPhone,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      onTap: () => launch('tel://$locationPhone'),
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
