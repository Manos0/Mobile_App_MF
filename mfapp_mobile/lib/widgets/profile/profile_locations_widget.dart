import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mfapp_mobile/bin/colors.dart';

import '../../providers/locations.dart';

class ProfileLocationsWidget extends StatefulWidget {
  List<Locations> locations;

  ProfileLocationsWidget(this.locations);

  @override
  _ProfileLocationsWidgetState createState() => _ProfileLocationsWidgetState();
}

class _ProfileLocationsWidgetState extends State<ProfileLocationsWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.locations.length > 0) {
      return ListView(
        padding: EdgeInsets.zero,
        children: List.generate(
          widget.locations.length,
          (index) {
            return Card(
              margin: EdgeInsets.only(bottom: 8, top: 5),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              child: Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Icon(
                        FontAwesomeIcons.church,
                        size: 30,
                        color: mfLettersColor,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.locations[index].name != null)
                            Text(
                              widget.locations[index].name,
                              style: TextStyle(
                                color: mfLettersColor,
                              ),
                            ),
                          if (widget.locations[index].address1 != null)
                            Text(
                              widget.locations[index].address1,
                              style: TextStyle(
                                color: mfLettersColor,
                              ),
                            ),
                          if (widget.locations[index].address2 != null)
                            Text(
                              widget.locations[index].address2,
                              style: TextStyle(
                                color: mfLettersColor,
                              ),
                            ),
                          if (widget.locations[index].city != null)
                            Text(
                              widget.locations[index].city,
                              style: TextStyle(
                                color: mfLettersColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: Text(
          'There are no available Locations.',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      );
    }
  }
}
