import 'package:flutter/material.dart';

import '../../bin/api_addresses.dart';
import '../../bin/colors.dart';

class SettingsWidget extends StatefulWidget {
  final settingData;

  SettingsWidget(this.settingData);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                        baseUrl + widget.settingData.photoUrl,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        '${widget.settingData.displayName}',
                        style: TextStyle(
                          color: mfLettersColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    )
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