import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bin/colors.dart';
import '../../providers/locations.dart';
import '../../screens/add_fundraiser/form_screen.dart';

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
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: locations);
      },
      splashFactory: InkRipple.splashFactory,
      splashColor: mfPrimaryColor,
      borderRadius: BorderRadius.circular(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 10,
        shadowColor: mfLightGrey,
        child: Container(
          margin: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(11),
                  ),
                  color: mfLightlightGrey,
                ),
                child: Icon(
                  Icons.house_rounded,
                  size: 42,
                  color: mfLightGrey,
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locations.name,
                        style: TextStyle(
                          color: mfSecondaryLetterColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      if (locations.city != null)
                        Text(
                          locations.city,
                          style: TextStyle(
                            color: mfLettersColor,
                            fontSize: 14,
                          ),
                        ),
                      if (locations.address1 != null)
                        Text(
                          locations.address1,
                          style: TextStyle(
                            color: mfLettersColor,
                            fontSize: 14,
                          ),
                        ),
                      if (locations.address2 != null)
                        Text(
                          locations.address2,
                          style: TextStyle(
                            color: mfLettersColor,
                            fontSize: 14,
                          ),
                        )
                      else
                        Text(
                          '',
                          style: TextStyle(
                            color: mfLettersColor,
                            fontSize: 14,
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
