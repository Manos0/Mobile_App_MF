import 'package:flutter/material.dart';
import 'package:mfapp_mobile/providers/locations.dart';

import '../../bin/colors.dart';
import '../../widgets/add_fundraiser/decented_info/form_widget.dart';

class FormScreen extends StatelessWidget {
  static const routeName = '/form';

  @override
  Widget build(BuildContext context) {
    final selectedLocal =
        ModalRoute.of(context).settings.arguments as Locations;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        iconTheme: IconThemeData(color: mfLightGrey),
        title: Column(
          children: [
            Text(
              'Decedent Information',
              style: TextStyle(
                color: mfLettersColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'and fundraiser details',
              style: TextStyle(
                color: mfLettersColor,
                fontSize: 13,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, color2],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormWidget(
            locationData: selectedLocal,
          ),
        ),
      ),
    );
  }
}
