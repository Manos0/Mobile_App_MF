import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mfapp_mobile/screens/tabs_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../bin/colors.dart';
import '../../bin/my_flutter_app_icons.dart';
import '../../providers/new_fundraiser.dart';
import '../../providers/provider.dart';

class FuneralServicePreviewScreen extends StatelessWidget {
  static const routeName = '/funeral-service-preview';

  static Future openLink({String url}) => _launchUrl(url);

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments as NewFundraiser;
    // DateTime dt = DateTime.parse(data.funeralService.venueDate);
    String dt;
    if (data.funeralService.venueDate != null) {
      DateTime passingDate =
          new DateFormat('yyyy-MM-dd').parse(data.funeralService.venueDate);
      dt = DateFormat.yMMMMd().format(passingDate);
    }
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        iconTheme: IconThemeData(color: mfLightGrey),
        title: Text(
          'Preview',
          style: TextStyle(
            color: mfLettersColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              if (data.funeralService.venueAdditionalInfo != null ||
                  data.funeralService.venueAddress != null ||
                  data.funeralService.venueCity != null ||
                  data.funeralService.venueDate != null ||
                  data.funeralService.venueName != null ||
                  data.funeralService.venuePhoneNumber != null ||
                  data.funeralService.venueState != null ||
                  data.funeralService.venueTime != null ||
                  data.funeralService.venueZipCode != null ||
                  data.funeralService.venueWebCast != null)
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[50],
                  ),
                  child: Column(
                    children: [
                      if (data.funeralService.venueName != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(17),
                              child: Icon(
                                FontAwesomeIcons.church,
                                size: 50,
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Text(
                                      'Venue Name',
                                      style: TextStyle(
                                        color: mfThrirdLetterColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data.funeralService.venueName,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: mfLettersColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      if (data.funeralService.venueDate != null ||
                          data.funeralService.venueTime != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(22, 15, 15, 15),
                                child: Icon(
                                  MyFlutterApp
                                      .i004_black_paper_calendar_with_spring,
                                  size: 50,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        'Date & Time',
                                        style: TextStyle(
                                          color: mfThrirdLetterColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    if (data.funeralService.venueDate != null)
                                      Text(
                                        dt,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: mfLettersColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    if (data.funeralService.venueTime != null)
                                      Text(
                                        data.funeralService.venueTime,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: mfLettersColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (data.funeralService.venueAddress != null &&
                          data.funeralService.venueCity != null &&
                          data.funeralService.venueState != null &&
                          data.funeralService.venueZipCode != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(22, 15, 15, 15),
                              child: Icon(
                                FontAwesomeIcons.mapMarkedAlt,
                                size: 50,
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                      color: mfThrirdLetterColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    data.funeralService.venueAddress +
                                        ', ' +
                                        data.funeralService.venueCity +
                                        ', ' +
                                        data.funeralService.venueState +
                                        ' ' +
                                        data.funeralService.venueZipCode,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: mfLettersColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      if (data.funeralService.venuePhoneNumber != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(22, 15, 15, 15),
                                child: Icon(
                                  MyFlutterApp.phone_volume,
                                  size: 50,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        'Venue Phone Number',
                                        style: TextStyle(
                                          color: mfThrirdLetterColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data.funeralService.venuePhoneNumber,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: mfLettersColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (data.funeralService.venueAddress != null &&
                          data.funeralService.venueCity != null &&
                          data.funeralService.venueState != null &&
                          data.funeralService.venueZipCode != null)
                        Column(
                          children: [
                            Divider(
                              color: mfThrirdLetterColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    color: mfLightBlueColor,
                                    size: 37,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    String address =
                                        '${data.funeralService.venueAddress}${data.funeralService.venueCity}${data.funeralService.venueZipCode}';
                                    String query = Uri.encodeFull(address);
                                    String googleUrl =
                                        'https://www.google.com/maps/search/?api=1&query=$query';

                                    if (await canLaunch(googleUrl)) {
                                      await launch(googleUrl);
                                    }
                                  },
                                  child: Text(
                                    'Get Directions',
                                    style: TextStyle(color: mfLettersColor),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue[100],
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      if (data.funeralService.venueWebCast != null)
                        Column(
                          children: [
                            Divider(
                              color: mfThrirdLetterColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    FontAwesomeIcons.solidPlayCircle,
                                    color: Colors.red[400],
                                    size: 37,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => openLink(
                                      url: data.funeralService.venueWebCast),
                                  child: Text(
                                    'Go to Webcast',
                                    style: TextStyle(color: mfLettersColor),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue[100],
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      if (data.funeralService.venueAdditionalInfo != null)
                        Column(
                          children: [
                            Divider(
                              color: mfThrirdLetterColor,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                data.funeralService.venueAdditionalInfo,
                                style: TextStyle(
                                  color: mfLightGrey,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 40),
                child: ElevatedButton(
                  child: Text(
                    'Complete Fundraiser',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: mfPrimaryColor,
                    shadowColor: mfPrimaryColor,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () {
                    Provider.of<Fundraisers>(context, listen: false)
                        .addNewFundraiser(data);
                    Navigator.pushNamedAndRemoveUntil(
                        context, TabsScreen.routeName, (r) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
