import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bin/colors.dart';
import '../../providers/locations.dart';
import '../../screens/add_fundraiser/decent_profile_and_details_screen.dart';

class LocationsCards extends StatefulWidget {
  // const LocationsCards({ Key? key }) : super(key: key);

  @override
  _LocationsCardsState createState() => _LocationsCardsState();
}

class _LocationsCardsState extends State<LocationsCards> {
  @override
  Widget build(BuildContext context) {
    final locations = Provider.of<Locations>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DecentProfileAndDetailsScreen.routeName,
            arguments: locations.name);
      },
      splashFactory: InkRipple.splashFactory,
      splashColor: mfPrimaryColor,
      borderRadius: BorderRadius.circular(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 10,
        shadowColor: mfPrimaryColor40,
        child: Container(
          margin: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(11)),
                  color: mfPrimaryColor,
                ),
                child: Icon(
                  Icons.house_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      locations.name,
                      style: TextStyle(
                        color: mfSecondaryLetterColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (locations.city != null)
                      Text(
                        locations.city,
                        style: TextStyle(
                          color: mfLettersColor,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    if (locations.address1 != null)
                      Text(
                        locations.address1,
                        style: TextStyle(
                          color: mfLettersColor,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    if (locations.address2 != null)
                      Text(
                        locations.address2,
                        style: TextStyle(
                          color: mfLettersColor,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
